void IMUsetup()
{
  static int j;
  static int i;
  //Setup parameters for Acc_Gyro board
  for(i=0;i<=2;i++){                  // X,Y,Z axis
    config.zeroLevel[i] = zeroLevelAcc;       // Accelerometer zero level (mV) @ 0 G
    config.inpSens[i] = accSensitivity;          // Accelerometer Sensisitivity mV/g
  }        

  for(i=3;i<=4;i++){
    config.inpSens[i] = gyroSensitivity;      // Gyro Sensitivity mV/deg/ms    
    config.zeroLevel[i] = zeroLevelGyro;     // Gyro Zero Level (mV) @ 0 deg/s  
  }

  config.inpInvert[0] = 1;  //Acc X
  config.inpInvert[1] = 1;  //Acc Y
  config.inpInvert[2] = 1;  //Acc Z

  //Gyro readings are inverted according to accelerometer coordonate system
  //see http://starlino.com/imu_guide.html for discussion
  //also see http://www.gadgetgangster.com/213 for graphical diagrams
  config.inpInvert[3] = 0;  //Gyro X  
  config.inpInvert[4] = 0;  //Gyro Y
  config.wGyro = 10;
  firstSample = 1;

}


void sensor_readings(){

  static int i,w;
  static float tmpf,tmpf2;  
  static unsigned long newMicros; //new timestamp
  static char signRzGyro;  

  //get raw adc readings
  newMicros = micros();       //save the time when sample is taken
  for(i=0;i<SENSORS;i++) an[i]= analogRead(i);

  //compute interval since last sampling time 
  interval = newMicros - lastMicros;    //please note that overflows are ok, since for example 0x0001 - 0x00FE will be equal to 2 
  lastMicros = newMicros;               //save for next loop, please note interval will be invalid in first sample but we don't use it


  //get accelerometer readings in g, gives us RwAcc vector
  for(w=0;w<=2;w++) RwAcc[w] = getInput(w);

  //normalize vector (convert to a vector with same direction and with length 1)
  normalize3DVector(RwAcc);

  if (firstSample){
    for(w=0;w<=2;w++) RwEst[w] = RwAcc[w];    //initialize with accelerometer readings
  }
  else{
    //evaluate RwGyro vector
    if(abs(RwEst[2]) < 0.1){
      //Rz is too small and because it is used as reference for computing Axz, Ayz it's error fluctuations will amplify leading to bad resu
      //in this case skip the gyro data and just use previous estimate
      for(w=0;w<=2;w++) RwGyro[w] = RwEst[w];
    }
    else{
      //get angles between projection of R on ZX/ZY plane and Z axis, based on last RwEst
      for(w=0;w<=1;w++){
        tmpf = getInput(3 + w);                         //get current gyro rate in deg/ms
        tmpf *= interval / 1000.0f;                     //get angle change in deg
        Awz[w] = atan2(RwEst[w],RwEst[2]) * 180 / PI;   //get angle and convert to degrees        
        Awz[w] += tmpf;                                 //get updated angle according to gyro movement
      }

      //estimate sign of RzGyro by looking in what qudrant the angle Axz is, 
      //RzGyro is pozitive if  Axz in range -90 ..90 => cos(Awz) >= 0
      signRzGyro = ( cos(Awz[0] * PI / 180) >=0 ) ? 1 : -1;

      //reverse calculation of RwGyro from Awz angles, for formula deductions see  http://starlino.com/imu_guide.html
      for(w=0;w<=1;w++){
        RwGyro[w] = sin(Awz[w] * PI / 180);
        RwGyro[w] /= sqrt( 1 + squared(cos(Awz[w] * PI / 180)) * squared(tan(Awz[1-w] * PI / 180)) );
      }
      RwGyro[2] = signRzGyro * sqrt(1 - squared(RwGyro[0]) - squared(RwGyro[1]));
    }

    //combine Accelerometer and gyro readings
    for(w=0;w<=2;w++) RwEst[w] = (RwAcc[w] + config.wGyro* RwGyro[w]) / (1 + config.wGyro);

    normalize3DVector(RwEst);  

    //get reading from rest of sensors  

    gyro_temperature = an[gyro_temperature_pin];
    RPM_temp = an[RPM_pin];
    Batt_temp = an[Batt_pin];
    TPS_temp = an[TPS_pin];
    frt_brk_temp = an[frt_brk_pin];
    bck_brk_temp = an[bck_brk_pin];
    o2sense_temp= an[o2sense_pin];
    fork_lvt_temp = an[fork_lvt_pin];
    shock_lvt_temp = an[shock_lvt_pin];

    // converting that reading to voltage

    //gyro temp
    gyro_temperature = an[gyro_temperature_pin];
    gyro_tempC = ((gyro_temperature * aref_voltage / 1023 - gyroTempLevel) / gyroTempSens) + 22;
    gyro_tempF = (gyro_tempC * 9) / 5 + 32;

    RPM = RPM_temp * aref_voltage / 1023;
    //brakes
    if (frt_brk_temp > 400)
      frt_brk = 1;
    else
      frt_brk = 0; 

    if (bck_brk_temp > 400)
      bck_brk = 1;
    else
      bck_brk = 0;

    //TPS Reading
    float TPS_percentage = (TPS_temp / (TPS_high - TPS_low)) * 100;

    //o2 sensor readings
    float afratio = (o2sense_temp * aref_voltage / 1023);

    //LVT readings
    float frk_travel = (fork_lvt_temp * aref_voltage / 1023) / LVT_senstitivity;
    float shock_travel = (shock_lvt_temp * aref_voltage / 1023) / LVT_senstitivity;

    // battery readings
    float battery_voltage_temp = (Batt_temp * aref_voltage / 1023);

    battery_voltage = battery_ratio * battery_voltage_temp;

    /*if (battery_voltage >= 15.5)
     lcd.clear();
     lcd.setCursor(1,1);
     lcd.print("Voltage High!!!!");
     lcd.clear();
     lcd.setCursor(1,1);
     lcd.print("Voltage High!!!!");
     
     if (battery_voltage <= 12.5)
     lcd.clear();
     lcd.setCursor(1,1);
     lcd.print("Voltage LOW!!!!!");
     lcd.clear();
     lcd.setCursor(1,1);
     lcd.print("Voltage LOW!!!!!"); 
     */

  }
}

void normalize3DVector(float* vector){
  static float R;  
  R = sqrt(vector[0]*vector[0] + vector[1]*vector[1] + vector[2]*vector[2]);
  vector[0] /= R;
  vector[1] /= R;  
  vector[2] /= R;  
}

float squared(float x){
  return x*x;
}

//Convert ADC value for to physical units see http://starlino.com/imu_guide.html for explanation.
//For accelerometer it will return  g  (acceleration) , applies when  i = 0..2
//For gyro it will return  deg/ms (rate of rotation)  , applies when i = 3..5
float getInput(char i){
  static float tmpf;	        //temporary variable
  tmpf = an[i] * aref_voltage / 1023.0f;  //voltage (mV)
  tmpf -= config.zeroLevel[i];  //voltage relative to zero level (mV)
  tmpf /= config.inpSens[i];    //input sensitivity in mV/G(acc) or mV/deg/ms(gyro)
  tmpf *= config.inpInvert[i];  //invert axis value according to configuration 
  return tmpf;	
}




