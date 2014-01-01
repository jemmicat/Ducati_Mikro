#include "FM_Click_objects.h"
#include "FM_Click_resources.h"
#include "built_in.h"


// TFT module connections
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_RST at GPIOF_ODR.B14;
sbit TFT_RS at GPIOF_ODR.B15;
sbit TFT_CS at GPIOF_ODR.B13;
sbit TFT_RD at GPIOF_ODR.B12;
sbit TFT_WR at GPIOF_ODR.B11;
sbit TFT_BLED at GPIOF_ODR.B10;

// Global variables
unsigned int Xcoord, Ycoord;
char PenDown;
void *PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TButton *local_button;
TButton *exec_button;
int button_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TImage *local_image;
TImage *exec_image;
int image_order;
TBox *local_box;
TBox *exec_box;
int box_order;

void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
  unsigned int temp;
  temp = GPIOE_ODR;
  temp &= 0x00FF;
  GPIOE_ODR = temp | (_hi << 8);
  temp = GPIOG_ODR;
  temp &= 0xFF00;
  GPIOG_ODR = temp | _lo;
}

void TFT_mikromedia_Set_Index(unsigned short index) {
  TFT_RS = 0;
  Write_to_Data_Lines(0, index);
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void TFT_mikromedia_Write_Command(unsigned short cmd) {
  TFT_RS = 1;
  Write_to_Data_Lines(0, cmd);
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void TFT_Write_to_16bitPort(unsigned int _data) {
  TFT_RS = 1;
  Write_to_Data_Lines(Hi(_data), Lo(_data));
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}
static void InitializeTouchPanel() {
    TFT_Set_Active(&TFT_mikromedia_Set_Index, &TFT_mikromedia_Write_Command, &TFT_Write_to_16bitPort);
  TFT_Init_SSD1963(480, 272);

  TFT_Set_DBC_SSD1963(255);

  PenDown = 0;
  PressedObject = 0;
  PressedObjectType = -1;
}


/////////////////////////
  TScreen*  CurrentScreen;

  TScreen                Screen1;
  TBox                   barVol;
  TBox                   Slider;
  TImage               Image4;
  TImage               imgFineDown;
  TImage               imgSeekDown;
  TImage               imgStop;
  TImage               imgFineUp;
  TImage               imgSeekUp;
  TImage               Image2;
  TButton               txtFreq;
char txtFreq_Caption[8] = "87.5";

  TLabel                 Label1;
char Label1_Caption[4] = "MHz";

  TLabel                 Label2;
char Label2_Caption[66] = "Place for RDS text... future development";

  TImage               Image3;
  TLabel                 Label3;
char Label3_Caption[17] = "FM Click Example";

  TImage               Image1;
  TImage               imgVol;
  TLabel                 lblStereo;
char lblStereo_Caption[7] = "Stereo";

  TButton                * const code Screen1_Buttons[1]=
         {
         &txtFreq              
         };
  TLabel                 * const code Screen1_Labels[4]=
         {
         &Label1,              
         &Label2,              
         &Label3,              
         &lblStereo            
         };
  TImage                 * const code Screen1_Images[10]=
         {
         &Image4,              
         &imgFineDown,         
         &imgSeekDown,         
         &imgStop,             
         &imgFineUp,           
         &imgSeekUp,           
         &Image2,              
         &Image3,              
         &Image1,              
         &imgVol               
         };
  TBox                   * const code Screen1_Boxes[2]=
         {
         &barVol,              
         &Slider               
         };



static void InitializeObjects() {
  Screen1.Color                     = 0x3186;
  Screen1.Width                     = 480;
  Screen1.Height                    = 272;
  Screen1.ButtonsCount              = 1;
  Screen1.Buttons                   = Screen1_Buttons;
  Screen1.LabelsCount               = 4;
  Screen1.Labels                    = Screen1_Labels;
  Screen1.ImagesCount               = 10;
  Screen1.Images                    = Screen1_Images;
  Screen1.BoxesCount                = 2;
  Screen1.Boxes                     = Screen1_Boxes;
  Screen1.ObjectsCount              = 17;


  barVol.OwnerScreen     = &Screen1;
  barVol.Order           = 0;
  barVol.Left            = 39;
  barVol.Top             = 229;
  barVol.Width           = 370;
  barVol.Height          = 40;
  barVol.Pen_Width       = 1;
  barVol.Pen_Color       = 0x0000;
  barVol.Visible         = 0;
  barVol.Active          = 0;
  barVol.Transparent     = 1;
  barVol.Gradient        = 1;
  barVol.Gradient_Orientation = 0;
  barVol.Gradient_Start_Color = 0x3186;
  barVol.Gradient_End_Color = 0x632C;
  barVol.Color           = 0xC618;
  barVol.PressColEnabled = 0;
  barVol.Press_Color     = 0xE71C;
  barVol.OnUpPtr         = 0;
  barVol.OnDownPtr       = 0;
  barVol.OnClickPtr      = 0;
  barVol.OnPressPtr      = barVolOnPress;

  Slider.OwnerScreen     = &Screen1;
  Slider.Order           = 1;
  Slider.Left            = 411;
  Slider.Top             = 0;
  Slider.Width           = 69;
  Slider.Height          = 272;
  Slider.Pen_Width       = 0;
  Slider.Pen_Color       = 0x0000;
  Slider.Visible         = 0;
  Slider.Active          = 1;
  Slider.Transparent     = 1;
  Slider.Gradient        = 1;
  Slider.Gradient_Orientation = 0;
  Slider.Gradient_Start_Color = 0xFFFF;
  Slider.Gradient_End_Color = 0xC618;
  Slider.Color           = 0xC618;
  Slider.PressColEnabled = 1;
  Slider.Press_Color     = 0xE71C;
  Slider.OnUpPtr         = 0;
  Slider.OnDownPtr       = 0;
  Slider.OnClickPtr      = 0;
  Slider.OnPressPtr      = SliderOnPress;

  Image4.OwnerScreen     = &Screen1;
  Image4.Order           = 2;
  Image4.Left            = 411;
  Image4.Top             = 0;
  Image4.Width           = 69;
  Image4.Height          = 1320;
  Image4.Picture_Type    = 0;
  Image4.Picture_Ratio   = 1;
  Image4.Picture_Name    = tunner_stripe_3_bmp;
  Image4.Visible         = 0;
  Image4.Active          = 0;
  Image4.OnUpPtr         = 0;
  Image4.OnDownPtr       = 0;
  Image4.OnClickPtr      = 0;
  Image4.OnPressPtr      = 0;

  imgFineDown.OwnerScreen     = &Screen1;
  imgFineDown.Order           = 3;
  imgFineDown.Left            = 113;
  imgFineDown.Top             = 225;
  imgFineDown.Width           = 74;
  imgFineDown.Height          = 47;
  imgFineDown.Picture_Type    = 0;
  imgFineDown.Picture_Ratio   = 1;
  imgFineDown.Picture_Name    = btn_prev_01_bmp;
  imgFineDown.Visible         = 1;
  imgFineDown.Active          = 1;
  imgFineDown.OnUpPtr         = imgFineDownOnUp;
  imgFineDown.OnDownPtr       = imgFineDownOnDown;
  imgFineDown.OnClickPtr      = imgFineDownOnClick;
  imgFineDown.OnPressPtr      = 0;

  imgSeekDown.OwnerScreen     = &Screen1;
  imgSeekDown.Order           = 4;
  imgSeekDown.Left            = 39;
  imgSeekDown.Top             = 225;
  imgSeekDown.Width           = 74;
  imgSeekDown.Height          = 47;
  imgSeekDown.Picture_Type    = 0;
  imgSeekDown.Picture_Ratio   = 1;
  imgSeekDown.Picture_Name    = btn_prev_station_01_bmp;
  imgSeekDown.Visible         = 1;
  imgSeekDown.Active          = 1;
  imgSeekDown.OnUpPtr         = imgSeekDownOnUp;
  imgSeekDown.OnDownPtr       = imgSeekDownOnDown;
  imgSeekDown.OnClickPtr      = imgSeekDownOnClick;
  imgSeekDown.OnPressPtr      = 0;

  imgStop.OwnerScreen     = &Screen1;
  imgStop.Order           = 5;
  imgStop.Left            = 187;
  imgStop.Top             = 225;
  imgStop.Width           = 74;
  imgStop.Height          = 47;
  imgStop.Picture_Type    = 0;
  imgStop.Picture_Ratio   = 1;
  imgStop.Picture_Name    = bnt_play_01_bmp;
  imgStop.Visible         = 1;
  imgStop.Active          = 1;
  imgStop.OnUpPtr         = imgStopOnUp;
  imgStop.OnDownPtr       = imgStopOnDown;
  imgStop.OnClickPtr      = imgStopOnClick;
  imgStop.OnPressPtr      = 0;

  imgFineUp.OwnerScreen     = &Screen1;
  imgFineUp.Order           = 6;
  imgFineUp.Left            = 261;
  imgFineUp.Top             = 225;
  imgFineUp.Width           = 74;
  imgFineUp.Height          = 47;
  imgFineUp.Picture_Type    = 0;
  imgFineUp.Picture_Ratio   = 1;
  imgFineUp.Picture_Name    = btn_next_01_bmp;
  imgFineUp.Visible         = 1;
  imgFineUp.Active          = 1;
  imgFineUp.OnUpPtr         = imgFineUpOnUp;
  imgFineUp.OnDownPtr       = imgFineUpOnDown;
  imgFineUp.OnClickPtr      = imgFineUpOnClick;
  imgFineUp.OnPressPtr      = 0;

  imgSeekUp.OwnerScreen     = &Screen1;
  imgSeekUp.Order           = 7;
  imgSeekUp.Left            = 335;
  imgSeekUp.Top             = 225;
  imgSeekUp.Width           = 74;
  imgSeekUp.Height          = 47;
  imgSeekUp.Picture_Type    = 0;
  imgSeekUp.Picture_Ratio   = 1;
  imgSeekUp.Picture_Name    = btn_next_station_01_bmp;
  imgSeekUp.Visible         = 1;
  imgSeekUp.Active          = 1;
  imgSeekUp.OnUpPtr         = imgSeekUpOnUp;
  imgSeekUp.OnDownPtr       = imgSeekUpOnDown;
  imgSeekUp.OnClickPtr      = imgSeekUpOnClick;
  imgSeekUp.OnPressPtr      = 0;

  Image2.OwnerScreen     = &Screen1;
  Image2.Order           = 8;
  Image2.Left            = 395;
  Image2.Top             = 131;
  Image2.Width           = 12;
  Image2.Height          = 12;
  Image2.Picture_Type    = 0;
  Image2.Picture_Ratio   = 1;
  Image2.Picture_Name    = indicator_bmp;
  Image2.Visible         = 1;
  Image2.Active          = 1;
  Image2.OnUpPtr         = 0;
  Image2.OnDownPtr       = 0;
  Image2.OnClickPtr      = Image2OnClick;
  Image2.OnPressPtr      = 0;

  txtFreq.OwnerScreen     = &Screen1;
  txtFreq.Order           = 9;
  txtFreq.Left            = 77;
  txtFreq.Top             = 83;
  txtFreq.Width           = 228;
  txtFreq.Height          = 108;
  txtFreq.Pen_Width       = 0;
  txtFreq.Pen_Color       = 0x3186;
  txtFreq.Visible         = 1;
  txtFreq.Active          = 1;
  txtFreq.Transparent     = 1;
  txtFreq.Caption         = txtFreq_Caption;
  txtFreq.TextAlign       = _taCenter;
  txtFreq.FontName        = Arial47x97_Bold;
  txtFreq.PressColEnabled = 1;
  txtFreq.Font_Color      = 0xFFFF;
  txtFreq.Gradient        = 0;
  txtFreq.Gradient_Orientation = 0;
  txtFreq.Gradient_Start_Color = 0x3186;
  txtFreq.Gradient_End_Color = 0x3186;
  txtFreq.Color           = 0x3186;
  txtFreq.Press_Color     = 0x3186;
  txtFreq.OnUpPtr         = 0;
  txtFreq.OnDownPtr       = 0;
  txtFreq.OnClickPtr      = 0;
  txtFreq.OnPressPtr      = 0;

  Label1.OwnerScreen     = &Screen1;
  Label1.Order           = 10;
  Label1.Left            = 315;
  Label1.Top             = 144;
  Label1.Width           = 40;
  Label1.Height          = 24;
  Label1.Visible         = 1;
  Label1.Active          = 1;
  Label1.Caption         = Label1_Caption;
  Label1.FontName        = Arial19x22_Regular;
  Label1.Font_Color      = 0xFFFF;
  Label1.OnUpPtr         = 0;
  Label1.OnDownPtr       = 0;
  Label1.OnClickPtr      = 0;
  Label1.OnPressPtr      = 0;

  Label2.OwnerScreen     = &Screen1;
  Label2.Order           = 11;
  Label2.Left            = 100;
  Label2.Top             = 179;
  Label2.Width           = 202;
  Label2.Height          = 15;
  Label2.Visible         = 0;
  Label2.Active          = 1;
  Label2.Caption         = Label2_Caption;
  Label2.FontName        = Tahoma11x13_Regular;
  Label2.Font_Color      = 0x9492;
  Label2.OnUpPtr         = 0;
  Label2.OnDownPtr       = 0;
  Label2.OnClickPtr      = 0;
  Label2.OnPressPtr      = 0;

  Image3.OwnerScreen     = &Screen1;
  Image3.Order           = 12;
  Image3.Left            = 409;
  Image3.Top             = 0;
  Image3.Width           = 2;
  Image3.Height          = 272;
  Image3.Picture_Type    = 0;
  Image3.Picture_Ratio   = 1;
  Image3.Picture_Name    = roler_shadow_bmp;
  Image3.Visible         = 1;
  Image3.Active          = 1;
  Image3.OnUpPtr         = 0;
  Image3.OnDownPtr       = 0;
  Image3.OnClickPtr      = 0;
  Image3.OnPressPtr      = 0;

  Label3.OwnerScreen     = &Screen1;
  Label3.Order           = 13;
  Label3.Left            = 110;
  Label3.Top             = 40;
  Label3.Width           = 189;
  Label3.Height          = 32;
  Label3.Visible         = 1;
  Label3.Active          = 1;
  Label3.Caption         = Label3_Caption;
  Label3.FontName        = Tahoma24x29_Regular;
  Label3.Font_Color      = 0xA705;
  Label3.OnUpPtr         = 0;
  Label3.OnDownPtr       = 0;
  Label3.OnClickPtr      = 0;
  Label3.OnPressPtr      = 0;

  Image1.OwnerScreen     = &Screen1;
  Image1.Order           = 14;
  Image1.Left            = 7;
  Image1.Top             = 7;
  Image1.Width           = 21;
  Image1.Height          = 14;
  Image1.Picture_Type    = 0;
  Image1.Picture_Ratio   = 1;
  Image1.Picture_Name    = icon_stereo_BMP;
  Image1.Visible         = 1;
  Image1.Active          = 1;
  Image1.OnUpPtr         = 0;
  Image1.OnDownPtr       = 0;
  Image1.OnClickPtr      = 0;
  Image1.OnPressPtr      = 0;

  imgVol.OwnerScreen     = &Screen1;
  imgVol.Order           = 15;
  imgVol.Left            = 0;
  imgVol.Top             = 225;
  imgVol.Width           = 39;
  imgVol.Height          = 47;
  imgVol.Picture_Type    = 0;
  imgVol.Picture_Ratio   = 1;
  imgVol.Picture_Name    = btn_volume_01_bmp;
  imgVol.Visible         = 1;
  imgVol.Active          = 1;
  imgVol.OnUpPtr         = 0;
  imgVol.OnDownPtr       = imgVolOnDown;
  imgVol.OnClickPtr      = imgVolOnClick;
  imgVol.OnPressPtr      = 0;

  lblStereo.OwnerScreen     = &Screen1;
  lblStereo.Order           = 16;
  lblStereo.Left            = 33;
  lblStereo.Top             = 8;
  lblStereo.Width           = 33;
  lblStereo.Height          = 14;
  lblStereo.Visible         = 1;
  lblStereo.Active          = 1;
  lblStereo.Caption         = lblStereo_Caption;
  lblStereo.FontName        = Arial11x14_Regular;
  lblStereo.Font_Color      = 0xFFFF;
  lblStereo.OnUpPtr         = 0;
  lblStereo.OnDownPtr       = 0;
  lblStereo.OnClickPtr      = 0;
  lblStereo.OnPressPtr      = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
  if ( (Left<= X) && (Left+ Width - 1 >= X) &&
       (Top <= Y)  && (Top + Height - 1 >= Y) )
    return 1;
  else
    return 0;
}


#define GetButton(index)              CurrentScreen->Buttons[index]
#define GetLabel(index)               CurrentScreen->Labels[index]
#define GetImage(index)               CurrentScreen->Images[index]
#define GetBox(index)                 CurrentScreen->Boxes[index]


void DrawButton(TButton *Abutton) {
  if (Abutton->Visible == 1) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(Abutton->Transparent, Abutton->Press_Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_End_Color, Abutton->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(Abutton->Transparent, Abutton->Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_Start_Color, Abutton->Gradient_End_Color);
    }
    TFT_Set_Pen(Abutton->Pen_Color, Abutton->Pen_Width);
    TFT_Rectangle(Abutton->Left, Abutton->Top, Abutton->Left + Abutton->Width - 1, Abutton->Top + Abutton->Height - 1);
    TFT_Set_Font(Abutton->FontName, Abutton->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text_Return_Pos(Abutton->Caption, Abutton->Left, Abutton->Top);
    if (Abutton->TextAlign == _taLeft)
      TFT_Write_Text(Abutton->Caption, Abutton->Left + 4, (Abutton->Top + ((Abutton->Height - caption_height) / 2)));
    else if (Abutton->TextAlign == _taCenter)
      TFT_Write_Text(Abutton->Caption, (Abutton->Left + (Abutton->Width - caption_length) / 2), (Abutton->Top + ((Abutton->Height - caption_height) / 2)));
    else if (Abutton->TextAlign == _taRight)
      TFT_Write_Text(Abutton->Caption, Abutton->Left + (Abutton->Width - caption_length - 4), (Abutton->Top + (Abutton->Height - caption_height) / 2));
  }
}

void DrawLabel(TLabel *ALabel) {
  if (ALabel->Visible == 1) {
    TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
  }
}

void DrawImage(TImage *AImage) {
  if (AImage->Visible) {
    TFT_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
  }
}

void DrawBox(TBox *ABox) {
  if (ABox->Visible == 1) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
    }
    TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
    TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
  }
}

