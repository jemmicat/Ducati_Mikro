void drawDisplay()
{
  
  // Set Font
      myGLCD.setFont(BigFont);

  // Draw Clockface
  myGLCD.setColor(0, 0, 255);
  myGLCD.setBackColor(0, 0, 0);
  for (int i=0; i<5; i++)
  {
    myGLCD.drawCircle(clockCenterX, clockCenterY, 117-i);
  }
  for (int i=0; i<5; i++)
  {
    myGLCD.drawCircle(clockCenterX, clockCenterY, i);
  }
  
  myGLCD.setColor(192, 192, 255);
  myGLCD.print("3", clockCenterX+92, clockCenterY-8);
  myGLCD.print("6", clockCenterX-8, clockCenterY+95);
  myGLCD.print("9", clockCenterX-109, clockCenterY-8);
  myGLCD.print("12", clockCenterX-16, clockCenterY-109);
  for (int i=0; i<12; i++)
  {
    if ((i % 3)!=0)
      drawMark(i);
  }  
  t = rtc.getTime();
  drawMin(t.min);
  drawHour(t.hour, t.min);
  drawSec(t.sec);
  oldsec=t.sec;

  // Draw calendar
  myGLCD.setColor(255, 255, 255);
  myGLCD.fillRoundRect(310, 5, 389, 85);
  myGLCD.setColor(0, 0, 0);
  for (int i=0; i<7; i++)
  {
    myGLCD.drawLine(319+(i*10), 5, 318+(i*10), 8);
    myGLCD.drawLine(320+(i*10), 5, 319+(i*10), 8);
    myGLCD.drawLine(321+(i*10), 5, 320+(i*10), 8);
  }

  // Draw SET button
  myGLCD.setColor(64, 64, 128);
  myGLCD.fillRoundRect(320, 190, 379, 229);
  myGLCD.setColor(255, 255, 255);
  myGLCD.drawRoundRect(320, 190, 379, 229);
  myGLCD.setBackColor(64, 64, 128);
  myGLCD.print("SET", 326, 202);
  myGLCD.setBackColor(0, 0, 0);
}

void drawMark(int h)
{
  float x1, y1, x2, y2;
  
  h=h*30;
  h=h+270;
  
  x1=110*cos(h*0.0175);
  y1=110*sin(h*0.0175);
  x2=100*cos(h*0.0175);
  y2=100*sin(h*0.0175);
  
  myGLCD.drawLine(x1+clockCenterX, y1+clockCenterY, x2+clockCenterX, y2+clockCenterY);
}

void drawSec(int s)
{
  float x1, y1, x2, y2;
  int ps = s-1;
  
  myGLCD.setColor(0, 0, 0);
  if (ps==-1)
    ps=59;
  ps=ps*6;
  ps=ps+270;
  
  x1=95*cos(ps*0.0175);
  y1=95*sin(ps*0.0175);
  x2=80*cos(ps*0.0175);
  y2=80*sin(ps*0.0175);
  
  myGLCD.drawLine(x1+clockCenterX, y1+clockCenterY, x2+clockCenterX, y2+clockCenterY);

  myGLCD.setColor(255, 0, 0);
  s=s*6;
  s=s+270;
  
  x1=95*cos(s*0.0175);
  y1=95*sin(s*0.0175);
  x2=80*cos(s*0.0175);
  y2=80*sin(s*0.0175);
  
  myGLCD.drawLine(x1+clockCenterX, y1+clockCenterY, x2+clockCenterX, y2+clockCenterY);
}

