typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;

typedef struct Screen TScreen;

typedef struct {
  unsigned int X_Min;
  unsigned int X_Max;
  unsigned int Y_Min;
  unsigned int Y_Max;
  char         Rotate;
} TTPConstants;

typedef struct  Button {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          *Caption;
  TTextAlign    TextAlign;
  const char    *FontName;
  unsigned int  Font_Color;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TButton;

typedef struct  Label {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          *Caption;
  const char    *FontName;
  unsigned int  Font_Color;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TLabel;

typedef struct  Image {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  const char    *Picture_Name;
  char          Visible;
  char          Active;
  char          Picture_Type;
  char          Picture_Ratio;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TImage;

typedef struct  Box {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TBox;

struct Screen {
  unsigned int           Color;
  unsigned int           Width;
  unsigned int           Height;
  unsigned int         ObjectsCount;
  unsigned int           ButtonsCount;
  TButton                * const code *Buttons;
  unsigned int           LabelsCount;
  TLabel                 * const code *Labels;
  unsigned int           ImagesCount;
  TImage                 * const code *Images;
  unsigned int           BoxesCount;
  TBox                   * const code *Boxes;
};

extern   TScreen                Screen1;
extern   TBox                   barVol;
extern   TBox                   Slider;
extern   TImage               Image4;
extern   TImage               imgFineDown;
extern   TImage               imgSeekDown;
extern   TImage               imgStop;
extern   TImage               imgFineUp;
extern   TImage               imgSeekUp;
extern   TImage               Image2;
extern   TButton               txtFreq;
extern   TLabel                 Label1;
extern   TLabel                 Label2;
extern   TImage               Image3;
extern   TLabel                 Label3;
extern   TImage               Image1;
extern   TImage               imgVol;
extern   TLabel                 lblStereo;
extern   TButton                * const code Screen1_Buttons[1];
extern   TLabel                 * const code Screen1_Labels[4];
extern   TImage                 * const code Screen1_Images[10];
extern   TBox                   * const code Screen1_Boxes[2];


/////////////////////////
// Events Code Declarations
void barVolOnPress();
void Image2OnClick();
void imgFineDownOnClick();
void imgFineDownOnDown();
void imgFineDownOnUp();
void imgFineUpOnClick();
void imgFineUpOnDown();
void imgFineUpOnUp();
void imgSeekDownOnClick();
void imgSeekDownOnDown();
void imgSeekDownOnUp();
void imgSeekUpOnClick();
void imgSeekUpOnDown();
void imgSeekUpOnUp();
void imgStopOnClick();
void imgStopOnDown();
void imgStopOnUp();
void imgVolOnClick();
void imgVolOnDown();
void SliderOnPress();
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
extern char barVol_Caption[];
extern char Slider_Caption[];
extern char Image4_Caption[];
extern char imgFineDown_Caption[];
extern char imgSeekDown_Caption[];
extern char imgStop_Caption[];
extern char imgFineUp_Caption[];
extern char imgSeekUp_Caption[];
extern char Image2_Caption[];
extern char txtFreq_Caption[];
extern char Label1_Caption[];
extern char Label2_Caption[];
extern char Image3_Caption[];
extern char Label3_Caption[];
extern char Image1_Caption[];
extern char imgVol_Caption[];
extern char lblStereo_Caption[];
/////////////////////////////////

void DrawScreen(TScreen *aScreen);
void DrawButton(TButton *aButton);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawBox(TBox *ABox);
void Check_TP();
void Start_TP();
