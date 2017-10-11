function [descriptor] = pb_descriptor_PositioningEphemerisType2()
%pb_descriptor_PositioningEphemerisType2 Returns the descriptor for message PositioningEphemerisType2.
%   function [descriptor] = pb_descriptor_PositioningEphemerisType2()
%
%   See also pb_read_PositioningEphemerisType2

  descriptor = struct( ...
    'name', 'PositioningEphemerisType2', ...
    'full_name', 'PositioningEphemerisType2', ...
    'filename', 'positioning.proto', ...
    'containing_type', '', ...
    'fields', [ ...
      struct( ...
        'name', 'flag', ...
        'full_name', 'PositioningEphemerisType2.flag', ...
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
        'name', 'svid', ...
        'full_name', 'PositioningEphemerisType2.svid', ...
        'index', 2, ...
        'number', uint32(2), ...
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
        'full_name', 'PositioningEphemerisType2.health', ...
        'index', 3, ...
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
        'name', 'reserved', ...
        'full_name', 'PositioningEphemerisType2.reserved', ...
        'index', 4, ...
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
        'name', 'tb', ...
        'full_name', 'PositioningEphemerisType2.tb', ...
        'index', 5, ...
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
        'name', 'tau', ...
        'full_name', 'PositioningEphemerisType2.tau', ...
        'index', 6, ...
        'number', uint32(6), ...
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
        'name', 'gamma', ...
        'full_name', 'PositioningEphemerisType2.gamma', ...
        'index', 7, ...
        'number', uint32(7), ...
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
        'name', 'x', ...
        'full_name', 'PositioningEphemerisType2.x', ...
        'index', 8, ...
        'number', uint32(8), ...
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
        'name', 'y', ...
        'full_name', 'PositioningEphemerisType2.y', ...
        'index', 9, ...
        'number', uint32(9), ...
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
        'name', 'z', ...
        'full_name', 'PositioningEphemerisType2.z', ...
        'index', 10, ...
        'number', uint32(10), ...
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
        'name', 'vx', ...
        'full_name', 'PositioningEphemerisType2.vx', ...
        'index', 11, ...
        'number', uint32(11), ...
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
        'name', 'vy', ...
        'full_name', 'PositioningEphemerisType2.vy', ...
        'index', 12, ...
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
        'name', 'vz', ...
        'full_name', 'PositioningEphemerisType2.vz', ...
        'index', 13, ...
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
        'name', 'ax', ...
        'full_name', 'PositioningEphemerisType2.ax', ...
        'index', 14, ...
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
        'name', 'ay', ...
        'full_name', 'PositioningEphemerisType2.ay', ...
        'index', 15, ...
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
        'name', 'az', ...
        'full_name', 'PositioningEphemerisType2.az', ...
        'index', 16, ...
        'number', uint32(16), ...
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
  put(descriptor.field_indeces_by_number, uint32(2), 2);
  put(descriptor.field_indeces_by_number, uint32(3), 3);
  put(descriptor.field_indeces_by_number, uint32(4), 4);
  put(descriptor.field_indeces_by_number, uint32(5), 5);
  put(descriptor.field_indeces_by_number, uint32(6), 6);
  put(descriptor.field_indeces_by_number, uint32(7), 7);
  put(descriptor.field_indeces_by_number, uint32(8), 8);
  put(descriptor.field_indeces_by_number, uint32(9), 9);
  put(descriptor.field_indeces_by_number, uint32(10), 10);
  put(descriptor.field_indeces_by_number, uint32(11), 11);
  put(descriptor.field_indeces_by_number, uint32(12), 12);
  put(descriptor.field_indeces_by_number, uint32(13), 13);
  put(descriptor.field_indeces_by_number, uint32(14), 14);
  put(descriptor.field_indeces_by_number, uint32(15), 15);
  put(descriptor.field_indeces_by_number, uint32(16), 16);
