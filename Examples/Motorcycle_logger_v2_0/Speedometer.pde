void SpeedometerInit(){

  myGLCD.fillScr(255, 255, 255);
  myGLCD.setColor(0, 0, 0);
  myGLCD.setBackColor(255, 255, 255);
  myGLCD.drawCircle(199, 192, 190);
  myGLCD.drawCircle(199, 192, 191);
  myGLCD.drawCircle(199, 192, 192);
  myGLCD.setColor(255, 0, 0);
  myGLCD.fillCircle(199, 192, 30);

  //draw numbers on speedometer face
  myGLCD.setFont(SmallFont);
  myGLCD.setColor(255, 0, 0);
  myGLCD.setBackColor(255, 255, 255);
  myGLCD.print("0", 22, 185);
  myGLCD.print("10", 22, 161);
  myGLCD.print("20", 30, 130);
  myGLCD.print("30", 43, 102);
  myGLCD.print("40", 61, 76);
  myGLCD.print("50", 83, 54);
  myGLCD.print("60", 109, 36);
  myGLCD.print("70", 137, 24);
  myGLCD.print("80", 168, 15);
  myGLCD.print("90", 199, 12);
  myGLCD.print("100", 223, 15);
  myGLCD.print("110", 250, 23);
  myGLCD.print("120", 275, 36);
  myGLCD.print("130", 295, 54);
  myGLCD.print("140", 318, 76);
  myGLCD.print("150", 334, 102);
  myGLCD.print("160", 346, 130);
  myGLCD.print("170", 354, 161);
  myGLCD.print("180", 360, 185);
  
  myGLCD.setColor(0, 0, 0);
  myGLCD.fillRect(0, 199, 399, 239);
  
  
  myGLCD.drawBitmap (341, 0, 48, 48, home_button, 1);

}

void SpeedometerWork(){
}

void displayspeed()
{

  if (gpsspeed < 200) {

    if (gpsspeed >= 100) { // first we need to find out how many digits are in our number.
      n = 2;
      k = 100;
    }
    else if (gpsspeed >= 10){
      n = 1;
      k = 10;
    }
    else if (gpsspeed >= 0) {
      n = 0;		 // we'll use this for our array index as well so we'll start at zero
      k = 1;
    }


  }
  else n = -1; // this can flag an error when you make this a function

  int temp = gpsspeed; // don't destroy x

  for (int i = n; i >= 0; i--) // break the number apart 1 decade at a time
  {
    speed_gps[i] = temp / k; // integer divide isolates MSD
    temp = temp - (speed_gps[i] * k); // remaining digits
    k = k / 10; // decrement decade
  }
}
