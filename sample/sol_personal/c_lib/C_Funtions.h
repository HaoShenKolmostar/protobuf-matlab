#ifndef C_Funtions_h
#define C_Funtions_h

#include <stdio.h>
#include "eph.pb.h"
#include "pos.pb.h"

#endif /* C_Funtions_h */

void Reset_Pos(GPS_EPHEMERIS * eph,PositioningReceiverInfo * origin_info, PositioningLatLonAlt * result);
int Many_Eph(int eph_nums,List_GPS_EPHEMERIS *list2, float * f1,float * f2 ,char * c1,char * c2,List_GPS_EPHEMERIS *list);
