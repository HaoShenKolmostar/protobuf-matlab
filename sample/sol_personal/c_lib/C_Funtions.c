

#include "C_Funtions.h"

void Reset_Pos(GPS_EPHEMERIS * GPS_EPHEMERIS,PositioningReceiverInfo * PositioningReceiverInfo, PositioningLatLonAlt  * PositioningLatLonAlt){
    PositioningLatLonAlt->lat = PositioningReceiverInfo->lla.lat + GPS_EPHEMERIS->svid + 1;
    PositioningLatLonAlt->lon = PositioningReceiverInfo->lla.lon + GPS_EPHEMERIS->ecc + 2;
    PositioningLatLonAlt->alt = PositioningReceiverInfo->lla.alt + GPS_EPHEMERIS->af0 + 3;
}


void Many_Eph(int * eph_nums,List_GPS_EPHEMERIS *list2, float * f1,float * f2 ,char * c1,char * c2,List_GPS_EPHEMERIS *list){
    list->items_count = *eph_nums;
    list2->items_count = *eph_nums;
    for ( int i = 0 ; i < *eph_nums ; i++){
        list->items[i].af0 = f1[i];
        list->items[i].af1 = f2[i];
        list->items[i].iode2 = c1[i];
        list->items[i].iode3 = c2[i];
        
        list2->items[i].af0 = f1[i] + 1;
        list2->items[i].af1 = f2[i] + 1;
        list2->items[i].iode2 = c1[i] + 1;
        list2->items[i].iode3 = c2[i] + 1;
    }
}
