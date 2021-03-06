function [positioning_utc_time] = pb_read_PositioningUtcTime(buffer, buffer_start, buffer_end)
%pb_read_PositioningUtcTime Reads the protobuf message PositioningUtcTime.
%   function [positioning_utc_time] = pb_read_PositioningUtcTime(buffer, buffer_start, buffer_end)
%
%   INPUTS:
%     buffer       : a buffer of uint8's to parse
%     buffer_start : optional starting index to consider of the buffer
%                    defaults to 1
%     buffer_end   : optional ending index to consider of the buffer
%                    defaults to length(buffer)
%
%   MEMBERS:
%     year           : optional int32, defaults to int32(0).
%     month          : optional int32, defaults to int32(0).
%     day            : optional int32, defaults to int32(0).
%     hour           : optional int32, defaults to int32(0).
%     minute         : optional int32, defaults to int32(0).
%     second         : optional int32, defaults to int32(0).
%     millisecond    : optional int32, defaults to int32(0).
%
%   See also pb_read_PositioningPos, pb_read_PositioningPosVel, pb_read_PositioningPosVelAcc, pb_read_PositioningLatLonAlt, pb_read_PositioningEccentricAnomaly, pb_read_PositioningEphemerisType1, pb_read_PositioningEphemerisType2, pb_read_PositioningAlmanac, pb_read_PositioningIonoParam, pb_read_PositioningUtcParam, pb_read_PositioningNavMessage, pb_read_PositioningReceiverInfo, pb_read_PositioningCachedPvaAndEa, pb_read_PositioningCachedPv, pb_read_PositioningMeasurement, pb_read_PositioningElAz, pb_read_PositioningSatInfo, pb_read_PositioningHMatrix, pb_read_PositioningPvtBuffer.

  if (nargin < 1)
    buffer = uint8([]);
  end
  if (nargin < 2)
    buffer_start = 1;
  end
  if (nargin < 3)
    buffer_end = length(buffer);
  end

  descriptor = pb_descriptor_PositioningUtcTime();
  positioning_utc_time = pblib_generic_parse_from_string(buffer, descriptor, buffer_start, buffer_end);
  positioning_utc_time.descriptor_function = pb_descriptor_PositioningUtcTime();
