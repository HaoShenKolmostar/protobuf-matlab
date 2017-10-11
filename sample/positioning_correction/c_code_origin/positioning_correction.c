/*
 * positioning_correction.c
 *
 *  Created on: Sep 14, 2017
 *      Author: GanBo bo.gan@kolmostar.com
 *
 * @note
 * Copyright(C) Kolmostar Inc., 2017
 * All rights reserved.
 */

#include "positioning_correction.h"
#include <math.h>

#define POSITIONING_RDBRPH POSITIONING_DOUBLE(9.4446912483340737E-01)

double PositioningSatClockErr(uint8_t sys,
                              const PositioningEphemerisPtr eph_ptr,
                              double ref_time) {
  if (sys < SYSTEM_USING_EPH_TYPE1_COUNT) {
    const PositioningEphemerisType1 *eph = eph_ptr.ehp_type1;
    ref_time -= eph->toc;
    if (ref_time < -POSITIONING_SECONDS_HALF_A_WEEK) {
      ref_time += POSITIONING_SECONDS_A_WEEK;
    } else if (ref_time > POSITIONING_SECONDS_HALF_A_WEEK) {
      ref_time -= POSITIONING_SECONDS_A_WEEK;
    }
    return (eph->af2 * ref_time + eph->af1) * ref_time + eph->af0;
  } else {
    const PositioningEphemerisType2 *eph = eph_ptr.ehp_type2;
    ref_time -= eph->tb;
    if (ref_time < -POSITIONING_SECONDS_HALF_A_DAY) {
      ref_time += POSITIONING_SECONDS_A_DAY;
    } else if (ref_time > POSITIONING_SECONDS_HALF_A_DAY) {
      ref_time -= POSITIONING_SECONDS_A_DAY;
    }
    return eph->gamma * ref_time - eph->tau;
  }
}

double PositioningRelativisticCorr(const PositioningEphemerisType1 *eph,
                                   double Ek) {
  double f;
  if (POSITIONING_IS_GPS_SVID(eph->svid)) {
    f = POSITIONING_WGS84_F;
  } else if (POSITIONING_IS_BDS_SVID(eph->svid)) {
    f = POSITIONING_CGCS2000_F;
  } else if (POSITIONING_IS_GAL_SVID(eph->svid)) {
    f = POSITIONING_GTRF_F;
  } else {
    return 0;
  }
  return f * eph->e * eph->sqrt_a * sin(Ek);
}

double PositioningGpsIonoDelay(const PositioningIonoParam *iono_param,
                               const PositioningLatLonAlt *lla,
                               int32_t receiver_time,
                               const PositioningElAz *el_az) {
  double el = el_az->el / POSITIONING_PI;
  double x = POSITIONING_DOUBLE(0.53) - el;
  double F = 1 + 16 * x * x * x;
  double psi = POSITIONING_DOUBLE(0.0137)
      / (el + POSITIONING_DOUBLE(0.11))-POSITIONING_DOUBLE(0.022);
  double phii = lla->lat / POSITIONING_PI + psi * cos(el_az->az);
  if (phii < POSITIONING_DOUBLE(-0.416)) {
    phii = POSITIONING_DOUBLE(-0.416);
  } else if (phii > POSITIONING_DOUBLE(0.416)) {
    phii = POSITIONING_DOUBLE(0.416);
  }
  double lambdai = lla->lon / POSITIONING_PI
      + psi * sin(el_az->az) / cos(phii * POSITIONING_PI);
  double phim = phii
      + POSITIONING_DOUBLE(0.064)
          * cos((lambdai - POSITIONING_DOUBLE(1.617)) * POSITIONING_PI);
  double AMP = ((iono_param->alpha3 * phim + iono_param->alpha2) * phim
      + iono_param->alpha1) * phim + iono_param->alpha0;
  double coeff = POSITIONING_DOUBLE(5.0E-9);
  if (AMP > 0) {
    double t = fmod(lambdai * POSITIONING_SECONDS_HALF_A_DAY
                        + receiver_time * POSITIONING_DOUBLE(0.001),
                    POSITIONING_SECONDS_A_DAY);
    if (t < 0) {
      t += POSITIONING_SECONDS_A_DAY;
    }
    double PER = ((iono_param->beta3 * phim + iono_param->beta2) * phim
        + iono_param->beta1) * phim + iono_param->beta0;
    if (PER < 72000) {
      PER = 72000;
    }
    x = POSITIONING_2PI * (t - 50400) / PER;
    if (fabs(x) < POSITIONING_DOUBLE(1.57)) {
      double x2 = x * x;
      coeff += AMP * (1 - x2 / 2 + x2 * x2 / 24);
    }
  }
  return F * coeff;
}

