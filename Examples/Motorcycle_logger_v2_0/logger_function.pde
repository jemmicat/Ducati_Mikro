void loggerbutton(){

  logtemp = logger;
  if (logtemp == 0)
    logger = 1;
  if (logtemp == 1)
  {
    logger = 0;
    if (file.openFile(filename))
      file.closeFile();
  }    

  switch(logger){
  case 0: 
    //log button
    myGLCD.setColor(255, 0, 0);
    myGLCD.fillRoundRect(183, 0, 284, 119); //top log box
    myGLCD.setBackColor(255, 0, 0);
    myGLCD.setColor(0, 0, 0);
    break;
  case 1:
    myGLCD.setColor(0, 255, 0);
    myGLCD.fillRoundRect(183, 0, 284, 119); //top log box
    myGLCD.setBackColor(0, 255, 0);
    myGLCD.setColor(0, 0, 0);
    break; 
  default:
    break;    
  }
}


void loggerInit()
{
  lat_big = lat/100000;
  lat_small = lat - lat_big*100000;
  long_big = lon/100000;
  long_small = long_big*100000 - lon;
 
  // create a new file
  sprintf(filename, "%s%i.csv", rtc.getMonthStr(),t.date);
  
  file.create(filename);
  
  file.openFile(filename, FILEMODE_TEXT_WRITE);
  
  sprintf(strbuf, "%s,%u:%u:%u:%i, %i.%u, %i.%u, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i",
          rtc.getDateStr(FORMAT_LONG, FORMAT_MIDDLEENDIAN), hour, minute, second, millis, lat_big, lat_small, long_big, long_small,
          gpsspeed, an[0], an[1], an[2], an[3], an[4], an[5], an[6], an[7], an[8], an[9], an[10], an[11], an[12], an[13], an[14], an[15]);

  //Serial.println(strbuf);
  //Serial.println();
  file.writeLn(strbuf);
  file.closeFile();
  delay(500);
}



