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

typedef struct  Button_Round {
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
  char          Corner_Radius;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TButton_Round;

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

typedef const struct  CLabel {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  const char          *Caption;
  const char    *FontName;
  unsigned int  Font_Color;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TCLabel;

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

struct Screen {
  unsigned int           Color;
  unsigned int           Width;
  unsigned int           Height;
  unsigned int         ObjectsCount;
  unsigned int           ButtonsCount;
  TButton                * const code *Buttons;
  unsigned int           Buttons_RoundCount;
  TButton_Round          * const code *Buttons_Round;
  unsigned int           LabelsCount;
  TLabel                 * const code *Labels;
  unsigned int           CLabelsCount;
  TCLabel                * const code *CLabels;
  unsigned int           ImagesCount;
  TImage                 * const code *Images;
};

extern   TScreen                Screen1;
extern   TImage               Image1;
extern   TButton_Round          ButtonRound1;
extern   TButton_Round          ButtonRound2;
extern   TButton_Round          ButtonRound3;
extern   TButton_Round          ButtonRound4;
extern   TButton_Round          ButtonRound5;
extern   TButton_Round          ButtonRound6;
extern   TButton_Round          ButtonRound7;
extern   TButton_Round          ButtonRound8;
extern   TButton               ButtonAllOn;
extern   TButton               ButtonAllOff;
extern   TButton_Round          ButtonRound25;
extern   TButton_Round          ButtonRound26;
extern   TButton_Round          ButtonRound27;
extern   TButton_Round          ButtonRound28;
extern   TButton_Round          ButtonRound29;
extern   TButton_Round          ButtonRound30;
extern   TLabel                 Label1;
extern   TCLabel          Label2;
extern   TButton                * const code Screen1_Buttons[2];
extern   TButton_Round          * const code Screen1_Buttons_Round[14];
extern   TLabel                 * const code Screen1_Labels[1];
extern   TCLabel                * const code Screen1_CLabels[1];
extern   TImage                 * const code Screen1_Images[1];


/////////////////////////
// Events Code Declarations
void ButtonAllOffOnClick();
void ButtonAllOnOnClick();
void ButtonRound1OnClick();
void ButtonRound25OnClick();
void ButtonRound26OnClick();
void ButtonRound27OnClick();
void ButtonRound28OnClick();
void ButtonRound29OnClick();
void ButtonRound2OnClick();
void ButtonRound30OnClick();
void ButtonRound3OnClick();
void ButtonRound4OnClick();
void ButtonRound5OnClick();
void ButtonRound6OnClick();
void ButtonRound7OnClick();
void ButtonRound8OnClick();
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
extern char Image1_Caption[];
extern char ButtonRound1_Caption[];
extern char ButtonRound2_Caption[];
extern char ButtonRound3_Caption[];
extern char ButtonRound4_Caption[];
extern char ButtonRound5_Caption[];
extern char ButtonRound6_Caption[];
extern char ButtonRound7_Caption[];
extern char ButtonRound8_Caption[];
extern char ButtonAllOn_Caption[];
extern char ButtonAllOff_Caption[];
extern char ButtonRound25_Caption[];
extern char ButtonRound26_Caption[];
extern char ButtonRound27_Caption[];
extern char ButtonRound28_Caption[];
extern char ButtonRound29_Caption[];
extern char ButtonRound30_Caption[];
extern char Label1_Caption[];
extern const char Label2_Caption[];
/////////////////////////////////

void DrawScreen(TScreen *aScreen);
void DrawButton(TButton *aButton);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawCLabel(TCLabel *AClabel);
void DrawImage(TImage *AImage);
void Check_TP();
void Start_TP();
