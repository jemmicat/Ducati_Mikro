void max_values_check(){

  //Check for max values and save to eeprom
  MaxSpeedtemp = EEPROM.read(speed_save_addr);
  int gpsspeed = (gps.f_speed_mph()); 
  if (gpsspeed > MaxSpeedtemp){
    EEPROM.write(speed_save_addr, gpsspeed);
  }

  MaxLeanAngtemp = EEPROM.read(lean_save_addr);
  if (lean_angle > MaxLeanAngtemp){
    EEPROM.write(lean_save_addr, lean_angle);
  }

  MaxRPMtemp = EEPROM.read(rpm_save_addr);
  if (RPM_temp > MaxRPMtemp){
    EEPROM.write(rpm_save_addr, RPM_temp);
  }

  MaxGForcetemp = EEPROM.read(acceleration_save_addr);
  if (Ract > MaxGForcetemp){
    EEPROM.write(acceleration_save_addr, Ract);
  }
}

