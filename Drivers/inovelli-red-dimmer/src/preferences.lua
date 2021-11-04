local devices = {
  INOVELLI = {
    MATCHING_MATRIX = {
      mfrs = 0x031E,
      product_types = {0x0001, 0x0003},
      product_ids = 0x0001
    },
    PARAMETERS = {
      dimmingSpeed = {parameter_number = 1, size = 1},
      dimmingSpeedFromSwitch = {parameter_number = 2, size = 1},
      rampRate = {parameter_number = 3, size = 1},
      rampRateFromSwitch = {parameter_number = 4, size = 1},
      minimumLevel = {parameter_number = 5, size = 1},
	  maximumLevel = {parameter_number = 6, size = 1},
	  invertSwitch = {parameter_number = 7, size = 1},
      autoOffTimer = {parameter_number = 8, size = 2},
	  defaultLevelLocal = {parameter_number = 9, size = 1},
	  defaultLevelZWave = {parameter_number = 10, size = 1},
      stateAfterPowerRestored = {parameter_number = 11, size = 1},
      associationBehavior = {parameter_number = 12, size = 1},
      lEDStripColor = {parameter_number = 13, size = 2},
      lEDStripIntensity = {parameter_number = 14, size = 1},
      lEDStripIntensityWhenOF = {parameter_number = 15, size = 1},
	  lEDStripTimeout = {parameter_number = 17, size = 1},
      activePowerReports = {parameter_number = 18, size = 1},
      periodicPowerEnergyRep = {parameter_number = 19, size = 2},
      energyReports = {parameter_number = 20, size = 1},
      acPowerType = {parameter_number = 21, size = 1},
      switchType = {parameter_number = 22, size = 1},
      buttonPressDelay = {parameter_number = 50, size = 1},
      disablePhysicalOnOffDel = {parameter_number = 51, size = 1},
	  smartBulbMode = {parameter_number = 52, size = 1}

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