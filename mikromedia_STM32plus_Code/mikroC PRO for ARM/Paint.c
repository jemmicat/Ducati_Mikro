/*******************************************************************************
* Paint  - Function Set fo Paint Example
* ------------------------------------------------------------------------------
*
*******************************************************************************/

#include "mikromedia_STM32plus_objects.h"
#include "mikromedia_STM32plus_resources.h"

const unsigned int CL_SELECTED = CL_WHITE;

/*******************************************************************************
* Array of desired colors
*******************************************************************************/
TBox *ColorArray[30] = {
  &Color01, &Color02, &Color03, &Color04, &Color05, &Color06, &Color07, &Color08, &Color09, &Color10,
  &Color11, &Color12, &Color13, &Color14, &Color15, &Color16, &Color17, &Color18, &Color19, &Color20,
  &Color21, &Color22, &Color23, &Color24, &Color25, &Color26, &Color27, &Color28, &Color29, &Color30
};

typedef struct t_drawingTool{
  unsigned int pen_size;
  unsigned short EraserSelected;
  TBox *CurrentPen;
  TBox *PreviousPen;

  TBox *CurrentColor;
  TBox *PreviousColor;
};

struct t_drawingTool drawingTool;

/*******************************************************************************
* Function UpdatePenSelection()
* ------------------------------------------------------------------------------
* Overview: Function Updates New Selected Pen
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void UpdatePenSelection(){
  drawingTool.CurrentPen->Pen_Color = CL_SELECTED;
  if (drawingTool.PreviousPen > 0)
    drawingTool.PreviousPen->Pen_Color = drawingTool.PreviousPen->Color;
  DrawBox(&Pen1);
  DrawBox(&Pen2);
  DrawBox(&Pen3);
  TFT_Set_Pen(drawingTool.CurrentColor->Color, 0);
  TFT_Set_Brush(1, drawingTool.CurrentColor->Color, 0, 0, 0, 0);
}

/*******************************************************************************
* Function UpdatePenColor()
* ------------------------------------------------------------------------------
* Overview: Function Updates New Selected Color
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void UpdatePenColor(){
  drawingTool.CurrentColor->Pen_Color = CL_SELECTED;
  DrawBox(drawingTool.CurrentColor);

  if (drawingTool.PreviousColor > 0){
    drawingTool.PreviousColor->Pen_Color = drawingTool.PreviousColor->Color;
    DrawBox(drawingTool.PreviousColor);
  }

  if (drawingTool.EraserSelected){
    Pen1.Color = DrawingArea.Color;
    Pen2.Color = DrawingArea.Color;
    Pen3.Color = DrawingArea.Color;
  }
  else{
    Pen1.Color = drawingTool.CurrentColor->Color;
    Pen1.Pen_Color = drawingTool.CurrentColor->Color;

    Pen2.Color = drawingTool.CurrentColor->Color;
    Pen2.Pen_Color = drawingTool.CurrentColor->Color;

    Pen3.Color = drawingTool.CurrentColor->Color;
    Pen3.Pen_Color = drawingTool.CurrentColor->Color;
  }
  UpdatePenSelection();
}

/*******************************************************************************
* Function SetDefaults()
* ------------------------------------------------------------------------------
* Overview: Function Sets default values for selected objects
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void SetDefaults(){
  char color_cnt;
  
  for (color_cnt = 0; color_cnt < 30; color_cnt++)
    ColorArray[color_cnt]->Pen_Color = ColorArray[color_cnt]->Color;

  drawingTool.pen_size = 2;
  drawingTool.PreviousPen = 0;
  drawingTool.CurrentPen  = &Pen1;
  drawingTool.PreviousColor = 0;
  drawingTool.CurrentColor = &Color01;
  drawingTool.EraserSelected = 0;
  Eraser.Picture_Name = icon_eraser_bmp;
  DrawImage(&Eraser);
  Pen.Picture_Name = icon_brush_selected_bmp;
  DrawImage(&Pen);
  UpdatePenColor();
}

/*******************************************************************************
* Function SelectColor()
* ------------------------------------------------------------------------------
* Overview: Function Selects New Color (Should be called on click/press)
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void SelectColor(TBox *ColorBox){
  if (drawingTool.CurrentColor != ColorBox){
    drawingTool.PreviousColor->Pen_Color = drawingTool.PreviousColor->Color;
    DrawBox(drawingTool.PreviousColor);

    drawingTool.PreviousColor = drawingTool.CurrentColor;
    drawingTool.CurrentColor = ColorBox;
    UpdatePenColor();
  }
}