void DrawScreen(TScreen *aScreen) {
 unsigned int order;
  unsigned short button_idx;
  TButton *local_button;
  unsigned short label_idx;
  TLabel *local_label;
  unsigned short image_idx;
  TImage *local_image;
  unsigned short box_idx;
  TBox *local_box;
  char save_bled, save_bled_direction;

  object_pressed = 0;
  order = 0;
  button_idx = 0;
  label_idx = 0;
  image_idx = 0;
  box_idx = 0;
  CurrentScreen = aScreen;

  if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
    save_bled = TFT_BLED;
    TFT_BLED           = 0;
    TFT_Set_Active(&TFT_mikromedia_Set_Index, &TFT_mikromedia_Write_Command, &TFT_Write_to_16bitPort);
    TFT_Init_SSD1963(CurrentScreen->Width, CurrentScreen->Height);
    TFT_Set_DBC_SSD1963(255);
    STMPE610_SetSize(CurrentScreen->Width, CurrentScreen->Height);
    TFT_Fill_Screen(CurrentScreen->Color);
    display_width = CurrentScreen->Width;
    display_height = CurrentScreen->Height;
    TFT_BLED           = save_bled;
  }
  else
    TFT_Fill_Screen(CurrentScreen->Color);


  while (order < CurrentScreen->ObjectsCount) {
    if (button_idx < CurrentScreen->ButtonsCount) {
      local_button = GetButton(button_idx);
      if (order == local_button->Order) {
        button_idx++;
        order++;
        DrawButton(local_button);
      }
    }

    if (label_idx < CurrentScreen->LabelsCount) {
      local_label = GetLabel(label_idx);
      if (order == local_label->Order) {
        label_idx++;
        order++;
        DrawLabel(local_label);
      }
    }

    if (box_idx < CurrentScreen->BoxesCount) {
      local_box = GetBox(box_idx);
      if (order == local_box->Order) {
        box_idx++;
        order++;
        DrawBox(local_box);
      }
    }

    if (image_idx < CurrentScreen->ImagesCount) {
      local_image = GetImage(image_idx);
      if (order == local_image->Order) {
        image_idx++;
        order++;
        DrawImage(local_image);
      }
    }

  }
}

