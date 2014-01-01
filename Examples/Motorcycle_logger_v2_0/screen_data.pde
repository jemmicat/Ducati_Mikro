void month(){
  t = rtc.getTime();
  myGLCD.setFont(BigFont);
  myGLCD.setColor(255, 0, 0);
  myGLCD.setBackColor(0, 0, 0);
  myGLCD.print(rtc.getMonthStr(FORMAT_SHORT),70, 6);
  myGLCD.printNumI(t.date, 140, 6);


}

void clock (){

  if (Screen == 2 || Screen == 3){
    t = rtc.getTime();
    myGLCD.setFont(BigFont);
    myGLCD.setColor(255, 0, 0);
    myGLCD.setBackColor(255, 255, 255);
    myGLCD.print(rtc.getTimeStr(FORMAT_SHORT), 50, 163);
  }

  else{
    t = rtc.getTime();
    myGLCD.setFont(BigFont);
    myGLCD.setColor(255, 0, 0);
    myGLCD.setBackColor(0, 0, 0);
    myGLCD.print(rtc.getTimeStr(FORMAT_SHORT), 70, 35);
  }
}

void lm335temp(){
  lm335_temp = an[lm335_pin];
  lm335_tempK = (lm335_init - (lm335_temp * aref_voltage / 1023)) / lm335_tempsense + 298.15;
  lm335_tempF = (lm335_tempK * 9) / 5 - 459.67;  

  if (Screen == 2 || Screen == 3){

    myGLCD.setFont(BigFont);
    myGLCD.setColor(255, 0, 0);
    myGLCD.setBackColor(255, 255, 255);


    //add temperature reading from lm335
    myGLCD.printNumI(lm335_tempF, 270, 163);
    myGLCD.setColor(255, 0, 0);
    myGLCD.print("F", 300, 163);


  }

  else{
    myGLCD.setFont(BigFont);
    myGLCD.setColor(255, 0, 0);
    myGLCD.setBackColor(0, 0, 0);


    //add temperature reading from lm335
    myGLCD.printNumI(lm335_tempF, 330, 22);
    myGLCD.setColor(255, 0, 0);
    myGLCD.print("F", 380, 22);
  }
}



void lean_ang(){
  Ract = sqrt (RwAcc[0] * RwAcc[0] + RwAcc[1] * RwAcc[1] + RwAcc[2] * RwAcc[2]);
  Rest = sqrt (RwEst[0] * RwEst[0] + RwEst[1] * RwEst[1] + RwEst[2] * RwEst[2]);
  lean_angle_act = 90 - ToDeg(acos(RwAcc[1] / Ract));
  lean_angle_est = 90 - ToDeg(acos(RwEst[1] / Rest));
  lean_angle = abs(lean_angle_act);

  if (Screen == 2 || Screen == 3){
    myGLCD.setFont(BigFont);
    myGLCD.setColor(255, 0, 0);
    myGLCD.setBackColor(255, 255, 255);
    displaylean();
    lean1 = lean[1];
    lean0 = lean[0]; 
    if (lean_angle <10){
      myGLCD.print("0", 10, 13);
    }
    else{
      myGLCD.printNumI(lean1, 10, 13);
    }

    myGLCD.printNumI(lean0, 30, 13);


    //myGLCD.printNumI(lean_angle, 125, 75);
    myGLCD.print("Deg", 50, 13);

  }

  else {
    myGLCD.setFont(BigFont);
    myGLCD.setColor(255, 0, 0);
    myGLCD.setBackColor(0, 0, 0);
    displaylean();
    lean1 = lean[1];
    lean0 = lean[0]; 
    if (lean_angle <10){
      myGLCD.print("0", 125, 75);
    }
    else{
      myGLCD.printNumI(lean1, 125, 75);
    }

    myGLCD.printNumI(lean0, 145, 75);


    //myGLCD.printNumI(lean_angle, 125, 75);
    myGLCD.print("Deg", 135, 100);
  }
}

void displaylean()
{
  if (lean_angle < 100) {
    if (lean_angle >= 10) { // first we need to find out how many digits are in our number.
      n = 1;
      k = 10;
    }
    else if (lean_angle >= 0) {
      n = 0;		 // we'll use this for our array index as well so we'll start at zero
      k = 1;
    }

  }
  else n = -1; // this can flag an error when you make this a function

  int temp = lean_angle; // don't destroy x

  for (int i = n; i >= 0; i--) // break the number apart 1 decade at a time
  {
    lean[i] = temp / k; // integer divide isolates MSD
    temp = temp - (lean[i] * k); // remaining digits
    k = k / 10; // decrement decade
  }
}

void battery(){
  float battery_voltage_temp = (Batt_temp * aref_voltage / 1023);
  battery_voltage = battery_ratio * battery_voltage_temp;
  myGLCD.setFont(BigFont);
  myGLCD.setColor(255, 0, 0);
  myGLCD.setBackColor(0, 0, 0);
  myGLCD.printNumI(battery_voltage, 75, 160);
  myGLCD.print("V", 95, 160);
}

void TPS(){
  myGLCD.setFont(BigFont);
  myGLCD.setColor(255, 0, 0);
  myGLCD.setBackColor(0, 0, 0);
  myGLCD.printNumI(TPS_percentage, 100, 220);
  myGLCD.print("%", 120, 220);
}

void front_brake(){
  if (frt_brk == 1)
    myGLCD.drawBitmap (205, 130, 53, 40, brake_on, 1);
  else  
    myGLCD.drawBitmap (205, 130, 54, 40, brake_off, 1);
}

void rear_brake(){
  if (bck_brk == 1)
    myGLCD.drawBitmap (205, 190, 53, 40, brake_on, 1);
  else  
    myGLCD.drawBitmap (205, 190, 54, 40, brake_off, 1);

}

void af_ratio(){
  myGLCD.setFont(BigFont);
  myGLCD.setColor(255, 0, 0);
  myGLCD.setBackColor(0, 0, 0);
  myGLCD.print("AFR", 320,70);
  myGLCD.printNumI(afratio, 340, 100);
}

void front_shock(){
  myGLCD.setFont(BigFont);
  myGLCD.setColor(255, 0, 0);
  myGLCD.setBackColor(0, 0, 0);
  myGLCD.print("F ShK", 300,130);
  myGLCD.printNumI(frk_travel, 320, 160);
  myGLCD.print("in", 350, 160);
}

void rear_shock(){
  myGLCD.setFont(BigFont);
  myGLCD.setColor(255, 0, 0);
  myGLCD.setBackColor(0, 0, 0);
  myGLCD.print("R ShK", 300,190);
  myGLCD.printNumI(shock_travel, 320, 220);
  myGLCD.print("in", 350, 220);
}







