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
#include "positioning.pb.h"
#include <stdint.h>

#define POSITIONING_TRUE 1
#define POSITIONING_FALSE 0
typedef int32_t PositioningBool;



#define POSITIONING_POS_INITIALIZER(x, y, z) \
  { x, y, z }
#define POSITIONING_POS_VEL_INITIALIZER(x, y, z, vx, vy, vz) \
  { { { x, y, z } }, vx, vy, vz }
#define POSITIONING_POS_VEL_ACC_INITIALIZER(x, y, z, vx, vy, vz, ax, ay, az) \
  { { { x, y, z, vx, vy, vz } }, ax, ay, az }


#define POSITIONING_GPS_PRN2SVID(prn) ((prn) - 1 + GPS_MIN_SVID)
#define POSITIONING_IS_GPS_SVID(svid) ((svid) >= GPS_MIN_SVID && (svid) <= GPS_MAX_SVID)

#define POSITIONING_BDS_PRN2SVID(prn) ((prn) - 1 + BDS_MIN_SVID)
#define POSITIONING_IS_BDS_SVID(svid) ((svid) >= BDS_MIN_SVID && (svid) <= BDS_MAX_SVID)
#define POSITIONING_IS_BDS_GEO_SVID(svid) ((svid) >= BDS_MIN_SVID && (svid) <= BDS_GEO_MAX_SVID)

#define POSITIONING_GAL_PRN2SVID(prn) ((prn) - 1 + GAL_MIN_SVID)
#define POSITIONING_IS_GAL_SVID(svid) ((svid) >= GAL_MIN_SVID && (svid) <= GAL_MAX_SVID)

#define POSITIONING_GLO_PRN2SVID(prn) ((prn) - 1 + GLO_MIN_SVID)
#define POSITIONING_IS_GLO_SVID(svid) ((svid) >= GLO_MIN_SVID && (svid) <= GLO_MAX_SVID)

typedef struct {
  union {
    PositioningCachedPvaAndEa cached_pva_and_ea;
    PositioningCachedPv cached_pv;
  };
} PositioningCachedInfo;


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