void Get_Object(unsigned int X, unsigned int Y) {
  button_order        = -1;
  label_order         = -1;
  image_order         = -1;
  box_order           = -1;
  //  Buttons
  for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
    local_button = GetButton(_object_count);
    if (local_button->Active == 1) {
      if (IsInsideObject(X, Y, local_button->Left, local_button->Top,
                         local_button->Width, local_button->Height) == 1) {
        button_order = local_button->Order;
        exec_button = local_button;
      }
    }
  }

  //  Labels
  for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
    local_label = GetLabel(_object_count);
    if (local_label->Active == 1) {
      if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
                         local_label->Width, local_label->Height) == 1) {
        label_order = local_label->Order;
        exec_label = local_label;
      }
    }
  }

  //  Images
  for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
    local_image = GetImage(_object_count);
    if (local_image->Active == 1) {
      if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
                         local_image->Width, local_image->Height) == 1) {
        image_order = local_image->Order;
        exec_image = local_image;
      }
    }
  }

  //  Boxes
  for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
    local_box = GetBox(_object_count);
    if (local_box->Active == 1) {
      if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
                         local_box->Width, local_box->Height) == 1) {
        box_order = local_box->Order;
        exec_box = local_box;
      }
    }
  }

  _object_count = -1;
  if (button_order >  _object_count )
    _object_count = button_order;
  if (label_order >  _object_count )
    _object_count = label_order;
  if (image_order >  _object_count )
    _object_count = image_order;
  if (box_order >  _object_count )
    _object_count = box_order;
}