void drawMin(int m)
{
  float x1, y1, x2, y2, x3, y3, x4, y4;
  int pm = m-1;
  
  myGLCD.setColor(0, 0, 0);
  if (pm==-1)
    pm=59;
  pm=pm*6;
  pm=pm+270;
  
  x1=80*cos(pm*0.0175);
  y1=80*sin(pm*0.0175);
  x2=5*cos(pm*0.0175);
  y2=5*sin(pm*0.0175);
  x3=30*cos((pm+4)*0.0175);
  y3=30*sin((pm+4)*0.0175);
  x4=30*cos((pm-4)*0.0175);
  y4=30*sin((pm-4)*0.0175);
  
  myGLCD.drawLine(x1+clockCenterX, y1+clockCenterY, x3+clockCenterX, y3+clockCenterY);
  myGLCD.drawLine(x3+clockCenterX, y3+clockCenterY, x2+clockCenterX, y2+clockCenterY);
  myGLCD.drawLine(x2+clockCenterX, y2+clockCenterY, x4+clockCenterX, y4+clockCenterY);
  myGLCD.drawLine(x4+clockCenterX, y4+clockCenterY, x1+clockCenterX, y1+clockCenterY);

  myGLCD.setColor(0, 255, 0);
  m=m*6;
  m=m+270;
  
  x1=80*cos(m*0.0175);
  y1=80*sin(m*0.0175);
  x2=5*cos(m*0.0175);
  y2=5*sin(m*0.0175);
  x3=30*cos((m+4)*0.0175);
  y3=30*sin((m+4)*0.0175);
  x4=30*cos((m-4)*0.0175);
  y4=30*sin((m-4)*0.0175);
  
  myGLCD.drawLine(x1+clockCenterX, y1+clockCenterY, x3+clockCenterX, y3+clockCenterY);
  myGLCD.drawLine(x3+clockCenterX, y3+clockCenterY, x2+clockCenterX, y2+clockCenterY);
  myGLCD.drawLine(x2+clockCenterX, y2+clockCenterY, x4+clockCenterX, y4+clockCenterY);
  myGLCD.drawLine(x4+clockCenterX, y4+clockCenterY, x1+clockCenterX, y1+clockCenterY);
}

void drawHour(int h, int m)
{
  float x1, y1, x2, y2, x3, y3, x4, y4;
  int ph = h;
  
  myGLCD.setColor(0, 0, 0);
  if (m==0)
  {
    ph=((ph-1)*30)+((m+59)/2);
  }
  else
  {
    ph=(ph*30)+((m-1)/2);
  }
  ph=ph+270;
  
  x1=60*cos(ph*0.0175);
  y1=60*sin(ph*0.0175);
  x2=5*cos(ph*0.0175);
  y2=5*sin(ph*0.0175);
  x3=20*cos((ph+5)*0.0175);
  y3=20*sin((ph+5)*0.0175);
  x4=20*cos((ph-5)*0.0175);
  y4=20*sin((ph-5)*0.0175);
  
  myGLCD.drawLine(x1+clockCenterX, y1+clockCenterY, x3+clockCenterX, y3+clockCenterY);
  myGLCD.drawLine(x3+clockCenterX, y3+clockCenterY, x2+clockCenterX, y2+clockCenterY);
  myGLCD.drawLine(x2+clockCenterX, y2+clockCenterY, x4+clockCenterX, y4+clockCenterY);
  myGLCD.drawLine(x4+clockCenterX, y4+clockCenterY, x1+clockCenterX, y1+clockCenterY);

  myGLCD.setColor(255, 255, 0);
  h=(h*30)+(m/2);
  h=h+270;
  
  x1=60*cos(h*0.0175);
  y1=60*sin(h*0.0175);
  x2=5*cos(h*0.0175);
  y2=5*sin(h*0.0175);
  x3=20*cos((h+5)*0.0175);
  y3=20*sin((h+5)*0.0175);
  x4=20*cos((h-5)*0.0175);
  y4=20*sin((h-5)*0.0175);
  
  myGLCD.drawLine(x1+clockCenterX, y1+clockCenterY, x3+clockCenterX, y3+clockCenterY);
  myGLCD.drawLine(x3+clockCenterX, y3+clockCenterY, x2+clockCenterX, y2+clockCenterY);
  myGLCD.drawLine(x2+clockCenterX, y2+clockCenterY, x4+clockCenterX, y4+clockCenterY);
  myGLCD.drawLine(x4+clockCenterX, y4+clockCenterY, x1+clockCenterX, y1+clockCenterY);
}