double PositioningBdsIonoDelay(const PositioningIonoParam *iono_param,
                               const PositioningLatLonAlt *lla,
                               int32_t receiver_time,
                               const PositioningElAz *el_az) {
  double x = POSITIONING_RDBRPH * cos(el_az->el);
  double F = 1 / sqrt(1 - x * x);
  double psi = POSITIONING_HALF_PI - el_az->el - asin(x);
  double cos_psi = cos(psi);
  double sin_psi = sin(psi);
  double phim = asin(sin(lla->lat) * cos_psi
      + cos(lla->lat) * sin_psi * cos(el_az->az));
  double lambdam = lla->lon + asin(sin_psi * sin(el_az->az) / cos(phim));
  phim /= POSITIONING_PI;
  double A2 = ((iono_param->alpha3 * phim + iono_param->alpha2) * phim
      + iono_param->alpha1) * phim + iono_param->alpha0;
  double coeff = POSITIONING_DOUBLE(5.0E-9);
  if (A2 > 0) {
    double t = fmod(lambdam / POSITIONING_PI * POSITIONING_SECONDS_HALF_A_DAY
                        + receiver_time * POSITIONING_DOUBLE(0.001),
                    POSITIONING_SECONDS_A_DAY);
    if (t < 0) {
      t += POSITIONING_SECONDS_A_DAY;
    }
    double A4 = ((iono_param->beta3 * phim + iono_param->beta2) * phim
        + iono_param->beta1) * phim + iono_param->beta0;
    if (A4 < 72000) {
      A4 = 72000;
    } else if (A4 > 172800) {
      A4 = 172800;
    }
    x = (t - 50400) / A4;
    if (fabs(x) < POSITIONING_DOUBLE(0.25)) {
      coeff += A2 * cos(POSITIONING_2PI * x);
    }
  }
  return F * coeff;
}

double PositioningIonoDelay(uint8_t sys,
                            const PositioningIonoParam iono_param[],
                            const PositioningLatLonAlt *lla,
                            const int32_t receiver_time[],
                            const PositioningElAz *el_az) {
  if (sys == SYSTEM_BDS) {
    if (iono_param[SYSTEM_BDS].flag == IONO_PARAM_ALL_VALID) {
      return PositioningBdsIonoDelay(&iono_param[SYSTEM_BDS],
                                     lla,
                                     receiver_time[SYSTEM_BDS],
                                     el_az);
    } else if (iono_param[SYSTEM_GPS].flag == IONO_PARAM_ALL_VALID) {
      return PositioningGpsIonoDelay(&iono_param[SYSTEM_GPS],
                                     lla,
                                     receiver_time[SYSTEM_GPS],
                                     el_az);
    }
  } else {
    if (iono_param[SYSTEM_GPS].flag == IONO_PARAM_ALL_VALID) {
      return PositioningGpsIonoDelay(&iono_param[SYSTEM_GPS],
                                     lla,
                                     receiver_time[SYSTEM_GPS],
                                     el_az);
    } else if (iono_param[SYSTEM_BDS].flag == IONO_PARAM_ALL_VALID) {
      return PositioningBdsIonoDelay(&iono_param[SYSTEM_BDS],
                                     lla,
                                     receiver_time[SYSTEM_BDS],
                                     el_az);
    }
  }
  return 0;
}

double PositioningTropoDelay(double el) {
  double el_square = el * el;
  return POSITIONING_DOUBLE(7.712e-9)
      / sin(sqrt(el_square + POSITIONING_DOUBLE(1.904e-3)))
      + POSITIONING_DOUBLE(2.802e-10)
          / sin(sqrt(el_square + POSITIONING_DOUBLE(6.854e-4)));
}
