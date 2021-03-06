function [descriptor] = pb_descriptor_PositioningPosVel()
%pb_descriptor_PositioningPosVel Returns the descriptor for message PositioningPosVel.
%   function [descriptor] = pb_descriptor_PositioningPosVel()
%
%   See also pb_read_PositioningPosVel

  descriptor = struct( ...
    'name', 'PositioningPosVel', ...
    'full_name', 'PositioningPosVel', ...
    'filename', 'positioning.proto', ...
    'containing_type', '', ...
    'fields', [ ...
      struct( ...
        'name', 'p', ...
        'full_name', 'PositioningPosVel.p', ...
        'index', 1, ...
        'number', uint32(1), ...
        'type', uint32(11), ...
        'matlab_type', uint32(9), ...
        'wire_type', uint32(2), ...
        'label', uint32(1), ...
        'default_value', struct([]), ...
        'read_function', @(x) pb_read_PositioningPos(x{1}, x{2}, x{3}), ...
        'write_function', @pblib_generic_serialize_to_string, ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'vx', ...
        'full_name', 'PositioningPosVel.vx', ...
        'index', 2, ...
        'number', uint32(2), ...
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
        'full_name', 'PositioningPosVel.vy', ...
        'index', 3, ...
        'number', uint32(3), ...
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
        'full_name', 'PositioningPosVel.vz', ...
        'index', 4, ...
        'number', uint32(4), ...
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

