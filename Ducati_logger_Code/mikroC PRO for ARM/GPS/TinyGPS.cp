#line 1 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/GPS/TinyGPS.c"
#line 1 "c:/users/jjmcdo1/documents/github/ducati_mikro/ducati_logger_code/mikroc pro for arm/gps/tinygps.h"
#line 1 "c:/users/jjmcdo1/documents/mikroelektronika/mikroc pro for arm/include/stdbool.h"



 typedef char _Bool;
#line 51 "c:/users/jjmcdo1/documents/github/ducati_mikro/ducati_logger_code/mikroc pro for arm/gps/tinygps.h"
static const float GPS_INVALID_F_ANGLE, GPS_INVALID_F_ALTITUDE, GPS_INVALID_F_SPEED;

typedef unsigned char byte;






typedef struct
{


unsigned long _time, _new_time;
unsigned long _date, _new_date;
long _latitude, _new_latitude;
long _longitude, _new_longitude;
long _altitude, _new_altitude;
unsigned long _speed, _new_speed;
unsigned long _course, _new_course;
unsigned long _hdop, _new_hdop;
unsigned short _numsats, _new_numsats;

unsigned long _last_time_fix, _new_time_fix;
unsigned long _last_position_fix, _new_position_fix;


byte _parity;
 _Bool  _is_checksum_term;
char _term[15];
byte _sentence_type;
byte _term_number;
byte _term_offset;
 _Bool  _gps_data_good;



unsigned long _encoded_characters;
unsigned short _good_sentences;
unsigned short _failed_checksum;
unsigned short _passed_checksum;


} TinyGPS;

void TinyGPS_init(TinyGPS* gps);

 _Bool  encode(TinyGPS* gps, char c);


long altitude(TinyGPS* gps);


unsigned long course(TinyGPS* gps);


unsigned long speed(TinyGPS* gps);


 void stats(TinyGPS* gps, unsigned long *chars, unsigned short *good_sentences, unsigned short *failed_cs);




int from_hex(char a);

unsigned long parse_decimal(TinyGPS* gps);

unsigned long parse_degrees(TinyGPS* gps);
 _Bool  term_complete(TinyGPS* gps);

 _Bool  gpsisdigit(char c);
long gpsatol(const char *str);
int gpsstrcmp(const char *str1, const char *str2);


void get_position(TinyGPS* gps, long *latitude, long *longitude, unsigned long *fix_age);



void get_datetime(TinyGPS* gps, unsigned long *date, unsigned long *time, unsigned long *age);



unsigned short satellites(TinyGPS* gps);


unsigned long hdop(TinyGPS* gps);

void f_get_position(TinyGPS* gps, float *latitude, float *longitude, unsigned long *fix_age);
void crack_datetime(TinyGPS* gps, int *year, byte *month, byte *day,
 byte *hour, byte *minute, byte *second, byte *hundredths, unsigned long *fix_age);
float f_altitude(TinyGPS* gps);
float f_course(TinyGPS* gps);
float f_speed_knots(TinyGPS* gps);
float f_speed_mph(TinyGPS* gps);
float f_speed_mps(TinyGPS* gps);
float f_speed_kmph(TinyGPS* gps);

static int library_version() { return  12 ; }

static float distance_between (float lat1, float long1, float lat2, float long2);
static float course_to (float lat1, float long1, float lat2, float long2);
static const char *cardinal(float course);


 void stats(TinyGPS* gps, unsigned long *chars, unsigned short *good_sentences, unsigned short *failed_cs);
#line 26 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/GPS/TinyGPS.c"
unsigned long PI = 3.14159265358979323846264338327950288419716939937510;
unsigned long millis()
{
 return 0;
}
 _Bool  gpsisdigit(char c)
 {
 return c >= '0' && c <= '9';
 }


unsigned short satellites(TinyGPS* gps)
 {
 return gps->_numsats;
 }


unsigned long hdop(TinyGPS* gps)
 {
 return gps->_hdop;
 }


long altitude(TinyGPS* gps)
 {
 return gps->_altitude;
 }


unsigned long course(TinyGPS* gps)
 {
 return gps->_course;
 }


