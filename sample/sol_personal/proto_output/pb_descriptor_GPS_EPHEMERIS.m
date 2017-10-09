function [descriptor] = pb_descriptor_GPS_EPHEMERIS()
%pb_descriptor_GPS_EPHEMERIS Returns the descriptor for message GPS_EPHEMERIS.
%   function [descriptor] = pb_descriptor_GPS_EPHEMERIS()
%
%   See also pb_read_GPS_EPHEMERIS

  descriptor = struct( ...
    'name', 'GPS_EPHEMERIS', ...
    'full_name', 'GPS_EPHEMERIS', ...
    'filename', 'eph/eph.proto', ...
    'containing_type', '', ...
    'fields', [ ...
      struct( ...
        'name', 'iodc', ...
        'full_name', 'GPS_EPHEMERIS.iodc', ...
        'index', 1, ...
        'number', uint32(1), ...
        'type', uint32(5), ...
        'matlab_type', uint32(1), ...
        'wire_type', uint32(0), ...
        'label', uint32(1), ...
        'default_value', int32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'int32')), ...
        'write_function', @(x) typecast(int32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'iode2', ...
        'full_name', 'GPS_EPHEMERIS.iode2', ...
        'index', 2, ...
        'number', uint32(3), ...
        'type', uint32(5), ...
        'matlab_type', uint32(1), ...
        'wire_type', uint32(0), ...
        'label', uint32(1), ...
        'default_value', int32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'int32')), ...
        'write_function', @(x) typecast(int32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'iode3', ...
        'full_name', 'GPS_EPHEMERIS.iode3', ...
        'index', 3, ...
        'number', uint32(4), ...
        'type', uint32(5), ...
        'matlab_type', uint32(1), ...
        'wire_type', uint32(0), ...
        'label', uint32(1), ...
        'default_value', int32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'int32')), ...
        'write_function', @(x) typecast(int32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'ura', ...
        'full_name', 'GPS_EPHEMERIS.ura', ...
        'index', 4, ...
        'number', uint32(5), ...
        'type', uint32(5), ...
        'matlab_type', uint32(1), ...
        'wire_type', uint32(0), ...
        'label', uint32(1), ...
        'default_value', int32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'int32')), ...
        'write_function', @(x) typecast(int32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'flag', ...
        'full_name', 'GPS_EPHEMERIS.flag', ...
        'index', 5, ...
        'number', uint32(6), ...
        'type', uint32(5), ...
        'matlab_type', uint32(1), ...
        'wire_type', uint32(0), ...
        'label', uint32(1), ...
        'default_value', int32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'int32')), ...
        'write_function', @(x) typecast(int32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'health', ...
        'full_name', 'GPS_EPHEMERIS.health', ...
        'index', 6, ...
        'number', uint32(7), ...
        'type', uint32(5), ...
        'matlab_type', uint32(1), ...
        'wire_type', uint32(0), ...
        'label', uint32(1), ...
        'default_value', int32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'int32')), ...
        'write_function', @(x) typecast(int32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'svid', ...
        'full_name', 'GPS_EPHEMERIS.svid', ...
        'index', 7, ...
        'number', uint32(8), ...
        'type', uint32(5), ...
        'matlab_type', uint32(1), ...
        'wire_type', uint32(0), ...
        'label', uint32(1), ...
        'default_value', int32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'int32')), ...
        'write_function', @(x) typecast(int32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'toe', ...
        'full_name', 'GPS_EPHEMERIS.toe', ...
        'index', 8, ...
        'number', uint32(9), ...
        'type', uint32(5), ...
        'matlab_type', uint32(1), ...
        'wire_type', uint32(0), ...
        'label', uint32(1), ...
        'default_value', int32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'int32')), ...
        'write_function', @(x) typecast(int32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'toc', ...
        'full_name', 'GPS_EPHEMERIS.toc', ...
        'index', 9, ...
        'number', uint32(10), ...
        'type', uint32(5), ...
        'matlab_type', uint32(1), ...
        'wire_type', uint32(0), ...
        'label', uint32(1), ...
        'default_value', int32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'int32')), ...
        'write_function', @(x) typecast(int32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'week', ...
        'full_name', 'GPS_EPHEMERIS.week', ...
        'index', 10, ...
        'number', uint32(11), ...
        'type', uint32(5), ...
        'matlab_type', uint32(1), ...
        'wire_type', uint32(0), ...
        'label', uint32(1), ...
        'default_value', int32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'int32')), ...
        'write_function', @(x) typecast(int32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'M0', ...
        'full_name', 'GPS_EPHEMERIS.M0', ...
        'index', 11, ...
        'number', uint32(12), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'delta_n', ...
        'full_name', 'GPS_EPHEMERIS.delta_n', ...
        'index', 12, ...
        'number', uint32(13), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'ecc', ...
        'full_name', 'GPS_EPHEMERIS.ecc', ...
        'index', 13, ...
        'number', uint32(14), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'sqrtA', ...
        'full_name', 'GPS_EPHEMERIS.sqrtA', ...
        'index', 14, ...
        'number', uint32(15), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'omega0', ...
        'full_name', 'GPS_EPHEMERIS.omega0', ...
        'index', 15, ...
        'number', uint32(16), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'i0', ...
        'full_name', 'GPS_EPHEMERIS.i0', ...
        'index', 16, ...
        'number', uint32(17), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'w', ...
        'full_name', 'GPS_EPHEMERIS.w', ...
        'index', 17, ...
        'number', uint32(18), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'omega_dot', ...
        'full_name', 'GPS_EPHEMERIS.omega_dot', ...
        'index', 18, ...
        'number', uint32(19), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'idot', ...
        'full_name', 'GPS_EPHEMERIS.idot', ...
        'index', 19, ...
        'number', uint32(20), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'cuc', ...
        'full_name', 'GPS_EPHEMERIS.cuc', ...
        'index', 20, ...
        'number', uint32(21), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'cus', ...
        'full_name', 'GPS_EPHEMERIS.cus', ...
        'index', 21, ...
        'number', uint32(22), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'crc', ...
        'full_name', 'GPS_EPHEMERIS.crc', ...
        'index', 22, ...
        'number', uint32(23), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'crs', ...
        'full_name', 'GPS_EPHEMERIS.crs', ...
        'index', 23, ...
        'number', uint32(24), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'cic', ...
        'full_name', 'GPS_EPHEMERIS.cic', ...
        'index', 24, ...
        'number', uint32(25), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'cis', ...
        'full_name', 'GPS_EPHEMERIS.cis', ...
        'index', 25, ...
        'number', uint32(26), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'tgd', ...
        'full_name', 'GPS_EPHEMERIS.tgd', ...
        'index', 26, ...
        'number', uint32(27), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'tgd2', ...
        'full_name', 'GPS_EPHEMERIS.tgd2', ...
        'index', 27, ...
        'number', uint32(28), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'af0', ...
        'full_name', 'GPS_EPHEMERIS.af0', ...
        'index', 28, ...
        'number', uint32(29), ...
        'type', uint32(2), ...
        'matlab_type', uint32(6), ...
        'wire_type', uint32(5), ...
        'label', uint32(1), ...
        'default_value', single(0), ...
        'read_function', @(x) typecast(uint8(x), 'single'), ...
        'write_function', @(x) typecast(single(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'af1', ...
        'full_name', 'GPS_EPHEMERIS.af1', ...
        'index', 29, ...
        'number', uint32(30), ...
        'type', uint32(2), ...
        'matlab_type', uint32(6), ...
        'wire_type', uint32(5), ...
        'label', uint32(1), ...
        'default_value', single(0), ...
        'read_function', @(x) typecast(uint8(x), 'single'), ...
        'write_function', @(x) typecast(single(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'af2', ...
        'full_name', 'GPS_EPHEMERIS.af2', ...
        'index', 30, ...
        'number', uint32(31), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'axis', ...
        'full_name', 'GPS_EPHEMERIS.axis', ...
        'index', 31, ...
        'number', uint32(32), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'n', ...
        'full_name', 'GPS_EPHEMERIS.n', ...
        'index', 32, ...
        'number', uint32(33), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'root_ecc', ...
        'full_name', 'GPS_EPHEMERIS.root_ecc', ...
        'index', 33, ...
        'number', uint32(34), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'omega_t', ...
        'full_name', 'GPS_EPHEMERIS.omega_t', ...
        'index', 34, ...
        'number', uint32(35), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'omega_delta', ...
        'full_name', 'GPS_EPHEMERIS.omega_delta', ...
        'index', 35, ...
        'number', uint32(36), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'Ek', ...
        'full_name', 'GPS_EPHEMERIS.Ek', ...
        'index', 36, ...
        'number', uint32(37), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(uint8(x), 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ) ...
    ], ...
    'extensions', [ ... % Not Implemented
    ], ...
    'nested_types', [ ... % Not implemented
    ], ...
    'enum_types', [ ... % Not Implemented
    ], ...
    'options', [ ... % Not Implemented
    ] ...
  );

  descriptor.field_indeces_by_number = java.util.HashMap;
  put(descriptor.field_indeces_by_number, uint32(1), 1);
  put(descriptor.field_indeces_by_number, uint32(3), 2);
  put(descriptor.field_indeces_by_number, uint32(4), 3);
  put(descriptor.field_indeces_by_number, uint32(5), 4);
  put(descriptor.field_indeces_by_number, uint32(6), 5);
  put(descriptor.field_indeces_by_number, uint32(7), 6);
  put(descriptor.field_indeces_by_number, uint32(8), 7);
  put(descriptor.field_indeces_by_number, uint32(9), 8);
  put(descriptor.field_indeces_by_number, uint32(10), 9);
  put(descriptor.field_indeces_by_number, uint32(11), 10);
  put(descriptor.field_indeces_by_number, uint32(12), 11);
  put(descriptor.field_indeces_by_number, uint32(13), 12);
  put(descriptor.field_indeces_by_number, uint32(14), 13);
  put(descriptor.field_indeces_by_number, uint32(15), 14);
  put(descriptor.field_indeces_by_number, uint32(16), 15);
  put(descriptor.field_indeces_by_number, uint32(17), 16);
  put(descriptor.field_indeces_by_number, uint32(18), 17);
  put(descriptor.field_indeces_by_number, uint32(19), 18);
  put(descriptor.field_indeces_by_number, uint32(20), 19);
  put(descriptor.field_indeces_by_number, uint32(21), 20);
  put(descriptor.field_indeces_by_number, uint32(22), 21);
  put(descriptor.field_indeces_by_number, uint32(23), 22);
  put(descriptor.field_indeces_by_number, uint32(24), 23);
  put(descriptor.field_indeces_by_number, uint32(25), 24);
  put(descriptor.field_indeces_by_number, uint32(26), 25);
  put(descriptor.field_indeces_by_number, uint32(27), 26);
  put(descriptor.field_indeces_by_number, uint32(28), 27);
  put(descriptor.field_indeces_by_number, uint32(29), 28);
  put(descriptor.field_indeces_by_number, uint32(30), 29);
  put(descriptor.field_indeces_by_number, uint32(31), 30);
  put(descriptor.field_indeces_by_number, uint32(32), 31);
  put(descriptor.field_indeces_by_number, uint32(33), 32);
  put(descriptor.field_indeces_by_number, uint32(34), 33);
  put(descriptor.field_indeces_by_number, uint32(35), 34);
  put(descriptor.field_indeces_by_number, uint32(36), 35);
  put(descriptor.field_indeces_by_number, uint32(37), 36);
