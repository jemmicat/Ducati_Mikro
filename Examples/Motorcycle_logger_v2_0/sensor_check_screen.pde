//Sensor Verification

void Screen1Init()
{ 
  myGLCD.setFont(BigFont);
  //myGLCD.clrScr();
  myGLCD.setColor(0, 0, 0);
  myGLCD.fillRoundRect(65, 3, 396, 236);
  myGLCD.setColor(255, 0, 0);
  myGLCD.setBackColor(0, 0, 0);
  myGLCD.drawRoundRect(62, 0, 399, 239);
  myGLCD.drawRoundRect(63, 0, 183, 59); //left top box
  myGLCD.drawRoundRect(64, 59, 183, 119);

  myGLCD.drawRoundRect(62, 119, 183, 179);
  myGLCD.drawRoundRect(62, 179, 183, 239);
  myGLCD.drawRoundRect(183, 0, 284, 119); //top log box
  myGLCD.drawRoundRect(183, 119, 284, 179);
  myGLCD.drawRoundRect(183, 179, 284, 239);
  myGLCD.drawRoundRect(284, 0, 399, 59); // right top box
  myGLCD.drawRoundRect(284, 59, 399, 119);
  myGLCD.drawRoundRect(284, 119, 399, 179);
  myGLCD.drawRoundRect(284, 179, 399, 239);

  //log button
  if (logger == 1){
    
    myGLCD.drawRoundRect(183, 0, 284, 119); //top log box

  }
  else{

   myGLCD.drawRoundRect(183, 0, 284, 119); //top log box
 
  }
}

void Screen1Work()
{

  myGLCD.setFont(BigFont);
  month();
  battery();
  TPS();
  front_brake();
  rear_brake();
  af_ratio();
  front_shock();
  rear_shock();
}




