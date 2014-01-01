int BackGroundColor = CL_SILVER;                                                // Set background color

const code far char IKONA_BMP[10980];

const code far char Impact20x29[];                                              // Declarations of used fonts
const code far char Tahoma17x21[];
const code far char Tahoma24x29[];
const code far char Tahoma43x52[];

void Set_First_Screen() {

  TFT_Set_Pen(CL_WHITE,1);
  TFT_Set_Brush(1,CL_WHITE,0,LEFT_TO_RIGHT,CL_WHITE,CL_WHITE);
  TFT_Rectangle(0,0,320,45);
  TFT_Set_Pen(0x002A95,1);
  TFT_Set_Brush(1,0x002A95,0,LEFT_TO_RIGHT,0x002A95,0x002A95);
  TFT_Rectangle(0,46,320,240);
  TFT_Set_Font(Impact20x29,CL_RED,0);
  TFT_Write_Text("MikroElektronika",75,12);
  TFT_Set_Font(Tahoma43x52,0xFFFFFF,0);
  TFT_Write_Text("Datalogger",55,56);
  TFT_Set_Font(Tahoma24x29,0xFFFFFF,0);
  TFT_Write_Text("of   Temperature",118,123);
  TFT_Write_Text("and   Humidity",120,151);
  TFT_Image(20,121,IKONA_bmp,1);
  TFT_Set_Pen(CL_WHITE,1);
  TFT_Set_Brush(1,CL_WHITE,0,LEFT_TO_RIGHT,CL_WHITE,CL_WHITE);
  TFT_Rectangle_Round_Edges(107,193,227,230,7);
  TFT_Set_Font(Tahoma17x21,0x002A95,0);
  TFT_Write_Text("START",140,200);
  TFT_Set_Font(TFT_defaultFont,CL_BLACK,0);
}

void Set_My_Screen() {

  TFT_Fill_Screen(BackGroundColor);
  TFT_Set_Pen(CL_AQUA,1);
  TFT_Set_Brush(1,CL_WHITE,0,LEFT_TO_RIGHT,CL_WHITE,CL_WHITE);
  TFT_Rectangle(40,50,280,210);

  TFT_H_Line(40,280,90);
  TFT_H_Line(40,280,130);
  TFT_H_Line(40,280,170);

  TFT_V_Line(50,210,100);
  TFT_V_Line(50,210,160);
  TFT_V_Line(50,210,220);
  
  TFT_Write_Text("Date: ",15,10);
  TFT_Write_Text("Time: ",15,25);

  TFT_Write_Text("Temp : ",150,10);
  TFT_Write_Text("R.H.  : ",150,25);

  TFT_Set_Font(TFT_defaultFont, CL_RED, FO_HORIZONTAL);
  TFT_Write_Text("10C",15,205);
  TFT_Write_Text("20C",15,165);
  TFT_Write_Text("30C",15,125);
  TFT_Write_Text("40C",15,85);
  TFT_Write_Text("50C",15,45);

  TFT_Set_Font(TFT_defaultFont, CL_BLUE, FO_HORIZONTAL);
  TFT_Write_Text("0%",285,205);
  TFT_Write_Text("25%",285,165);
  TFT_Write_Text("50%",285,125);
  TFT_Write_Text("75%",285,85);
  TFT_Write_Text("100%",285,45);

  TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
  TFT_Write_Char('1',95,210);
  TFT_Write_Char('2',155,210);
  TFT_Write_Char('3',215,210);
  TFT_Write_Char('4',275,210);
  TFT_Write_Text("min",55,210);
}

void Refresh_Screen() {
  TFT_Set_Pen(CL_AQUA ,1);
  TFT_Rectangle(40, 50, 280, 210);
  TFT_Set_Brush(1, CL_WHITE, 0, LEFT_TO_RIGHT, CL_WHITE, CL_WHITE);

  TFT_H_Line(40,280,90);
  TFT_H_Line(40,280,130);
  TFT_H_Line(40,280,170);

  TFT_V_Line(50,210,100);
  TFT_V_Line(50,210,160);
  TFT_V_Line(50,210,220);
}

void Write_On_Screen(char *date,char* time, char *temp, char *humi) {
  TFT_Set_Pen(BackGroundColor,20);

  TFT_Rectangle(60,15,130,35);                                                  // Clears previous values on the screen
  TFT_Write_Text(date,60,10);                                                   // Writes date and time
  TFT_Write_Text(time,60,25);

  TFT_Rectangle(200,10,240,20);
  TFT_Write_Text(temp,195,10);                                                  // Writes temperature value

  TFT_Rectangle(200,35,240,35);
  TFT_Write_Text(humi,195,25);                                                  // Writes humidity value
}