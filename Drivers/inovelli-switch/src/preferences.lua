local devices = {
  INOVELLI = {
    MATCHING_MATRIX = {
      mfrs = 0x031E,
      product_types = {0x0002, 0x0004},
      product_ids = 0x0001
    },
    PARAMETERS = {
      parameter1 = {parameter_number = 1, size = 1},
      parameter2 = {parameter_number = 2, size = 1},
      parameter3 = {parameter_number = 3, size = 2},
      parameter4 = {parameter_number = 4, size = 1},
      parameter5 = {parameter_number = 5, size = 2},
	  parameter6 = {parameter_number = 6, size = 1},
	  parameter7 = {parameter_number = 7, size = 1},
      parameter8 = {parameter_number = 8, size = 4},
	  parameter9 = {parameter_number = 9, size = 1},
	  parameter10 = {parameter_number = 10, size = 1},
      parameter11 = {parameter_number = 11, size = 2},
      parameter12 = {parameter_number = 12, size = 1},
      parameter13 = {parameter_number = 13, size = 1},
	  parameter51 = {parameter_number = 51, size = 1},
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