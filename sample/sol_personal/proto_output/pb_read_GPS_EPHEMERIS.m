function [g_p_s__e_p_h_e_m_e_r_i_s] = pb_read_GPS_EPHEMERIS(buffer, buffer_start, buffer_end)
%pb_read_GPS_EPHEMERIS Reads the protobuf message GPS_EPHEMERIS.
%   function [g_p_s__e_p_h_e_m_e_r_i_s] = pb_read_GPS_EPHEMERIS(buffer, buffer_start, buffer_end)
%
%   INPUTS:
%     buffer       : a buffer of uint8's to parse
%     buffer_start : optional starting index to consider of the buffer
%                    defaults to 1
%     buffer_end   : optional ending index to consider of the buffer
%                    defaults to length(buffer)
%
%   MEMBERS:
%     iodc           : optional int32, defaults to int32(0).
%     iode2          : optional int32, defaults to int32(0).
%     iode3          : optional int32, defaults to int32(0).
%     ura            : optional int32, defaults to int32(0).
%     flag           : optional int32, defaults to int32(0).
%     health         : optional int32, defaults to int32(0).
%     svid           : optional int32, defaults to int32(0).
%     toe            : optional int32, defaults to int32(0).
%     toc            : optional int32, defaults to int32(0).
%     week           : optional int32, defaults to int32(0).
%     M0             : optional double, defaults to double(0).
%     delta_n        : optional double, defaults to double(0).
%     ecc            : optional double, defaults to double(0).
%     sqrtA          : optional double, defaults to double(0).
%     omega0         : optional double, defaults to double(0).
%     i0             : optional double, defaults to double(0).
%     w              : optional double, defaults to double(0).
%     omega_dot      : optional double, defaults to double(0).
%     idot           : optional double, defaults to double(0).
%     cuc            : optional double, defaults to double(0).
%     cus            : optional double, defaults to double(0).
%     crc            : optional double, defaults to double(0).
%     crs            : optional double, defaults to double(0).
%     cic            : optional double, defaults to double(0).
%     cis            : optional double, defaults to double(0).
%     tgd            : optional double, defaults to double(0).
%     tgd2           : optional double, defaults to double(0).
%     af0            : optional single, defaults to single(0).
%     af1            : optional single, defaults to single(0).
%     af2            : optional double, defaults to double(0).
%     axis           : optional double, defaults to double(0).
%     n              : optional double, defaults to double(0).
%     root_ecc       : optional double, defaults to double(0).
%     omega_t        : optional double, defaults to double(0).
%     omega_delta    : optional double, defaults to double(0).
%     Ek             : optional double, defaults to double(0).
%
%   See also pb_read_List_GPS_EPHEMERIS.

  if (nargin < 1)
    buffer = uint8([]);
  end
  if (nargin < 2)
    buffer_start = 1;
  end
  if (nargin < 3)
    buffer_end = length(buffer);
  end

  descriptor = pb_descriptor_GPS_EPHEMERIS();
  g_p_s__e_p_h_e_m_e_r_i_s = pblib_generic_parse_from_string(buffer, descriptor, buffer_start, buffer_end);
  g_p_s__e_p_h_e_m_e_r_i_s.descriptor_function = pb_descriptor_GPS_EPHEMERIS();
