//max values screen

void Screen5Init()
{
  
  //box layout
  myGLCD.setColor(0, 0, 0);
  myGLCD.fillRoundRect(65, 3, 396, 236);
  myGLCD.setColor(255, 0, 0);
  myGLCD.drawRoundRect(62, 0, 399, 239);
  myGLCD.drawRoundRect(63, 1, 398, 238);
  myGLCD.drawRoundRect(64, 2, 397, 237);
  
  myGLCD.drawRoundRect(65, 119, 230, 239); // bottom screen split left  
  myGLCD.drawRoundRect(231, 119, 397, 239); // bottom screen split Right
  myGLCD.drawRoundRect(65, 3, 230, 118); // top screen split left  
  myGLCD.drawRoundRect(231, 3, 397, 118); // top screen split Right
  myGLCD.drawBitmap (198, 87, 64, 64, reset_button, 1);

}

void Screen5Work(){
 
 myGLCD.setFont(OCR_A_Extended_M);
 myGLCD.setColor(255, 0, 0);
 myGLCD.setBackColor(0, 0, 0);
 myGLCD.print("Lean", 105, 10);
 myGLCD.print("Angle", 90, 40);
 myGLCD.printNumI(MaxLeanAngtemp, 125, 80);
 
 myGLCD.setFont(OCR_A_Extended_M);
 myGLCD.setColor(255, 0, 0);
 myGLCD.setBackColor(0, 0, 0);
 myGLCD.print("Max", 280, 10);
 myGLCD.print("Accel", 260, 40);
 myGLCD.printNumI(MaxGForcetemp, 300, 80);
 
 
 myGLCD.setFont(OCR_A_Extended_M);
 myGLCD.setColor(255, 0, 0);
 myGLCD.setBackColor(0, 0, 0);
 myGLCD.print("Max", 105, 130);
 myGLCD.print("Speed", 85, 160);
 myGLCD.printNumI(MaxSpeedtemp, 125, 200);
 
 myGLCD.setFont(OCR_A_Extended_M);
 myGLCD.setColor(255, 0, 0);
 myGLCD.setBackColor(0, 0, 0);
 myGLCD.print("Max", 280, 130);
 myGLCD.print("RPM", 280, 160);
 myGLCD.printNumI(MaxRPMtemp, 300, 80);
 
}
