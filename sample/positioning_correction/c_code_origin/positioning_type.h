/*
 * positioning_type.h
 *
 *  Created on: Apr 21, 2017
 *      Author: GanBo bo.gan@kolmostar.com
 *
 * @note
 * Copyright(C) Kolmostar Inc., 2017
 * All rights reserved.
 */

#ifndef INC_POSITIONING_TYPE_H_
#define INC_POSITIONING_TYPE_H_

#include "positioning_const.h"
#include <stdint.h>

#define POSITIONING_TRUE 1
#define POSITIONING_FALSE 0
typedef int32_t PositioningBool;

typedef struct {
  int32_t year;
  int16_t month;
  int16_t day;
  int16_t hour;
  int16_t minute;
  int16_t second;
  int16_t millisecond;
} PositioningUtcTime;

typedef struct {
  double x, y, z;
} PositioningPos;

typedef struct {
  union {
    struct {
      double x, y, z;
    };
    PositioningPos p;
  };
  double vx, vy, vz;
} PositioningPosVel;

typedef struct {
  union {
    struct {
      double x, y, z;
      double vx, vy, vz;
    };
    PositioningPosVel pv;
  };
  double ax, ay, az;
} PositioningPosVelAcc;

#define POSITIONING_POS_INITIALIZER(x, y, z) \
  { x, y, z }
#define POSITIONING_POS_VEL_INITIALIZER(x, y, z, vx, vy, vz) \
  { { { x, y, z } }, vx, vy, vz }
#define POSITIONING_POS_VEL_ACC_INITIALIZER(x, y, z, vx, vy, vz, ax, ay, az) \
  { { { x, y, z, vx, vy, vz } }, ax, ay, az }

typedef struct {
  double lat;
  double lon;
  double alt;
} PositioningLatLonAlt;

typedef struct {
  double Ek;        // Eccentric anomaly.
  double Ek_dot;    // Rate of change of eccentric anomaly.
} PositioningEccentricAnomaly;

typedef enum {
  SYSTEM_GPS,
  SYSTEM_BDS,
  SYSTEM_GAL,
  SYSTEM_GLO,
  SYSTEM_COUNT,
  SYSTEM_USING_EPH_TYPE1_COUNT = SYSTEM_GLO,
  SYSTEM_USING_EPH_TYPE2_COUNT = SYSTEM_COUNT - SYSTEM_GLO,
} PositioningSystem;

typedef enum {
  GPS_SV_COUNT = 32,
  GPS_MIN_SVID = 1,
  GPS_MAX_SVID = GPS_MIN_SVID + GPS_SV_COUNT - 1,

  BDS_SV_COUNT = 35,
  BDS_GEO_SV_COUNT = 5,
  BDS_MIN_SVID = 41,
  BDS_MAX_SVID = BDS_MIN_SVID + BDS_SV_COUNT - 1,
  BDS_GEO_MAX_SVID = BDS_MIN_SVID + BDS_GEO_SV_COUNT - 1,

  GAL_SV_COUNT = 30,
  GAL_MIN_SVID = 81,
  GAL_MAX_SVID = GAL_MIN_SVID + GAL_SV_COUNT - 1,

  GLO_SV_COUNT = 26,
  GLO_MIN_SVID = 131,
  GLO_MAX_SVID = GLO_MIN_SVID + GLO_SV_COUNT - 1,
} PositioningCommonInfo;

#define POSITIONING_GPS_PRN2SVID(prn) ((prn) - 1 + GPS_MIN_SVID)
#define POSITIONING_IS_GPS_SVID(svid) ((svid) >= GPS_MIN_SVID && (svid) <= GPS_MAX_SVID)

#define POSITIONING_BDS_PRN2SVID(prn) ((prn) - 1 + BDS_MIN_SVID)
#define POSITIONING_IS_BDS_SVID(svid) ((svid) >= BDS_MIN_SVID && (svid) <= BDS_MAX_SVID)
#define POSITIONING_IS_BDS_GEO_SVID(svid) ((svid) >= BDS_MIN_SVID && (svid) <= BDS_GEO_MAX_SVID)

#define POSITIONING_GAL_PRN2SVID(prn) ((prn) - 1 + GAL_MIN_SVID)
#define POSITIONING_IS_GAL_SVID(svid) ((svid) >= GAL_MIN_SVID && (svid) <= GAL_MAX_SVID)

