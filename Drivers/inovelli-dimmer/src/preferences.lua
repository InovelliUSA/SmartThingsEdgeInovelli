local devices = {
  INOVELLI = {
    MATCHING_MATRIX = {
      mfrs = 0x031E,
      product_types = {0x0001, 0x0003},
      product_ids = 0x0001
    },
    PARAMETERS = {
      parameter1 = {parameter_number = 1, size = 1},
      parameter2 = {parameter_number = 2, size = 1},
      parameter3 = {parameter_number = 3, size = 1},
      parameter4 = {parameter_number = 4, size = 1},
      parameter5 = {parameter_number = 5, size = 1},
	  parameter6 = {parameter_number = 6, size = 1},
	  parameter7 = {parameter_number = 7, size = 1},
      parameter8 = {parameter_number = 8, size = 2},
	  parameter9 = {parameter_number = 9, size = 1},
	  parameter10 = {parameter_number = 10, size = 1},
      parameter11 = {parameter_number = 11, size = 1},
      parameter12 = {parameter_number = 12, size = 1},
      parameter13 = {parameter_number = 13, size = 2},
      parameter14 = {parameter_number = 14, size = 1},
      parameter15 = {parameter_number = 15, size = 1},
	  parameter17 = {parameter_number = 17, size = 1},
      parameter18 = {parameter_number = 18, size = 1},
      parameter19 = {parameter_number = 19, size = 2},
      parameter20 = {parameter_number = 20, size = 1},
      parameter21 = {parameter_number = 21, size = 1},
      parameter22 = {parameter_number = 22, size = 1},
      parameter50 = {parameter_number = 50, size = 1},
      parameter51 = {parameter_number = 51, size = 1},
	  parameter52 = {parameter_number = 52, size = 1}
    }
  }
}

local preferences = {}

preferences.get_device_parameters = function(zw_device)
  for _, device in pairs(devices) do
    if zw_device:id_match(
      device.MATCHING_MATRIX.mfrs,
      device.MATCHING_MATRIX.product_types,
      device.MATCHING_MATRIX.product_ids) then
      return device.PARAMETERS
    end
  end
  return nil
end

preferences.to_numeric_value = function(new_value)
  local numeric = tonumber(new_value)
  if numeric == nil then -- in case the value is boolean
    numeric = new_value and 1 or 0
  end
  return numeric
end

return preferences