unsigned long speed(TinyGPS* gps)
 {
 return gps->_speed;
 }

 void TinyGPS_init(TinyGPS* gps)
{

 gps->_time =  0xFFFFFFFF ;
 gps->_date =  0 ;
 gps->_latitude =  999999999 ;
 gps->_longitude =  999999999 ;
 gps->_altitude =  999999999 ;
 gps->_speed =  999999999 ;
 gps->_course =  999999999 ;



 gps->_last_time_fix =  0xFFFFFFFF ;
 gps->_last_position_fix =  0xFFFFFFFF ;


 gps->_parity = 0;
 gps->_is_checksum_term =  0 ;
 gps->_sentence_type =  3 ;
 gps->_term_number = 0;
 gps->_term_offset = 0;
 gps->_gps_data_good =  0 ;

 gps->_encoded_characters = 0;
 gps->_good_sentences = 0;
 gps->_failed_checksum = 0;


 gps->_term[0] = '\0';
}





 _Bool  encode(TinyGPS* gps, char c)
{
  _Bool  valid_sentence =  0 ;

 ++gps->_encoded_characters;
 switch(c)
 {
 case ',':
 gps->_parity ^= c;
 case '\r':
 case '\n':
 case '*':
 if (gps->_term_offset < sizeof(gps->_term))
 {
 gps->_term[gps->_term_offset] = 0;
 valid_sentence = term_complete(gps);
 }
 ++gps->_term_number;
 gps->_term_offset = 0;
 gps->_is_checksum_term = c == '*';
 return valid_sentence;

 case '$':
 gps->_term_number = gps->_term_offset = 0;
 gps->_parity = 0;
 gps->_sentence_type =  3 ;
 gps->_is_checksum_term =  0 ;
 gps->_gps_data_good =  0 ;
 return valid_sentence;
 }


 if (gps->_term_offset < sizeof(gps->_term) - 1)
 gps->_term[gps->_term_offset++] = c;
 if (!gps->_is_checksum_term)
 gps->_parity ^= c;

 return valid_sentence;
}




void stats(TinyGPS* gps, unsigned long *chars, unsigned short *sentences, unsigned short *failed_cs)
{
 if (chars) *chars = gps->_encoded_characters;
 if (sentences) *sentences = gps->_good_sentences;
 if (failed_cs) *failed_cs = gps->_failed_checksum;
}





int from_hex(char a)
{
 if (a >= 'A' && a <= 'F')
 return a - 'A' + 10;
 else if (a >= 'a' && a <= 'f')
 return a - 'a' + 10;
 else
 return a - '0';
}

unsigned long parse_decimal(TinyGPS* gps)
{
 unsigned long ret;
 char *p = gps->_term;
  _Bool  isneg = *p == '-';
 if (isneg)
 {
 ++p;
 }
 ret = 100UL * gpsatol(p);
 while (gpsisdigit(*p)) ++p;
 if (*p == '.')
 {
 if (gpsisdigit(p[1]))
 {
 ret += 10 * (p[1] - '0');
 if (gpsisdigit(p[2]))
 ret += p[2] - '0';
 }
 }
 return isneg ? -ret : ret;
}