#define POSITIONING_GLO_PRN2SVID(prn) ((prn) - 1 + GLO_MIN_SVID)
#define POSITIONING_IS_GLO_SVID(svid) ((svid) >= GLO_MIN_SVID && (svid) <= GLO_MAX_SVID)

// ephemeris for GPS, BDS, GAL, etc.
typedef struct {
  uint8_t flag;     // zero, invalid; nonzero, valid.
  uint8_t svid;
  uint8_t health;
  uint8_t ura;
  int32_t week;
  int32_t toe;      // Reference time of almanac.
  int32_t toc;      // Reference time of clock.
  double sqrt_a;    // Square root of semimajor axis.
  double e;         // Eccentricity.
  double i0;        // Inclination angle at reference time.
  double omega0;    // Longitude of the ascending node at weekly epoch.
  double w;         // Argument of perigee.
  double M0;        // Mean anomaly at reference time.
  double omega_dot; // Rate of change of longitude of the ascending node.
  double af0;
  double af1;
  // Derived data.
  double a;         // Semimajor axis.
  double ae;        // Semimajor axis multiplied by eccentricity.
  double sqrt_1me2;
  double n;         // Mean motion.
  double omega_temp;
  double delta_omega;
  // Ephemeris proprietary data.
  double delta_n;   // Mean motion correction.
  double i_dot;     // Rate of change of inclination angle.
  double cuc;       // Amplitude of cosine correction to argument of latitude.
  double cus;       // Amplitude of sine correction to argument of latitude.
  double crc;       // Amplitude of cosine correction to orbital radius.
  double crs;       // Amplitude of sine correction to orbital radius.
  double cic;       // Amplitude of cosine correction to inclination angle.
  double cis;       // Amplitude of sine correction to inclination angle.
  double af2;
  double tgd;
  double tgd2;
} PositioningEphemerisType1;

// ephemeris for GLO, etc.
typedef struct {
  uint8_t flag;     // zero, invalid; nonzero, valid.
  uint8_t svid;
  uint8_t health;
  uint8_t reserved;
  int32_t tb;
  double tau;
  double gamma;
  double x, y, z;     // Satellite position.
  double vx, vy, vz;  // Satellite velocity.
  double ax, ay, az;  // Satellite acceleration due to lunar-solar attraction.
} PositioningEphemerisType2;

typedef struct {
  uint8_t flag;     // zero, invalid; nonzero, valid.
  uint8_t svid;
  uint8_t health;
  uint8_t flag2;
  int32_t week;
  int32_t toa;      // Reference time of almanac.
  int32_t reserved;
  double sqrt_a;    // Square root of semimajor axis.
  double e;         // Eccentricity.
  double i0;        // Inclination angle at reference time.
  double omega0;    // Longitude of the ascending node at weekly epoch.
  double w;         // Argument of perigee.
  double M0;        // Mean anomaly at reference time.
  double omega_dot; // Rate of change of longitude of the ascending node.
  double af0;
  double af1;
  // Derived data.
  double a;         // Semimajor axis.
  double ae;        // Semimajor axis multiplied by eccentricity.
  double n;         // Mean motion.
  double sqrt_1me2;
  double omega_temp;
  double delta_omega;
} PositioningAlmanac;

typedef enum {
  IONO_PARAM_ALPHA0_VALID = 0x01,
  IONO_PARAM_ALPHA1_VALID = 0x02,
  IONO_PARAM_ALPHA2_VALID = 0x04,
  IONO_PARAM_ALPHA3_VALID = 0x08,
  IONO_PARAM_BETA0_VALID = 0x10,
  IONO_PARAM_BETA1_VALID = 0x20,
  IONO_PARAM_BETA2_VALID = 0x40,
  IONO_PARAM_BETA3_VALID = 0x80,
  IONO_PARAM_ALL_VALID = 0xFF,
} PositioningIonoParamFlag;

typedef struct {
  uint8_t flag;     // See PositioningIonoParamFlag.
  float alpha0;
  float alpha1;
  float alpha2;
  float alpha3;
  float beta0;
  float beta1;
  float beta2;
  float beta3;
} PositioningIonoParam;

typedef enum {
  UTC_PARAM_DELTA_TLS_VALID = 0x01,
  UTC_PARAM_DELTA_TLSF_VALID = 0x02,
  UTC_PARAM_DN_VALID = 0x04,
  UTC_PARAM_WNT_VALID = 0x08,
  UTC_PARAM_WNLSF_VALID = 0x10,
  UTC_PARAM_TOT_VALID = 0x20,
  UTC_PARAM_A0_VALID = 0x40,
  UTC_PARAM_A1_VALID = 0x80,
  UTC_PARAM_ALL_VALID = 0xFF,
} PositioningUtcParamFlag;

