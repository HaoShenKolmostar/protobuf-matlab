/*
 * positioning_correction.h
 *
 *  Created on: Sep 14, 2017
 *      Author: GanBo bo.gan@kolmostar.com
 *
 * @note
 * Copyright(C) Kolmostar Inc., 2017
 * All rights reserved.
 */

#ifndef INC_POSITIONING_CORRECTION_H_
#define INC_POSITIONING_CORRECTION_H_

#include "positioning_type.h"

extern double PositioningSatClockErr(uint8_t sys,
                                     const PositioningEphemerisPtr eph_ptr,
                                     double ref_time);

extern double PositioningRelativisticCorr(const PositioningEphemerisType1 *eph,
                                          double Ek);

extern double PositioningGpsIonoDelay(const PositioningIonoParam *iono_param,
                                      const PositioningLatLonAlt *lla,
                                      int32_t receiver_time,
                                      const PositioningElAz *el_az);
extern double PositioningBdsIonoDelay(const PositioningIonoParam *iono_param,
                                      const PositioningLatLonAlt *lla,
                                      int32_t receiver_time,
                                      const PositioningElAz *el_az);
extern double PositioningIonoDelay(uint8_t sys,
                                   const PositioningIonoParam iono_param[],
                                   const PositioningLatLonAlt *lla,
                                   const int32_t receiver_time[],
                                   const PositioningElAz *el_az);

extern double PositioningTropoDelay(double el);

#endif /* INC_POSITIONING_CORRECTION_H_ */