unsigned long parse_degrees(TinyGPS* gps)
{
 char *p;
 unsigned long left = gpsatol(gps->_term);
 unsigned long tenk_minutes = (left % 100UL) * 10000UL;
 for (p=gps->_term; gpsisdigit(*p); ++p);
 if (*p == '.')
 {
 unsigned long mult = 1000;
 while (gpsisdigit(*++p))
 {
 tenk_minutes += mult * (*p - '0');
 mult /= 10;
 }
 }
 return (left / 100) * 100000 + tenk_minutes / 6;
}





 _Bool  term_complete(TinyGPS* gps)
{
 if (gps->_is_checksum_term)
 {
 byte checksum = 16 * from_hex(gps->_term[0]) + from_hex(gps->_term[1]);
 if (checksum == gps->_parity)
 {
 if (gps->_gps_data_good)
 {

 ++gps->_good_sentences;

 gps->_last_time_fix = gps->_new_time_fix;
 gps->_last_position_fix = gps->_new_position_fix;

 switch(gps->_sentence_type)
 {
 case  2 :
 gps->_time = gps->_new_time;
 gps->_date = gps->_new_date;
 gps->_latitude = gps->_new_latitude;
 gps->_longitude = gps->_new_longitude;
 gps->_speed = gps->_new_speed;
 gps->_course = gps->_new_course;
 break;
 case  1 :
 gps->_altitude = gps->_new_altitude;
 gps->_time = gps->_new_time;
 gps->_latitude = gps->_new_latitude;
 gps->_longitude = gps->_new_longitude;
 gps->_numsats = gps->_new_numsats;
 gps->_hdop = gps->_new_hdop;
 break;
 }

 return  1 ;
 }
 }


 else
 ++gps->_failed_checksum;

 return  0 ;
 }


 if (gps->_term_number == 0)
 {
 if (!gpsstrcmp(gps->_term,  "GPRMC" ))
 gps->_sentence_type =  2 ;
 else if (!gpsstrcmp(gps->_term,  "GPGGA" ))
 gps->_sentence_type =  1 ;
 else
 gps->_sentence_type =  3 ;
 return  0 ;
 }

if (gps->_sentence_type !=  3  && gps->_term[0])
 switch( (((unsigned)(gps->_sentence_type) << 5) | gps->_term_number) )
 {
 case  (((unsigned)( 2 ) << 5) | 1) :

 case  (((unsigned)( 1 ) << 5) | 1) :
 gps->_new_time = parse_decimal(gps);
 gps->_new_time_fix = millis();
 break;
 case  (((unsigned)( 2 ) << 5) | 2) :
 gps->_gps_data_good = gps->_term[0] == 'A';
 break;
 case  (((unsigned)( 2 ) << 5) | 3) :

 case  (((unsigned)( 1 ) << 5) | 2) :
 gps->_new_latitude = parse_degrees(gps);
 gps->_new_position_fix = millis();
 break;
 case  (((unsigned)( 2 ) << 5) | 4) :

 case  (((unsigned)( 1 ) << 5) | 3) :
 if (gps->_term[0] == 'S')
 gps->_new_latitude = -(gps->_new_latitude);
 break;
 case  (((unsigned)( 2 ) << 5) | 5) :

 case  (((unsigned)( 1 ) << 5) | 4) :
 gps->_new_longitude = parse_degrees(gps);
 break;
 case  (((unsigned)( 2 ) << 5) | 6) :

 case  (((unsigned)( 1 ) << 5) | 5) :
 if (gps->_term[0] == 'W')
 gps->_new_longitude = -gps->_new_longitude;
 break;
 case  (((unsigned)( 2 ) << 5) | 7) :
 gps->_new_speed = parse_decimal(gps);
 break;
 case  (((unsigned)( 2 ) << 5) | 8) :
 gps->_new_course = parse_decimal(gps);
 break;
 case  (((unsigned)( 2 ) << 5) | 9) :
 gps->_new_date = gpsatol(gps->_term);
 break;
 case  (((unsigned)( 1 ) << 5) | 6) :
 gps->_gps_data_good = gps->_term[0] > '0';
 break;
 case  (((unsigned)( 1 ) << 5) | 7) :
 gps->_new_numsats = (unsigned char)atoi(gps->_term);
 break;
 case  (((unsigned)( 1 ) << 5) | 8) :
 gps->_new_hdop = parse_decimal(gps);
 break;
 case  (((unsigned)( 1 ) << 5) | 9) :
 gps->_new_altitude = parse_decimal(gps);
 break;
 }
 return  0 ;
}

long gpsatol(const char *str)
{
 long ret = 0;
 while (gpsisdigit(*str))
 ret = 10 * ret + *str++ - '0';
 return ret;
}

int gpsstrcmp(const char *str1, const char *str2)
{
 while (*str1 && *str1 == *str2)
 ++str1, ++str2;
 return *str1;
}




static float distance_between (float lat1, float long1, float lat2, float long2)
 {





 float delta = (PI/180)*(long1-long2);
 float sdlong = sin(delta);
 float cdlong = cos(delta);
 float slat1 = sin(lat1);
 float clat1 = cos(lat1);
 float slat2 = sin(lat2);
 float clat2 = cos(lat2);
 float denom = (slat1 * slat2) + (clat1 * clat2 * cdlong);
 lat1 = (PI/180)*(lat1);
 lat2 = (PI/180)*(lat2);
 delta = (clat1 * slat2) - (slat1 * clat2 * cdlong);
 delta = (delta * delta );
 delta += (clat2 * sdlong) * (clat2 * sdlong);
 delta = sqrt(delta);
 delta = atan2(delta, denom);
 return delta * 6372795;
 }