static void Process_TP_Press(unsigned int X, unsigned int Y) {
  exec_button         = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_box            = 0;

  Get_Object(X, Y);

  if (_object_count != -1) {
    if (_object_count == button_order) {
      if (exec_button->Active == 1) {
        if (exec_button->OnPressPtr != 0) {
          exec_button->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == label_order) {
      if (exec_label->Active == 1) {
        if (exec_label->OnPressPtr != 0) {
          exec_label->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == image_order) {
      if (exec_image->Active == 1) {
        if (exec_image->OnPressPtr != 0) {
          exec_image->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == box_order) {
      if (exec_box->Active == 1) {
        if (exec_box->OnPressPtr != 0) {
          exec_box->OnPressPtr();
          return;
        }
      }
    }

  }
}

static void Process_TP_Up(unsigned int X, unsigned int Y) {

  switch (PressedObjectType) {
    // Button
    case 0: {
      if (PressedObject != 0) {
        exec_button = (TButton*)PressedObject;
        if ((exec_button->PressColEnabled == 1) && (exec_button->OwnerScreen == CurrentScreen)) {
          DrawButton(exec_button);
        }
        break;
      }
      break;
    }
    // Box
    case 6: {
      if (PressedObject != 0) {
        exec_box = (TBox*)PressedObject;
        if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
          DrawBox(exec_box);
        }
        break;
      }
      break;
    }
  }

  exec_label          = 0;
  exec_image          = 0;

  Get_Object(X, Y);


  if (_object_count != -1) {
  // Buttons
    if (_object_count == button_order) {
      if (exec_button->Active == 1) {
        if (exec_button->OnUpPtr != 0)
          exec_button->OnUpPtr();
        if (PressedObject == (void *)exec_button)
          if (exec_button->OnClickPtr != 0)
            exec_button->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Labels
    if (_object_count == label_order) {
      if (exec_label->Active == 1) {
        if (exec_label->OnUpPtr != 0)
          exec_label->OnUpPtr();
        if (PressedObject == (void *)exec_label)
          if (exec_label->OnClickPtr != 0)
            exec_label->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Images
    if (_object_count == image_order) {
      if (exec_image->Active == 1) {
        if (exec_image->OnUpPtr != 0)
          exec_image->OnUpPtr();
        if (PressedObject == (void *)exec_image)
          if (exec_image->OnClickPtr != 0)
            exec_image->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Boxes
    if (_object_count == box_order) {
      if (exec_box->Active == 1) {
        if (exec_box->OnUpPtr != 0)
          exec_box->OnUpPtr();
        if (PressedObject == (void *)exec_box)
          if (exec_box->OnClickPtr != 0)
            exec_box->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  }
  PressedObject = 0;
  PressedObjectType = -1;
}

static void Process_TP_Down(unsigned int X, unsigned int Y) {

  object_pressed      = 0;
  exec_button         = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_box            = 0;

  Get_Object(X, Y);

  if (_object_count != -1) {
    if (_object_count == button_order) {
      if (exec_button->Active == 1) {
        if (exec_button->PressColEnabled == 1) {
          object_pressed = 1;
          DrawButton(exec_button);
        }
        PressedObject = (void *)exec_button;
        PressedObjectType = 0;
        if (exec_button->OnDownPtr != 0) {
          exec_button->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == label_order) {
      if (exec_label->Active == 1) {
        PressedObject = (void *)exec_label;
        PressedObjectType = 2;
        if (exec_label->OnDownPtr != 0) {
          exec_label->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == image_order) {
      if (exec_image->Active == 1) {
        PressedObject = (void *)exec_image;
        PressedObjectType = 3;
        if (exec_image->OnDownPtr != 0) {
          exec_image->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == box_order) {
      if (exec_box->Active == 1) {
        if (exec_box->PressColEnabled == 1) {
          object_pressed = 1;
          DrawBox(exec_box);
        }
        PressedObject = (void *)exec_box;
        PressedObjectType = 6;
        if (exec_box->OnDownPtr != 0) {
          exec_box->OnDownPtr();
          return;
        }
      }
    }

  }
}

void Check_TP() {
  if (STMPE610_PressDetect()) {
    // After a PRESS is detected read X-Y and convert it to Display dimensions space
    if (STMPE610_GetLastCoordinates(&Xcoord, &Ycoord) == 0) {
      Process_TP_Press(Xcoord, Ycoord);
      if (PenDown == 0) {
        PenDown = 1;
        Process_TP_Down(Xcoord, Ycoord);
      }
    }
  }
  else if (PenDown == 1) {
    PenDown = 0;
    Process_TP_Up(Xcoord, Ycoord);
  }
}

void Init_MCU() {
  // Place your code here

  // If bus is busy wait SDA high before initializing I2C module
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
  GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
  GPIOB_ODR.B6 = 1;
  while (GPIOB_IDR.B7 == 0) {
    GPIOB_ODR.B6 = 0;
    Delay_us(10);
    GPIOB_ODR.B6 = 1;
    Delay_us(10);
  }
  I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);

  TFT_Set_Default_Mode();
  GPIO_Digital_Output(&GPIOG_BASE, 0x00FF);
  GPIO_Digital_Output(&GPIOE_BASE, 0xFF00);
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_4);
  GPIOB_ODR.B4 = 0;
  TFT_Set_Default_Mode();
  TFT_Set_MM_Plus();
  STMPE610_SetDefaultMode();
}

char STMPE610_Config() {
  STMPE610_SetI2CAddress(STMPE610_I2C_ADDR1);
  if(STMPE610_IsOperational()) {
    return STMPE610_IO_NOT_OPERATIONAL;
  }

  STMPE610_Reset();
  STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
  STMPE610_AlternateFunction(STMPE610_GPIO_PIN1, STMPE610_ENABLE);
  STMPE610_SetGPIOPin(STMPE610_GPIO_PIN1, 0);   // IN1 to "0" -> I2C communication
  STMPE610_SetSize(480,272);
  STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
  STMPE610_EnableInterrupt(STMPE610_IE_TOUCH_DET | STMPE610_IE_FIFO_TH | STMPE610_IE_FIFO_0FLOW, STMPE610_ENABLE);
  STMPE610_ConfigureInterrupt(STMPE610_INT_POLARITY_ACTIVE_HIGH | STMPE610_INT_TYPE_EDGE | STMPE610_INT_ENABLE_ALL);
  STMPE610_SetADC(STMPE610_ADC_CTRL1_SAMPLETIME_44 | STMPE610_ADC_CTRL1_ADC_12BIT | STMPE610_ADC_CTRL1_INT_REFERENCE);
  Delay_10ms(); Delay_10ms();
  STMPE610_SetADCClock(STMPE610_ADC_CTRL2_3250_kHZ);
  STMPE610_AlternateFunction(STMPE610_GPIO_PIN4 | STMPE610_GPIO_PIN5 | STMPE610_GPIO_PIN6 | STMPE610_GPIO_PIN7, STMPE610_DISABLE);
  STMPE610_ConfigureTSC(STMPE610_TSC_CFG_AVE_CTRL_4S, STMPE610_TSC_CFG_TOUCH_DET_DELAY_500uS, STMPE610_TSC_CFG_TOUCH_SETTLING_500uS);
  STMPE610_SetFIFOThreshold(1);
  STMPE610_ResetFIFO();
  STMPE610_TSIDrive(STMPE610_TSC_I_DRIVE_20mA);
  STMPE610_TSControl(STMPE610_TSC_CTRL_TRACK0 | STMPE610_TSC_CTRL_ACQU_XYZ | STMPE610_TSC_CTRL_ENABLE);
  STMPE610_ZDataFraction(STMPE610_FRACP4_WHOLP4);
  STMPE610_SetTouchPressureThreshold(45);
  STMPE610_ClearInterrupts();
  STMPE610_WriteReg(STMPE610_INT_CTRL_REG, 0x01);
  return STMPE610_OK;
}


void Start_TP() {
TTPConstants TPConstsStruct;
  Init_MCU();

  InitializeTouchPanel();
  if (STMPE610_Config() == STMPE610_OK) {
  } else {
    while(1);
  }


  // You can get calibration constants using touch panel calibration example
  TPConstsStruct.X_Min = 105;
  TPConstsStruct.X_Max = 3925;
  TPConstsStruct.Y_Min = 250;
  TPConstsStruct.Y_Max = 3820;
  TPConstsStruct.Rotate = 0;
  STMPE610_SetCalibrationConsts(&TPConstsStruct);

  InitializeObjects();
  display_width = Screen1.Width;
  display_height = Screen1.Height;
  DrawScreen(&Screen1);
}
