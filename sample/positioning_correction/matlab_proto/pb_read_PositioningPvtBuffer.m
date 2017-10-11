function [positioning_pvt_buffer] = pb_read_PositioningPvtBuffer(buffer, buffer_start, buffer_end)
%pb_read_PositioningPvtBuffer Reads the protobuf message PositioningPvtBuffer.
%   function [positioning_pvt_buffer] = pb_read_PositioningPvtBuffer(buffer, buffer_start, buffer_end)
%
%   INPUTS:
%     buffer       : a buffer of uint8's to parse
%     buffer_start : optional starting index to consider of the buffer
%                    defaults to 1
%     buffer_end   : optional ending index to consider of the buffer
%                    defaults to length(buffer)
%
%   MEMBERS:
%     state_vector   : repeated double, defaults to double([]).
%     h_matrix       : optional <a href="matlab:help pb_read_PositioningHMatrix">PositioningHMatrix</a>, defaults to struct([]).
%     delta_msr      : repeated double, defaults to double([]).
%     temp_matrix    : repeated double, defaults to double([]).
%     temp_vector    : repeated double, defaults to double([]).
%
%   See also pb_read_PositioningHMatrix, pb_read_PositioningUtcTime, pb_read_PositioningPos, pb_read_PositioningPosVel, pb_read_PositioningPosVelAcc, pb_read_PositioningLatLonAlt, pb_read_PositioningEccentricAnomaly, pb_read_PositioningEphemerisType1, pb_read_PositioningEphemerisType2, pb_read_PositioningAlmanac, pb_read_PositioningIonoParam, pb_read_PositioningUtcParam, pb_read_PositioningNavMessage, pb_read_PositioningReceiverInfo, pb_read_PositioningCachedPvaAndEa, pb_read_PositioningCachedPv, pb_read_PositioningMeasurement, pb_read_PositioningElAz, pb_read_PositioningSatInfo.

  if (nargin < 1)
    buffer = uint8([]);
  end
  if (nargin < 2)
    buffer_start = 1;
  end
  if (nargin < 3)
    buffer_end = length(buffer);
  end

  descriptor = pb_descriptor_PositioningPvtBuffer();
  positioning_pvt_buffer = pblib_generic_parse_from_string(buffer, descriptor, buffer_start, buffer_end);
  positioning_pvt_buffer.descriptor_function = pb_descriptor_PositioningPvtBuffer();
