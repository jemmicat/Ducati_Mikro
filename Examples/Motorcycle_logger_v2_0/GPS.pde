void gpsdump(TinyGPS &gps)
{
  byte month; 


  gps.get_position(&lat, &lon, &age);
  gps.crack_datetime(&year, &month, &day, &hour, &minute, &second, &hundredths, &age);


  feedgps(); // If we don't feed the gps during this long routine, we may drop characters and get checksum errors

    if (age == TinyGPS::GPS_INVALID_AGE  && Screen != 1 && Screen !=4 && Screen !=5 && Screen != 6){
    myGLCD.setFont(BigFont);
    myGLCD.setColor(255, 255, 0);
    myGLCD.setBackColor(0, 0, 0);
    myGLCD.print("???", 10, 215);      
    myGLCD.setColor(255, 0, 0);
    myGLCD.setBackColor(255, 255, 255);
    
    gpsspeed = 0;
    myGLCD.setFont(SevenSegNumFont);
    displayspeed();
    speedgps2 = speed_gps[2];
    speedgps1 = speed_gps[1];
    speedgps0 = speed_gps[0];
    if (gpsspeed <100){
      myGLCD.print("0", 150, 103);
    }
    else {
      myGLCD.printNumI(speedgps2, 150, 103);
    }

    if (gpsspeed <10){
      myGLCD.print("0", CENTER, 103);
    }
    else {
      myGLCD.printNumI(speedgps1, CENTER, 103);
    }

    myGLCD.printNumI(speedgps0, 218, 103);
  }
  
  else if (age > 5000 && Screen != 1 && Screen !=3 && Screen !=5 && Screen != 6 && Screen != 7){
    myGLCD.setFont(BigFont);
    myGLCD.setColor(255, 255, 0);
    myGLCD.setBackColor(0, 0, 0);
    myGLCD.print("---", 10, 215);
    
    gpsspeed = 0;
    myGLCD.setColor(255, 0, 0);
    myGLCD.setBackColor(255, 255, 255);
    myGLCD.setFont(SevenSegNumFont);    
    displayspeed();
    speedgps2 = speed_gps[2];
    speedgps1 = speed_gps[1];
    speedgps0 = speed_gps[0];
    if (gpsspeed <100){
      myGLCD.print("0", 150, 103);
    }
    else {
      myGLCD.printNumI(speedgps2, 150, 103);
    }

    if (gpsspeed <10){
      myGLCD.print("0", CENTER, 103);
    }
    else {
      myGLCD.printNumI(speedgps1, CENTER, 103);
    }

    myGLCD.printNumI(speedgps0, 218, 103);
  }

  else if (Screen == 2){

    myGLCD.setFont(BigFont);
    myGLCD.setColor(0, 255, 0);
    myGLCD.setBackColor(0, 0, 0);
    myGLCD.print("GPS", 10, 215);
    
 
   
    gpsspeed = gps.f_speed_mph();
    gpsspeed_radians = ToRad(gpsspeed);

    if (gpsspeed != gpsspeed_old)
    {
      myGLCD.setColor(255, 255, 255);
      myGLCD.setBackColor(255, 255, 255);
      myGLCD.drawLine(x1_old, y1_old, x2_old, y2_old);
      myGLCD.drawLine(x10_old, y10_old, x20_old, y20_old);
      myGLCD.drawLine(x11_old, y11_old, x21_old, y21_old);
    }

    myGLCD.setColor(255, 0, 0);
    myGLCD.setBackColor(255, 255, 255);

    speedometer_needlex1 = 199 - ((cos(gpsspeed_radians)) * center_radius);
    speedometer_needley1 = 192 - ((sin(gpsspeed_radians)) * center_radius);
    speedometer_needlex2 = 199 - ((cos(gpsspeed_radians)) * needle_radius);
    speedometer_needley2 = 192 - ((sin(gpsspeed_radians)) * needle_radius);
    myGLCD.drawLine(speedometer_needlex1, speedometer_needley1, speedometer_needlex2, speedometer_needley2);
   
    speedometer_needlex10 = 204 - ((cos(gpsspeed_radians)) * center_radius);
    speedometer_needley10 = 192 - ((sin(gpsspeed_radians)) * center_radius);
    speedometer_needlex20 = 204 - ((cos(gpsspeed_radians)) * needle_radius);
    speedometer_needley20 = 192 - ((sin(gpsspeed_radians)) * needle_radius);
    myGLCD.drawLine(speedometer_needlex1, speedometer_needley1, speedometer_needlex2, speedometer_needley2);
    
    speedometer_needlex11 = 194 - ((cos(gpsspeed_radians)) * center_radius);
    speedometer_needley11 = 192 - ((sin(gpsspeed_radians)) * center_radius);
    speedometer_needlex21 = 194 - ((cos(gpsspeed_radians)) * needle_radius);
    speedometer_needley21 = 192 - ((sin(gpsspeed_radians)) * needle_radius);
    myGLCD.drawLine(speedometer_needlex1, speedometer_needley1, speedometer_needlex2, speedometer_needley2);
    
    x1_old = speedometer_needlex1;
    x2_old = speedometer_needlex2;
    y1_old = speedometer_needley1;
    y2_old = speedometer_needley2;
    x10_old = speedometer_needlex10;
    x20_old = speedometer_needlex20;
    y10_old = speedometer_needley10;
    y20_old = speedometer_needley20;
    x11_old = speedometer_needlex11;
    x21_old = speedometer_needlex21;
    y11_old = speedometer_needley11;
    y21_old = speedometer_needley21;

    //delay(20);

    gpsspeed_old = gpsspeed;

    myGLCD.setColor(255, 0, 0);
    myGLCD.setBackColor(255, 255, 255);
    myGLCD.setFont(SevenSegNumFont); 
    displayspeed();
    speedgps2 = speed_gps[2];
    speedgps1 = speed_gps[1];
    speedgps0 = speed_gps[0];
    if (gpsspeed <100){
      myGLCD.print("0", 150, 103);
    }
    else {
      myGLCD.printNumI(speedgps2, 150, 103);
    }

    if (gpsspeed <10){
      myGLCD.print("0", CENTER, 103);
    }
    else {
      myGLCD.printNumI(speedgps1, CENTER, 103);
    }

    myGLCD.printNumI(speedgps0, 218, 103);

  }



  feedgps();

  gps.get_datetime(&date, &time, &age);


}

bool feedgps()
{
  while (Serial1.available())  //Changed to Serial1 from nss
  {
    if (gps.encode(Serial1.read()))  //Changed to Serial1 from nss

      return true;
  }
  return false;
} 

//------------End Tiny GS Needed Stuff--------------





