function [positioning_posvel] = pb_read_PositioningPosvel(buffer, buffer_start, buffer_end)
%pb_read_PositioningPosvel Reads the protobuf message PositioningPosvel.
%   function [positioning_posvel] = pb_read_PositioningPosvel(buffer, buffer_start, buffer_end)
%
%   INPUTS:
%     buffer       : a buffer of uint8's to parse
%     buffer_start : optional starting index to consider of the buffer
%                    defaults to 1
%     buffer_end   : optional ending index to consider of the buffer
%                    defaults to length(buffer)
%
%   MEMBERS:
%     x              : optional double, defaults to double(0).
%     y              : optional double, defaults to double(0).
%     z              : optional double, defaults to double(0).
%     vx             : optional double, defaults to double(0).
%     vy             : optional double, defaults to double(0).
%     vz             : optional double, defaults to double(0).
%
%   See also pb_read_List_PositioningReceiverInfo, pb_read_PositioningReceiverInfo, pb_read_PositioningLatLonAlt.

  if (nargin < 1)
    buffer = uint8([]);
  end
  if (nargin < 2)
    buffer_start = 1;
  end
  if (nargin < 3)
    buffer_end = length(buffer);
  end

  descriptor = pb_descriptor_PositioningPosvel();
  positioning_posvel = pblib_generic_parse_from_string(buffer, descriptor, buffer_start, buffer_end);
  positioning_posvel.descriptor_function = pb_descriptor_PositioningPosvel();
