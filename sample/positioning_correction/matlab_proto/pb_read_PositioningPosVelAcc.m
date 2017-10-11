function [positioning_pos_vel_acc] = pb_read_PositioningPosVelAcc(buffer, buffer_start, buffer_end)
%pb_read_PositioningPosVelAcc Reads the protobuf message PositioningPosVelAcc.
%   function [positioning_pos_vel_acc] = pb_read_PositioningPosVelAcc(buffer, buffer_start, buffer_end)
%
%   INPUTS:
%     buffer       : a buffer of uint8's to parse
%     buffer_start : optional starting index to consider of the buffer
%                    defaults to 1
%     buffer_end   : optional ending index to consider of the buffer
%                    defaults to length(buffer)
%
%   MEMBERS:
%     pv             : optional <a href="matlab:help pb_read_PositioningPosVel">PositioningPosVel</a>, defaults to struct([]).
%     ax             : optional double, defaults to double(0).
%     ay             : optional double, defaults to double(0).
%     az             : optional double, defaults to double(0).
%
%   See also pb_read_PositioningPosVel, pb_read_PositioningUtcTime, pb_read_PositioningPos, pb_read_PositioningLatLonAlt, pb_read_PositioningEccentricAnomaly, pb_read_PositioningEphemerisType1, pb_read_PositioningEphemerisType2, pb_read_PositioningAlmanac, pb_read_PositioningIonoParam, pb_read_PositioningUtcParam, pb_read_PositioningNavMessage, pb_read_PositioningReceiverInfo, pb_read_PositioningCachedPvaAndEa, pb_read_PositioningCachedPv, pb_read_PositioningMeasurement, pb_read_PositioningElAz, pb_read_PositioningSatInfo, pb_read_PositioningHMatrix, pb_read_PositioningPvtBuffer.

  if (nargin < 1)
    buffer = uint8([]);
  end
  if (nargin < 2)
    buffer_start = 1;
  end
  if (nargin < 3)
    buffer_end = length(buffer);
  end

  descriptor = pb_descriptor_PositioningPosVelAcc();
  positioning_pos_vel_acc = pblib_generic_parse_from_string(buffer, descriptor, buffer_start, buffer_end);
  positioning_pos_vel_acc.descriptor_function = pb_descriptor_PositioningPosVelAcc();
