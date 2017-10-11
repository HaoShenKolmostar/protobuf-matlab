function [positioning_cached_pva_and_ea] = pb_read_PositioningCachedPvaAndEa(buffer, buffer_start, buffer_end)
%pb_read_PositioningCachedPvaAndEa Reads the protobuf message PositioningCachedPvaAndEa.
%   function [positioning_cached_pva_and_ea] = pb_read_PositioningCachedPvaAndEa(buffer, buffer_start, buffer_end)
%
%   INPUTS:
%     buffer       : a buffer of uint8's to parse
%     buffer_start : optional starting index to consider of the buffer
%                    defaults to 1
%     buffer_end   : optional ending index to consider of the buffer
%                    defaults to length(buffer)
%
%   MEMBERS:
%     flag           : optional int32, defaults to int32(0).
%     svid           : optional int32, defaults to int32(0).
%     reserved       : optional uint32, defaults to uint32(0).
%     toe            : optional int32, defaults to int32(0).
%     sec_time       : repeated int32, defaults to int32([]).
%     pva            : repeated <a href="matlab:help pb_read_PositioningPosVelAcc">PositioningPosVelAcc</a>, defaults to struct([]).
%     ea             : repeated <a href="matlab:help pb_read_PositioningEccentricAnomaly">PositioningEccentricAnomaly</a>, defaults to struct([]).
%
%   See also pb_read_PositioningPosVelAcc, pb_read_PositioningEccentricAnomaly, pb_read_PositioningUtcTime, pb_read_PositioningPos, pb_read_PositioningPosVel, pb_read_PositioningLatLonAlt, pb_read_PositioningEphemerisType1, pb_read_PositioningEphemerisType2, pb_read_PositioningAlmanac, pb_read_PositioningIonoParam, pb_read_PositioningUtcParam, pb_read_PositioningNavMessage, pb_read_PositioningReceiverInfo, pb_read_PositioningCachedPv, pb_read_PositioningMeasurement, pb_read_PositioningElAz, pb_read_PositioningSatInfo, pb_read_PositioningHMatrix, pb_read_PositioningPvtBuffer.

  if (nargin < 1)
    buffer = uint8([]);
  end
  if (nargin < 2)
    buffer_start = 1;
  end
  if (nargin < 3)
    buffer_end = length(buffer);
  end

  descriptor = pb_descriptor_PositioningCachedPvaAndEa();
  positioning_cached_pva_and_ea = pblib_generic_parse_from_string(buffer, descriptor, buffer_start, buffer_end);
  positioning_cached_pva_and_ea.descriptor_function = pb_descriptor_PositioningCachedPvaAndEa();
