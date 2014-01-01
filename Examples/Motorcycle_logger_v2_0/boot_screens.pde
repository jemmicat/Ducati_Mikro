void lcdShowIntro(){
  
  digitalWrite(shift_light_high, HIGH);   // set the LED on
  myGLCD.loadBitmap(0, 0, 400, 240, "SPLASH0.RAW");
  myGLCD.setFont(OCR_A_Extended_M);
  myGLCD.setColor(0, 0, 0);
  myGLCD.setBackColor(255, 0, 0);
  myGLCD.printNumF(firmware_version, 1, RIGHT, 0);
  delay(2000);
  digitalWrite(shift_light_high, LOW);
  digitalWrite(shift_light_medhigh, HIGH);
  myGLCD.loadBitmap(0, 0, 400, 240, "SPLASH1.RAW");
  delay(2000);
  digitalWrite(shift_light_medhigh, LOW);
  digitalWrite(shift_light_low, HIGH);
  myGLCD.loadBitmap(0, 0, 400, 240, "SPLASH2.RAW");
  delay(2000);
  digitalWrite(shift_light_low, LOW);

  //flash lights saying ready
  delay(50);
  digitalWrite(shift_light_high, HIGH);   // set the LED on
  digitalWrite(shift_light_medhigh, HIGH);   // set the LED on
  digitalWrite(shift_light_low, HIGH);   // set the LED on
  delay(50);
  digitalWrite(shift_light_high, LOW);
  digitalWrite(shift_light_medhigh, LOW);
  digitalWrite(shift_light_low, LOW);
  delay(50);
  digitalWrite(shift_light_high, HIGH);   // set the LED on
  digitalWrite(shift_light_medhigh, HIGH);   // set the LED on
  digitalWrite(shift_light_low, HIGH);   // set the LED on
  delay(50);
  digitalWrite(shift_light_high, LOW);
  digitalWrite(shift_light_medhigh, LOW);
  digitalWrite(shift_light_low, LOW);
  delay(50);
  digitalWrite(shift_light_high, HIGH);   // set the LED on
  digitalWrite(shift_light_medhigh, HIGH);   // set the LED on
  digitalWrite(shift_light_low, HIGH);   // set the LED on
  delay(50);
  digitalWrite(shift_light_high, LOW);
  digitalWrite(shift_light_medhigh, LOW);
  digitalWrite(shift_light_low, LOW);
  delay(50);
}




