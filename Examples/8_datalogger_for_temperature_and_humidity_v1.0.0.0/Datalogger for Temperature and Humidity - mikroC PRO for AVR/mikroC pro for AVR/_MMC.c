sbit Mmc_Chip_Select at PORTF_OUT.B5;
sbit Mmc_Chip_Select_Direction at PORTF_DIR.B5;

const code far char sd_icon_bmp[1432];
char filename[13];


void MMC_Create_NewJK(char *date){
  unsigned int i;
  strcpy(filename, date);
                                                                                // use fat16
  if (Mmc_Fat_Init() == 0) {
     Mmc_Fat_Assign(filename, 0xA0);                                            // Find existing file or create a new one
     Mmc_Fat_Rewrite();                                                         // Clear file and start with new data
     Mmc_Fat_Write("Time ,Temperature ,Humidity \n", 29);                       // Write first line
     }
}

void MMC_WriteJK( char *datetime, char *temperature, char *humidity ){
    char txt[50];
    char tmptxt[6];
    char comma[3] = " ,";
    char crlf[3] = "\r\n";

     txt[0] = 0;
     strcat(txt, datetime);
     strcat(txt, comma);
     strcat(txt, temperature);
     strcat(txt, comma);

     strcat(txt, humidity);
     strcat(txt, crlf);

      if (Mmc_Fat_Init() == 0) {
        Mmc_Fat_Assign(filename,0xA0);                                          // Assign existing file
        Mmc_Fat_Append();                                                       // Add new data at the end of the file
        Mmc_Fat_Write(txt,strlen(txt));                                         // Write new data
        TFT_Image(280,10, sd_icon_bmp, 1);                                      // Draw SD cars image, as a result of successfull write
        }
      else
        TFT_Rectangle(285,15,300,35);                                           // Draw blank space if there were not writing on the SD card

}