static float course_to (float lat1, float long1, float lat2, float long2)
 {




 float dlon = (PI/180)*(long2-long1);
 float a1 = sin(dlon) * cos(lat2);
 float a2 = sin(lat1) * cos(lat2) * cos(dlon);
 float degrees = (180/PI)*(a2);
 lat1 = (PI/180)*(lat1);
 lat2 = (PI/180)*(lat2);
 a2 = cos(lat1) * sin(lat2) - a2;
 a2 = atan2(a1, a2);
 if (a2 < 0.0)
 {
 a2 += (2*PI);
 }

 return degrees;
 }

static const char *cardinal (float course)
 {
 static const char* directions[] = {"N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"};
 int direction = (int)((course + 11.25f) / 22.5f);
 return directions[direction % 16];
 }


void get_position(TinyGPS* gps, long *latitude, long *longitude, unsigned long *fix_age)
{
 if (latitude) *latitude = gps->_latitude;
 if (longitude) *longitude = gps->_longitude;
 if (fix_age) *fix_age = gps->_last_position_fix ==  0xFFFFFFFF  ?
  0xFFFFFFFF  : millis() - gps->_last_position_fix;
}


void get_datetime(TinyGPS* gps, unsigned long *date, unsigned long *time, unsigned long *fix_age)
{
 if (date) *date = gps->_date;
 if (time) *time = gps->_time;
 if (fix_age) *fix_age = gps->_last_time_fix ==  0xFFFFFFFF  ?
  0xFFFFFFFF  : millis() - gps->_last_time_fix;
}

void f_get_position(TinyGPS* gps, float *latitude, float *longitude, unsigned long *fix_age)
{
 long lat, lon;
 get_position(gps, &lat, &lon, fix_age);
 *latitude = lat ==  999999999  ? GPS_INVALID_F_ANGLE : (lat / 100000.0);
 *longitude = lat ==  999999999  ? GPS_INVALID_F_ANGLE : (lon / 100000.0);
}

void crack_datetime(TinyGPS* gps, int *year, byte *month, byte *day,
 byte *hour, byte *minute, byte *second, byte *hundredths, unsigned long *fix_age)
{
 unsigned long date, time;
 get_datetime(gps, &date, &time, fix_age);
 if (year)
 {
 *year = date % 100;
 *year += *year > 80 ? 1900 : 2000;
 }
 if (month) *month = (date / 100) % 100;
 if (day) *day = date / 10000;
 if (hour) *hour = time / 1000000;
 if (minute) *minute = (time / 10000) % 100;
 if (second) *second = (time / 100) % 100;
 if (hundredths) *hundredths = time % 100;
}

float f_altitude(TinyGPS* gps)
 {
 return gps->_altitude ==  999999999  ? GPS_INVALID_F_ALTITUDE : gps->_altitude / 100.0;
 }

float f_course(TinyGPS* gps)
 {
 return gps->_course ==  999999999  ? GPS_INVALID_F_ANGLE : gps->_course / 100.0;
 }

float f_speed_knots(TinyGPS* gps)
 {
 return gps->_speed ==  999999999  ? GPS_INVALID_F_SPEED : gps->_speed / 100.0;
 }

float f_speed_mph(TinyGPS* gps)
 {
 float sk = f_speed_knots(gps);
 return sk == GPS_INVALID_F_SPEED ? GPS_INVALID_F_SPEED :  1.15077945  * f_speed_knots(gps);
 }

float f_speed_mps(TinyGPS* gps)
 {
 float sk = f_speed_knots(gps);
 return sk == GPS_INVALID_F_SPEED ? GPS_INVALID_F_SPEED :  0.51444444  * f_speed_knots(gps);
 }

float f_speed_kmph(TinyGPS* gps)
 {
 float sk = f_speed_knots(gps);
 return sk == GPS_INVALID_F_SPEED ? GPS_INVALID_F_SPEED :  1.852  * f_speed_knots(gps);
 }

const float GPS_INVALID_F_ANGLE = 1000.0;
const float GPS_INVALID_F_ALTITUDE = 1000000.0;
const float GPS_INVALID_F_SPEED = -1.0;