void printDate()
{
  Time t_temp;
  
  t_temp = rtc.getTime();
  myGLCD.setFont(BigFont);
  myGLCD.setColor(0, 0, 0);
  myGLCD.setBackColor(255, 255, 255);
  myGLCD.print(rtc.getDOWStr(FORMAT_SHORT), 326, 8);
  if (t_temp.date<10)
    myGLCD.printNumI(t_temp.date, 342, 28);
  else
    myGLCD.printNumI(t_temp.date, 334, 28);
  myGLCD.print(rtc.getMonthStr(FORMAT_SHORT), 326, 48);
  myGLCD.printNumI(t_temp.year, 318, 65);
}

void clearDate()
{
  myGLCD.setColor(255, 255, 255);
  myGLCD.fillRect(318, 8, 322, 81);
}

void waitForTouchRelease()
{
  // Wait for release
  while (myTouch.dataAvailable()==true)
    myTouch.read();
}

void drawUpButton(int x, int y)
{
  myGLCD.setColor(64, 64, 128);
  myGLCD.fillRoundRect(x, y, x+32, y+25);
  myGLCD.setColor(255, 255, 255);
  myGLCD.drawRoundRect(x, y, x+32, y+25);
  myGLCD.setColor(128, 128, 255);
  for (int i=0; i<15; i++)
    myGLCD.drawLine(x+6+(i/1.5), y+20-i, x+27-(i/1.5), y+20-i);
}

void drawDownButton(int x, int y)
{
  myGLCD.setColor(64, 64, 128);
  myGLCD.fillRoundRect(x, y, x+32, y+25);
  myGLCD.setColor(255, 255, 255);
  myGLCD.drawRoundRect(x, y, x+32, y+25);
  myGLCD.setColor(128, 128, 255);
  for (int i=0; i<15; i++)
    myGLCD.drawLine(x+6+(i/1.5), y+5+i, x+27-(i/1.5), y+5+i);
}

void buttonWait(int x, int y)
{
  myGLCD.setColor(255, 0, 0);
  myGLCD.drawRoundRect(x, y, x+32, y+25);
  waitForTouchRelease();
  myGLCD.setColor(255, 255, 255);
  myGLCD.drawRoundRect(x, y, x+32, y+25);
}

byte calcDOW(byte d, byte m, int y)
{
  int dow;
  byte mArr[12] = {6,2,2,5,0,3,5,1,4,6,2,4};
  
  dow = (y % 100);
  dow = dow*1.25;
  dow += d;
  dow += mArr[m-1];
  if (((y % 4)==0) && (m<3))
    dow -= 1;
  while (dow>7)
    dow -= 7;
    
  return dow;
}

void showDOW(byte dow)
{
  char* str[] = {"MON","TUE","WED","THU","FRI","SAT","SUN"};
  
  myGLCD.setColor(128, 128, 255);
  myGLCD.setBackColor(0, 0, 0);
  myGLCD.print(str[dow-1], 26, 167);
}

byte validateDate(byte d, byte m, word y)
{
  byte mArr[12] = {31,0,31,30,31,30,31,31,30,31,30,31};
  byte od;
  
  if (m==2)
  {
    if ((y % 4)==0)
    {
      if (d==30)
        od=1;
      else if (d==0)
        od=29;
      else
        od=d;
    }
    else
    {
      if (d==29)
        od=1;
      else if (d==0)
        od=28;
      else
        od=d;
    }
  }
  else
  {
    if (d==0)
      od=mArr[m-1];
    else if (d==(mArr[m-1]+1))
      od=1;
    else
      od=d;
  }
  
  return od;
}

