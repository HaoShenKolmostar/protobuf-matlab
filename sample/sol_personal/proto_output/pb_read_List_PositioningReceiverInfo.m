function [list__positioning_receiver_info] = pb_read_List_PositioningReceiverInfo(buffer, buffer_start, buffer_end)
%pb_read_List_PositioningReceiverInfo Reads the protobuf message List_PositioningReceiverInfo.
%   function [list__positioning_receiver_info] = pb_read_List_PositioningReceiverInfo(buffer, buffer_start, buffer_end)
%
%   INPUTS:
%     buffer       : a buffer of uint8's to parse
%     buffer_start : optional starting index to consider of the buffer
%                    defaults to 1
%     buffer_end   : optional ending index to consider of the buffer
%                    defaults to length(buffer)
%
%   MEMBERS:
%     items          : repeated <a href="matlab:help pb_read_PositioningReceiverInfo">PositioningReceiverInfo</a>, defaults to struct([]).
%
%   See also pb_read_PositioningReceiverInfo, pb_read_PositioningLatLonAlt, pb_read_PositioningPosvel.

  if (nargin < 1)
    buffer = uint8([]);
  end
  if (nargin < 2)
    buffer_start = 1;
  end
  if (nargin < 3)
    buffer_end = length(buffer);
  end

  descriptor = pb_descriptor_List_PositioningReceiverInfo();
  list__positioning_receiver_info = pblib_generic_parse_from_string(buffer, descriptor, buffer_start, buffer_end);
  list__positioning_receiver_info.descriptor_function = pb_descriptor_List_PositioningReceiverInfo();
