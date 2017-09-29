function [list__g_p_s__e_p_h_e_m_e_r_i_s] = pb_read_List_GPS_EPHEMERIS(buffer, buffer_start, buffer_end)
%pb_read_List_GPS_EPHEMERIS Reads the protobuf message List_GPS_EPHEMERIS.
%   function [list__g_p_s__e_p_h_e_m_e_r_i_s] = pb_read_List_GPS_EPHEMERIS(buffer, buffer_start, buffer_end)
%
%   INPUTS:
%     buffer       : a buffer of uint8's to parse
%     buffer_start : optional starting index to consider of the buffer
%                    defaults to 1
%     buffer_end   : optional ending index to consider of the buffer
%                    defaults to length(buffer)
%
%   MEMBERS:
%     items          : repeated <a href="matlab:help pb_read_GPS_EPHEMERIS">GPS_EPHEMERIS</a>, defaults to struct([]).
%
%   See also pb_read_GPS_EPHEMERIS.

  if (nargin < 1)
    buffer = uint8([]);
  end
  if (nargin < 2)
    buffer_start = 1;
  end
  if (nargin < 3)
    buffer_end = length(buffer);
  end

  descriptor = pb_descriptor_List_GPS_EPHEMERIS();
  list__g_p_s__e_p_h_e_m_e_r_i_s = pblib_generic_parse_from_string(buffer, descriptor, buffer_start, buffer_end);
  list__g_p_s__e_p_h_e_m_e_r_i_s.descriptor_function = pb_descriptor_List_GPS_EPHEMERIS();