byte validateDateForMonth(byte d, byte m, word y)
{
  byte mArr[12] = {31,0,31,30,31,30,31,31,30,31,30,31};
  byte od;
  boolean dc=false;
  
  if (m==2)
  {
    if ((y % 4)==0)
    {
      if (d>29)
      {
        d=29;
        dc=true;
      }
    }
    else
    {  
      if (d>28)
      {
        d=28;
        dc=true;
      }
    }
  }
  else
  {
    if (d>mArr[m-1])
    {
      d=mArr[m-1];
      dc=true;
    }
  }
  
  if (dc)
  {
    if (d<10)
    {
      myGLCD.printNumI(0, 122, 140);
      myGLCD.printNumI(d, 138, 140);
    }
    else
    {
      myGLCD.printNumI(d, 122, 140);
    }
  }
  
  return d;
}

void setClock()
{
  Time t_temp;
  int x, y;
  int res = 0;
  boolean ct=false;
  boolean cd=false;
  
  waitForTouchRelease();    
  
  myGLCD.clrScr();
  myGLCD.setFont(BigFont);
  
  // Draw Save button
  myGLCD.setColor(64, 64, 128);
  myGLCD.fillRoundRect(165, 200, 319, 239);
  myGLCD.setColor(255, 255, 255);
  myGLCD.drawRoundRect(165, 200, 319, 239);
  myGLCD.setBackColor(64, 64, 128);
  myGLCD.print("Save", 210, 212);
  myGLCD.setBackColor(0, 0, 0);
  // Draw Cancel button
  myGLCD.setColor(64, 64, 128);
  myGLCD.fillRoundRect(0, 200, 154, 239);
  myGLCD.setColor(255, 255, 255);
  myGLCD.drawRoundRect(0, 200, 154, 239);
  myGLCD.setBackColor(64, 64, 128);
  myGLCD.print("Cancel", 29, 212);
  myGLCD.setBackColor(0, 0, 0);
  
  // Draw frames
  myGLCD.setColor(0, 0, 255);
  myGLCD.drawRoundRect(0, 0, 319, 96);
  myGLCD.drawRoundRect(0, 100, 319, 196);
  myGLCD.print("Time:", 10, 40);
  myGLCD.print(":", 154, 40);
  myGLCD.print(":", 202, 40);
  myGLCD.print("Date:", 10, 140);
  myGLCD.print("/", 154, 140);
  myGLCD.print("/", 202, 140);
  
  // Draw Buttons
  drawUpButton(122, 10);
  drawUpButton(170, 10);
  drawUpButton(218, 10);
  drawDownButton(122, 61);
  drawDownButton(170, 61);
  drawDownButton(218, 61);
  drawUpButton(122, 110);
  drawUpButton(170, 110);
  drawUpButton(234, 110);
  drawDownButton(122, 161);
  drawDownButton(170, 161);
  drawDownButton(234, 161);
  
  // Print current time and date
  myGLCD.setColor(255, 255, 255);
  t_temp = rtc.getTime();
  if (t_temp.date==0)
  {
    t_temp.date=1;
    t_temp.mon=1;
    t_temp.year=2010;
    t_temp.dow=5;
    t_temp.hour=0;
    t_temp.min=0;
    t_temp.sec=0;
    ct=true;
    cd=true;
  }
  
  if (t_temp.hour<10)
  {
    myGLCD.printNumI(0, 122, 40);
    myGLCD.printNumI(t_temp.hour, 138, 40);
  }
  else
  {
    myGLCD.printNumI(t_temp.hour, 122, 40);
  }
  if (t_temp.min<10)
  {
    myGLCD.printNumI(0, 170, 40);
    myGLCD.printNumI(t_temp.min, 186, 40);
  }
  else
  {
    myGLCD.printNumI(t_temp.min, 170, 40);
  }
  if (t_temp.sec<10)
  {
    myGLCD.printNumI(0, 218, 40);
    myGLCD.printNumI(t_temp.sec, 234, 40);
  }
  else
  {
    myGLCD.printNumI(t_temp.sec, 218, 40);
  }
  if (t_temp.mon<10)
  {
    myGLCD.printNumI(0, 122, 140);
    myGLCD.printNumI(t_temp.mon, 138, 140);
  }
  else
  {
    myGLCD.printNumI(t_temp.mon, 122, 140);
  }
  if (t_temp.date<10)
  {
    myGLCD.printNumI(0, 170, 140);
    myGLCD.printNumI(t_temp.date, 186, 140);
  }
  else
  {
    myGLCD.printNumI(t_temp.date, 170, 140);
  }
  myGLCD.printNumI(t_temp.year, 218, 140);
  showDOW(t_temp.dow);
  
  while (res==0)
  {
    if (myTouch.dataAvailable())
    {
      myTouch.read();
      x=myTouch.getX();
      y=myTouch.getY();
      if ((y>=10) && (y<=35)) // Buttons: Time UP
      {
        if ((x>=122) && (x<=154))
        {
          buttonWait(122, 10);
          t_temp.hour+=1;
          if (t_temp.hour==24)
            t_temp.hour=0;
          if (t_temp.hour<10)
          {
            myGLCD.printNumI(0, 122, 40);
            myGLCD.printNumI(t_temp.hour, 138, 40);
          }
          else
          {
            myGLCD.printNumI(t_temp.hour, 122, 40);
          }
          if (ct==false)
          {
            ct=true;
            myGLCD.setColor(64, 64, 128);
            myGLCD.setFont(SmallFont);
            myGLCD.print("Changed!", 10, 10);
            myGLCD.setColor(255, 255, 255);
            myGLCD.setFont(BigFont);
          }
        }
        else if ((x>=170) && (x<=202))
        {
          buttonWait(170, 10);
          t_temp.min+=1;
          if (t_temp.min==60)
            t_temp.min=0;
          if (t_temp.min<10)
          {
            myGLCD.printNumI(0, 170, 40);
            myGLCD.printNumI(t_temp.min, 186, 40);
          }
          else
          {
            myGLCD.printNumI(t_temp.min, 170, 40);
          }
          if (ct==false)
          {
            ct=true;
            myGLCD.setColor(64, 64, 128);
            myGLCD.setFont(SmallFont);
            myGLCD.print("Changed!", 10, 10);
            myGLCD.setColor(255, 255, 255);
            myGLCD.setFont(BigFont);
          }
        }
        else if ((x>=218) && (x<=250))
        {
          buttonWait(218, 10);
          t_temp.sec+=1;
          if (t_temp.sec==60)
            t_temp.sec=0;
          if (t_temp.sec<10)
          {
            myGLCD.printNumI(0, 218, 40);
            myGLCD.printNumI(t_temp.sec, 234, 40);
          }
          else
          {
            myGLCD.printNumI(t_temp.sec, 218, 40);
          }
          if (ct==false)
          {
            ct=true;
            myGLCD.setColor(64, 64, 128);
            myGLCD.setFont(SmallFont);
            myGLCD.print("Changed!", 10, 10);
            myGLCD.setColor(255, 255, 255);
            myGLCD.setFont(BigFont);
          }
        }
      }
      else if ((y>=61) && (y<=86)) // Buttons: Time DOWN
      {
        if ((x>=122) && (x<=154))
        {
          buttonWait(122, 61);
          t_temp.hour-=1;
          if (t_temp.hour==255)
            t_temp.hour=23;
          if (t_temp.hour<10)
          {
            myGLCD.printNumI(0, 122, 40);
            myGLCD.printNumI(t_temp.hour, 138, 40);
          }
          else
          {
            myGLCD.printNumI(t_temp.hour, 122, 40);
          }
          if (ct==false)
          {
            ct=true;
            myGLCD.setColor(64, 64, 128);
            myGLCD.setFont(SmallFont);
            myGLCD.print("Changed!", 10, 10);
            myGLCD.setColor(255, 255, 255);
            myGLCD.setFont(BigFont);
          }
        }
        else if ((x>=170) && (x<=202))
        {
          buttonWait(170, 61);
          t_temp.min-=1;
          if (t_temp.min==255)
            t_temp.min=59;
          if (t_temp.min<10)
          {
            myGLCD.printNumI(0, 170, 40);
            myGLCD.printNumI(t_temp.min, 186, 40);
          }
          else
          {
            myGLCD.printNumI(t_temp.min, 170, 40);
          }
          if (ct==false)
          {
            ct=true;
            myGLCD.setColor(64, 64, 128);
            myGLCD.setFont(SmallFont);
            myGLCD.print("Changed!", 10, 10);
            myGLCD.setColor(255, 255, 255);
            myGLCD.setFont(BigFont);
          }
        }
        else if ((x>=218) && (x<=250))
        {
          buttonWait(218, 61);
          t_temp.sec-=1;
          if (t_temp.sec==255)
            t_temp.sec=59;
          if (t_temp.sec<10)
          {
            myGLCD.printNumI(0, 218, 40);
            myGLCD.printNumI(t_temp.sec, 234, 40);
          }
          else
          {
            myGLCD.printNumI(t_temp.sec, 218, 40);
          }
          if (ct==false)
          {
            ct=true;
            myGLCD.setColor(64, 64, 128);
            myGLCD.setFont(SmallFont);
            myGLCD.print("Changed!", 10, 10);
            myGLCD.setColor(255, 255, 255);
            myGLCD.setFont(BigFont);
          }
        }
      }
      if ((y>=110) && (y<=135)) // Buttons: Date UP
      {
        if ((x>=170) && (x<=202))
        {
          buttonWait(170, 110);
          t_temp.date+=1;
          t_temp.date=validateDate(t_temp.date, t_temp.mon, t_temp.year);
          if (t_temp.date<10)
          {
            myGLCD.printNumI(0, 170, 140);
            myGLCD.printNumI(t_temp.date, 186, 140);
          }
          else
          {
            myGLCD.printNumI(t_temp.date, 170, 140);
          }
          if (cd==false)
          {
            cd=true;
            myGLCD.setColor(64, 64, 128);
            myGLCD.setFont(SmallFont);
            myGLCD.print("Changed!", 10, 110);
            myGLCD.setColor(255, 255, 255);
            myGLCD.setFont(BigFont);
          }
        }
        else if ((x>=122) && (x<=154))
        {
          buttonWait(122, 110);
          t_temp.mon+=1;
          if (t_temp.mon==13)
            t_temp.mon=1;
          if (t_temp.mon<10)
          {
            myGLCD.printNumI(0, 122, 140);
            myGLCD.printNumI(t_temp.mon, 138, 140);
          }
          else
          {
            myGLCD.printNumI(t_temp.mon, 122, 140);
          }
          t_temp.date=validateDateForMonth(t_temp.date, t_temp.mon, t_temp.year);
          if (cd==false)
          {
            cd=true;
            myGLCD.setColor(64, 64, 128);
            myGLCD.setFont(SmallFont);
            myGLCD.print("Changed!", 10, 110);
            myGLCD.setColor(255, 255, 255);
            myGLCD.setFont(BigFont);
          }
        }
        else if ((x>=218) && (x<=250))
        {
          buttonWait(234, 110);
          t_temp.year+=1;
          if (t_temp.year==2100)
            t_temp.year=2000;
          myGLCD.printNumI(t_temp.year, 218, 140);
          t_temp.date=validateDateForMonth(t_temp.date, t_temp.mon, t_temp.year);
          if (cd==false)
          {
            cd=true;
            myGLCD.setColor(64, 64, 128);
            myGLCD.setFont(SmallFont);
            myGLCD.print("Changed!", 10, 110);
            myGLCD.setColor(255, 255, 255);
            myGLCD.setFont(BigFont);
          }
        }
        t_temp.dow=calcDOW(t_temp.date, t_temp.mon, t_temp.year);
        showDOW(t_temp.dow);
      }
      else if ((y>=161) && (y<=186)) // Buttons: Date DOWN
      {
        if ((x>=170) && (x<=202))
        {
          buttonWait(170, 161);
          t_temp.date-=1;
          t_temp.date=validateDate(t_temp.date, t_temp.mon, t_temp.year);
          if (t_temp.date<10)
          {
            myGLCD.printNumI(0, 170, 140);
            myGLCD.printNumI(t_temp.date, 186, 140);
          }
          else
          {
            myGLCD.printNumI(t_temp.date, 170, 140);
          }
          if (cd==false)
          {
            cd=true;
            myGLCD.setColor(64, 64, 128);
            myGLCD.setFont(SmallFont);
            myGLCD.print("Changed!", 10, 110);
            myGLCD.setColor(255, 255, 255);
            myGLCD.setFont(BigFont);
          }
        }
        else if ((x>=122) && (x<=154))
        {
          buttonWait(122, 161);
          t_temp.mon-=1;
          if (t_temp.mon==0)
            t_temp.mon=12;
          if (t_temp.mon<10)
          {
            myGLCD.printNumI(0, 122, 140);
            myGLCD.printNumI(t_temp.mon, 138, 140);
          }
          else
          {
            myGLCD.printNumI(t_temp.mon, 122, 140);
          }
          t_temp.date=validateDateForMonth(t_temp.date, t_temp.mon, t_temp.year);
          if (cd==false)
          {
            cd=true;
            myGLCD.setColor(64, 64, 128);
            myGLCD.setFont(SmallFont);
            myGLCD.print("Changed!", 10, 110);
            myGLCD.setColor(255, 255, 255);
            myGLCD.setFont(BigFont);
          }
        }
        else if ((x>=218) && (x<=250))
        {
          buttonWait(234, 161);
          t_temp.year-=1;
          if (t_temp.year==1999)
            t_temp.year=2099;
          myGLCD.printNumI(t_temp.year, 218, 140);
          t_temp.date=validateDateForMonth(t_temp.date, t_temp.mon, t_temp.year);
          if (cd==false)
          {
            cd=true;
            myGLCD.setColor(64, 64, 128);
            myGLCD.setFont(SmallFont);
            myGLCD.print("Changed!", 10, 110);
            myGLCD.setColor(255, 255, 255);
            myGLCD.setFont(BigFont);
          }
        }
        t_temp.dow=calcDOW(t_temp.date, t_temp.mon, t_temp.year);
        showDOW(t_temp.dow);
      }
      else if ((y>=200) && (y<=239)) // Buttons: CANCEL / SAVE
      {
        if ((x>=165) && (x<=319))
        {
          res=1;
          myGLCD.setColor (255, 0, 0);
          myGLCD.drawRoundRect(165, 200, 319, 239);
        }
        else if ((x>=0) && (x<=154))
        {
          res=2;
          myGLCD.setColor (255, 0, 0);
          myGLCD.drawRoundRect(0, 200, 154, 239);
        }
      }
    }
  }
  
  waitForTouchRelease();

  if (res==1)
  {
    if (ct)
      rtc.setTime(t_temp.hour, t_temp.min, t_temp.sec);
    if (cd)
    {
      rtc.setDate(t_temp.date, t_temp.mon, t_temp.year);
      rtc.setDOW(t_temp.dow);
    }
  }
  myGLCD.loadBitmap(0, 0, 400, 240, "LAYOUT1.RAW");
  Screen4Init();
  drawDisplay();
  printDate();
}

