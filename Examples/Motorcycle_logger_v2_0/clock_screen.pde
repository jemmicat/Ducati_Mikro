// Clock Settings

void Screen4Init()
{ 
    myGLCD.setColor(0, 0, 0);
    myGLCD.fillRoundRect(65, 3, 396, 237);
    myGLCD.drawRoundRect(62, 0, 399, 239);
    drawDisplay();
    printDate();
}


void Screen4Work()
{ 
  int x, y;
  
  t = rtc.getTime();
  if (t.date==0)
  {
    setClock();
  }
  
  t = rtc.getTime();
  
  //while (true)
  {
    if (oldsec!=t.sec)
    {
      if ((t.sec==0) and (t.min==0) and (t.hour==0))
      {
        clearDate();
        printDate();
      }
      if (t.sec==0)
      {
        drawMin(t.min);
        drawHour(t.hour, t.min);
      }
      drawSec(t.sec);
      oldsec=t.sec;
    }
    delay(10);
    t = rtc.getTime();
  }
  
}

