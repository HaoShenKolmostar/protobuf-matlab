function [positioning_iono_param] = pb_read_PositioningIonoParam(buffer, buffer_start, buffer_end)
%pb_read_PositioningIonoParam Reads the protobuf message PositioningIonoParam.
%   function [positioning_iono_param] = pb_read_PositioningIonoParam(buffer, buffer_start, buffer_end)
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
%     alpha0         : optional single, defaults to single(0).
%     alpha1         : optional single, defaults to single(0).
%     alpha2         : optional single, defaults to single(0).
%     alpha3         : optional single, defaults to single(0).
%     beta0          : optional single, defaults to single(0).
%     beta1          : optional single, defaults to single(0).
%     beta2          : optional single, defaults to single(0).
%     beta3          : optional single, defaults to single(0).
%
%   See also pb_read_PositioningUtcTime, pb_read_PositioningPos, pb_read_PositioningPosVel, pb_read_PositioningPosVelAcc, pb_read_PositioningLatLonAlt, pb_read_PositioningEccentricAnomaly, pb_read_PositioningEphemerisType1, pb_read_PositioningEphemerisType2, pb_read_PositioningAlmanac, pb_read_PositioningUtcParam, pb_read_PositioningNavMessage, pb_read_PositioningReceiverInfo, pb_read_PositioningCachedPvaAndEa, pb_read_PositioningCachedPv, pb_read_PositioningMeasurement, pb_read_PositioningElAz, pb_read_PositioningSatInfo, pb_read_PositioningHMatrix, pb_read_PositioningPvtBuffer.

  if (nargin < 1)
    buffer = uint8([]);
  end
  if (nargin < 2)
    buffer_start = 1;
  end
  if (nargin < 3)
    buffer_end = length(buffer);
  end

  descriptor = pb_descriptor_PositioningIonoParam();
  positioning_iono_param = pblib_generic_parse_from_string(buffer, descriptor, buffer_start, buffer_end);
  positioning_iono_param.descriptor_function = pb_descriptor_PositioningIonoParam();
