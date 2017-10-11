function [positioning_almanac] = pb_read_PositioningAlmanac(buffer, buffer_start, buffer_end)
%pb_read_PositioningAlmanac Reads the protobuf message PositioningAlmanac.
%   function [positioning_almanac] = pb_read_PositioningAlmanac(buffer, buffer_start, buffer_end)
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
%     health         : optional int32, defaults to int32(0).
%     flag2          : optional int32, defaults to int32(0).
%     week           : optional int32, defaults to int32(0).
%     toa            : optional int32, defaults to int32(0).
%     reserved       : optional int32, defaults to int32(0).
%     sqrt_a         : optional double, defaults to double(0).
%     e              : optional double, defaults to double(0).
%     i0             : optional double, defaults to double(0).
%     omega0         : optional double, defaults to double(0).
%     w              : optional double, defaults to double(0).
%     M0             : optional double, defaults to double(0).
%     omega_dot      : optional double, defaults to double(0).
%     af0            : optional double, defaults to double(0).
%     af1            : optional double, defaults to double(0).
%     a              : optional double, defaults to double(0).
%     ae             : optional double, defaults to double(0).
%     n              : optional double, defaults to double(0).
%     sqrt_1me2      : optional double, defaults to double(0).
%     omega_temp     : optional double, defaults to double(0).
%     delta_omega    : optional double, defaults to double(0).
%
%   See also pb_read_PositioningUtcTime, pb_read_PositioningPos, pb_read_PositioningPosVel, pb_read_PositioningPosVelAcc, pb_read_PositioningLatLonAlt, pb_read_PositioningEccentricAnomaly, pb_read_PositioningEphemerisType1, pb_read_PositioningEphemerisType2, pb_read_PositioningIonoParam, pb_read_PositioningUtcParam, pb_read_PositioningNavMessage, pb_read_PositioningReceiverInfo, pb_read_PositioningCachedPvaAndEa, pb_read_PositioningCachedPv, pb_read_PositioningMeasurement, pb_read_PositioningElAz, pb_read_PositioningSatInfo, pb_read_PositioningHMatrix, pb_read_PositioningPvtBuffer.

  if (nargin < 1)
    buffer = uint8([]);
  end
  if (nargin < 2)
    buffer_start = 1;
  end
  if (nargin < 3)
    buffer_end = length(buffer);
  end

  descriptor = pb_descriptor_PositioningAlmanac();
  positioning_almanac = pblib_generic_parse_from_string(buffer, descriptor, buffer_start, buffer_end);
  positioning_almanac.descriptor_function = pb_descriptor_PositioningAlmanac();