typedef struct {
  uint8_t flag;     // See PositioningUtcParamFlag.
  uint8_t delta_tLS;
  uint8_t delta_tLSF;
  uint8_t DN;
  uint16_t WNt;
  uint16_t WNLSF;
  uint32_t tot;
  double A0;
  double A1;
} PositioningUtcParam;

typedef struct {
  PositioningEphemerisType1 *eph_type1[SYSTEM_USING_EPH_TYPE1_COUNT];
  PositioningEphemerisType2 *eph_type2[SYSTEM_USING_EPH_TYPE2_COUNT];
  PositioningAlmanac *alm[SYSTEM_COUNT];
  PositioningIonoParam *iono_param;
  PositioningUtcParam *utc_param;
} PositioningNavMessage;

typedef enum {
  FULL_TIME_IS_ACCURATE = 0,
  SUB_20MS_TIME_IS_ACCURATE = 1,
  SUB_1MS_TIME_IS_ACCURATE = 2,
} PositioningTimeAccuracyType;

typedef struct {
  PositioningPosVel pv;
  PositioningLatLonAlt lla;
  int32_t receiver_time_integer_part[SYSTEM_COUNT];
  double receiver_time_fraction_part[SYSTEM_COUNT];
  double clock_drift;
} PositioningReceiverInfo;

// Cached informations for GPS, BDS, GAL, etc.
typedef struct {
  uint8_t flag;     // zero, not bind; nonzero, bind.
  uint8_t svid;
  uint16_t reserved;
  int32_t toe;
  int32_t sec_time[2];
  PositioningPosVelAcc pva[2];
  PositioningEccentricAnomaly ea[2];
} PositioningCachedPvaAndEa;

// Cached informations for GLO, etc.
typedef struct {
  uint8_t flag;     // zero, not bind; nonzero, bind.
  uint8_t svid;
  uint16_t reserved;
  int32_t tb;
  double sec_time;
  PositioningPosVel pv;
} PositioningCachedPv;

typedef struct {
  union {
    PositioningCachedPvaAndEa cached_pva_and_ea;
    PositioningCachedPv cached_pv;
  };
} PositioningCachedInfo;

typedef struct {
  uint8_t sys;
  uint8_t svid;
  uint16_t cn0;
  int32_t transmit_time_integer_part;
  double transmit_time_fraction_part;
  double doppler;
} PositioningMeasurement;

typedef struct {
  double el;        // Elevation.
  double az;        // Azimuth.
} PositioningElAz;

typedef struct {
  double sat_clock_err;
  PositioningPosVel pv;
  double Ek;
  PositioningElAz el_az;
  double pseudo_range_corr;
} PositioningSatInfo;

typedef struct {
  uint32_t sat_count[SYSTEM_COUNT];
  double value[4][POSITIONING_MAX_CHANNEL]; // x, y, z, coarse-time.
  double weight[POSITIONING_MAX_CHANNEL];
} PositioningHMatrix;

// Since there are maximum 4 + SYSTEM_COUNT unknown variables
// which are x, y, z, coarse-time and time for each system,
// the vector size should be 4 + SYSTEM_COUNT and the matrix size
// should be (4 + SYSTEM_COUNT) * (4 + SYSTEM_COUNT).
// Since the matrix HtWH is a symmetric matrix, size
// (SYSTEM_COUNT + 4) * (SYSTEM_COUNT + 5) / 2 is enough to store the matrix.
typedef struct {
  double state_vector[4 + SYSTEM_COUNT];
  PositioningHMatrix h_matrix;
  double delta_msr[POSITIONING_MAX_CHANNEL];
  double temp_matrix[(SYSTEM_COUNT + 4) * (SYSTEM_COUNT + 5) / 2];
  double temp_vector[4 + SYSTEM_COUNT];
} PositioningPvtBuffer;

typedef struct {
  union {
    PositioningEphemerisType1 *ehp_type1;
    PositioningEphemerisType2 *ehp_type2;
  };
} PositioningEphemerisPtr;

typedef struct {
  PositioningMeasurement *measurement;
  PositioningEphemerisPtr eph_ptr;
  PositioningCachedInfo *cached_info;
  PositioningSatInfo *sat_info;
} PositioningBindInfo;

#endif /* INC_POSITIONING_TYPE_H_ */
