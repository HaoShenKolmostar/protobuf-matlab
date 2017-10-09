/* Automatically generated nanopb header */
/* Generated by nanopb-0.3.8 at Fri Sep 29 15:34:50 2017. */

#ifndef PB_POS_PB_H_INCLUDED
#define PB_POS_PB_H_INCLUDED
#include <pb.h>

/* @@protoc_insertion_point(includes) */
#if PB_PROTO_HEADER_VERSION != 30
#error Regenerate this file with the current version of nanopb generator.
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* Struct definitions */
typedef struct _PositioningLatLonAlt {
    double lat;
    double lon;
    double alt;
/* @@protoc_insertion_point(struct:PositioningLatLonAlt) */
} PositioningLatLonAlt;

typedef struct _PositioningPosvel {
    double x;
    double y;
    double z;
    double vx;
    double vy;
    double vz;
/* @@protoc_insertion_point(struct:PositioningPosvel) */
} PositioningPosvel;

typedef struct _PositioningReceiverInfo {
    PositioningPosvel pv;
    PositioningLatLonAlt lla;
    pb_size_t receiver_time_count;
    double receiver_time[3];
    double clock_drift;
/* @@protoc_insertion_point(struct:PositioningReceiverInfo) */
} PositioningReceiverInfo;

typedef struct _List_PositioningReceiverInfo {
    pb_size_t items_count;
    PositioningReceiverInfo items[100];
/* @@protoc_insertion_point(struct:List_PositioningReceiverInfo) */
} List_PositioningReceiverInfo;

/* Default values for struct fields */

/* Initializer values for message structs */
#define List_PositioningReceiverInfo_init_default {0, {PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default, PositioningReceiverInfo_init_default}}
#define PositioningReceiverInfo_init_default     {PositioningPosvel_init_default, PositioningLatLonAlt_init_default, 0, {0, 0, 0}, 0}
#define PositioningLatLonAlt_init_default        {0, 0, 0}
#define PositioningPosvel_init_default           {0, 0, 0, 0, 0, 0}
#define List_PositioningReceiverInfo_init_zero   {0, {PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero, PositioningReceiverInfo_init_zero}}
#define PositioningReceiverInfo_init_zero        {PositioningPosvel_init_zero, PositioningLatLonAlt_init_zero, 0, {0, 0, 0}, 0}
#define PositioningLatLonAlt_init_zero           {0, 0, 0}
#define PositioningPosvel_init_zero              {0, 0, 0, 0, 0, 0}

/* Field tags (for use in manual encoding/decoding) */
#define PositioningLatLonAlt_lat_tag             1
#define PositioningLatLonAlt_lon_tag             2
#define PositioningLatLonAlt_alt_tag             3
#define PositioningPosvel_x_tag                  1
#define PositioningPosvel_y_tag                  2
#define PositioningPosvel_z_tag                  3
#define PositioningPosvel_vx_tag                 4
#define PositioningPosvel_vy_tag                 5
#define PositioningPosvel_vz_tag                 6
#define PositioningReceiverInfo_pv_tag           1
#define PositioningReceiverInfo_lla_tag          2
#define PositioningReceiverInfo_receiver_time_tag 3
#define PositioningReceiverInfo_clock_drift_tag  4
#define List_PositioningReceiverInfo_items_tag   1

/* Struct field encoding specification for nanopb */
extern const pb_field_t List_PositioningReceiverInfo_fields[2];
extern const pb_field_t PositioningReceiverInfo_fields[5];
extern const pb_field_t PositioningLatLonAlt_fields[4];
extern const pb_field_t PositioningPosvel_fields[7];

/* Maximum encoded size of messages (where known) */
#define List_PositioningReceiverInfo_size        12300
#define PositioningReceiverInfo_size             121
#define PositioningLatLonAlt_size                27
#define PositioningPosvel_size                   54

/* Message IDs (where set with "msgid" option) */
#ifdef PB_MSGID

#define POS_MESSAGES \


#endif

#ifdef __cplusplus
} /* extern "C" */
#endif
/* @@protoc_insertion_point(eof) */

#endif