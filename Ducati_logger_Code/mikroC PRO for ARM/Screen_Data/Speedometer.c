#include "Ducati_logger_objects.h"
#include "Ducati_logger_resources.h"
#include "built_in.h"
//#include "TinyGPS.h"

void checkRTC();
void checkPowerM();

void Start_Speedometer() {
  
  DrawScreen(&Speedometer_graphics);
  checkRTC();
  checkPowerM();
    
}