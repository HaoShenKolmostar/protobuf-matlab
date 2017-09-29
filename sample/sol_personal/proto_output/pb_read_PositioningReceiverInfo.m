function [positioning_receiver_info] = pb_read_PositioningReceiverInfo(buffer, buffer_start, buffer_end)
%pb_read_PositioningReceiverInfo Reads the protobuf message PositioningReceiverInfo.
%   function [positioning_receiver_info] = pb_read_PositioningReceiverInfo(buffer, buffer_start, buffer_end)
%
%   INPUTS:
%     buffer       : a buffer of uint8's to parse
%     buffer_start : optional starting index to consider of the buffer
%                    defaults to 1
%     buffer_end   : optional ending index to consider of the buffer
%                    defaults to length(buffer)
%
%   MEMBERS:
%     pv             : optional <a href="matlab:help pb_read_PositioningPosvel">PositioningPosvel</a>, defaults to struct([]).
%     lla            : optional <a href="matlab:help pb_read_PositioningLatLonAlt">PositioningLatLonAlt</a>, defaults to struct([]).
%     receiver_time  : repeated double, defaults to double([]).
%     clock_drift    : optional double, defaults to double(0).
%
%   See also pb_read_PositioningPosvel, pb_read_PositioningLatLonAlt, pb_read_List_PositioningReceiverInfo.

  if (nargin < 1)
    buffer = uint8([]);
  end
  if (nargin < 2)
    buffer_start = 1;
  end
  if (nargin < 3)
    buffer_end = length(buffer);
  end

  descriptor = pb_descriptor_PositioningReceiverInfo();
  positioning_receiver_info = pblib_generic_parse_from_string(buffer, descriptor, buffer_start, buffer_end);
  positioning_receiver_info.descriptor_function = pb_descriptor_PositioningReceiverInfo();
