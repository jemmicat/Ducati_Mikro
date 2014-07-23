/*
  TinyGPS - a small GPS library for Arduino providing basic NMEA parsing
  Copyright (C) 2008-9 Mikal Hart
  All rights reserved.

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

#include "TinyGPS.h"
//#include <math.h>
#define _GPRMC_TERM   "GPRMC"
#define _GPGGA_TERM   "GPGGA"

unsigned long PI = 3.14159265358979323846264338327950288419716939937510;
unsigned long millis()
{
        return 0;
}
bool gpsisdigit(char c)
        {
                return c >= '0' && c <= '9';
        }

        // satellites used in last full GPGGA sentence
unsigned short satellites(TinyGPS* gps) 
        { 
                return gps->_numsats; 
        }

// horizontal dilution of precision in 100ths
unsigned long hdop(TinyGPS* gps)
 { 
        return gps->_hdop; 
        }

        // signed altitude in centimeters (from GPGGA sentence)
long altitude(TinyGPS* gps) 
        { 
                return gps->_altitude; 
        }

// course in last full GPRMC sentence in 100th of a degree
unsigned long course(TinyGPS* gps)
        { 
                return gps->_course; 
        }
    
// speed in last full GPRMC sentence in 100ths of a knot
unsigned long speed(TinyGPS* gps) 
        { 
                return gps->_speed; 
        }
        
        void TinyGPS_init(TinyGPS* gps)
{

        gps->_time = GPS_INVALID_TIME;
        gps->_date = GPS_INVALID_DATE;
        gps->_latitude = GPS_INVALID_ANGLE;
        gps->_longitude = GPS_INVALID_ANGLE;
        gps->_altitude = GPS_INVALID_ALTITUDE;
        gps->_speed = GPS_INVALID_SPEED;
        gps->_course = GPS_INVALID_ANGLE;
         //gps->_hdop = GPS_INVALID_HDOP;
         //gps->_numsats = GPS_INVALID_SATELLITES;
        
        gps->_last_time_fix = GPS_INVALID_FIX_TIME;
        gps->_last_position_fix = GPS_INVALID_FIX_TIME;

        
        gps->_parity = 0;
        gps->_is_checksum_term = false;
        gps->_sentence_type = _GPS_SENTENCE_OTHER;
        gps->_term_number = 0;
        gps->_term_offset = 0;
        gps->_gps_data_good = false;
#ifndef _GPS_NO_STATS
        gps->_encoded_characters = 0;
        gps->_good_sentences = 0;
        gps->_failed_checksum = 0;
#endif

        gps->_term[0] = '\0';
}

//
// public methods
//

bool encode(TinyGPS* gps, char c)
{
  bool valid_sentence = false;

  ++gps->_encoded_characters;
  switch(c)
  {
  case ',': // term terminators
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

  case '$': // sentence begin
    gps->_term_number = gps->_term_offset = 0;
    gps->_parity = 0;
    gps->_sentence_type = _GPS_SENTENCE_OTHER;
    gps->_is_checksum_term = false;
    gps->_gps_data_good = false;
    return valid_sentence;
  }

  // ordinary characters
  if (gps->_term_offset < sizeof(gps->_term) - 1)
    gps->_term[gps->_term_offset++] = c;
  if (!gps->_is_checksum_term)
    gps->_parity ^= c;

  return valid_sentence;
}



#ifndef _GPS_NO_STATS
void stats(TinyGPS* gps, unsigned long *chars, unsigned short *sentences, unsigned short *failed_cs)
{
  if (chars) *chars = gps->_encoded_characters;
  if (sentences) *sentences = gps->_good_sentences;
  if (failed_cs) *failed_cs = gps->_failed_checksum;
}
#endif

//
// internal utilities
//
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
  bool isneg = *p == '-';
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

#define COMBINE(sentence_type, term_number) (((unsigned)(sentence_type) << 5) | term_number)

// Processes a just-completed term
// Returns true if new sentence has just passed checksum test and is validated
bool term_complete(TinyGPS* gps)
{
  if (gps->_is_checksum_term)
  {
    byte checksum = 16 * from_hex(gps->_term[0]) + from_hex(gps->_term[1]);
    if (checksum == gps->_parity)
    {
      if (gps->_gps_data_good)
      {
#ifndef _GPS_NO_STATS
        ++gps->_good_sentences;
#endif
        gps->_last_time_fix = gps->_new_time_fix;
        gps->_last_position_fix = gps->_new_position_fix;

        switch(gps->_sentence_type)
        {
        case _GPS_SENTENCE_GPRMC:
          gps->_time      = gps->_new_time;
          gps->_date      = gps->_new_date;
          gps->_latitude  = gps->_new_latitude;
          gps->_longitude = gps->_new_longitude;
          gps->_speed     = gps->_new_speed;
          gps->_course    = gps->_new_course;
          break;
        case _GPS_SENTENCE_GPGGA:
          gps->_altitude  = gps->_new_altitude;
          gps->_time      = gps->_new_time;
          gps->_latitude  = gps->_new_latitude;
          gps->_longitude = gps->_new_longitude;
                                        gps->_numsats   = gps->_new_numsats;
          gps->_hdop      = gps->_new_hdop;
          break;
        }

        return true;
      }
    }

#ifndef _GPS_NO_STATS
    else
      ++gps->_failed_checksum;
#endif
    return false;
  }

  // the first term determines the sentence type
  if (gps->_term_number == 0)
  {
    if (!gpsstrcmp(gps->_term, _GPRMC_TERM))
      gps->_sentence_type = _GPS_SENTENCE_GPRMC;
    else if (!gpsstrcmp(gps->_term, _GPGGA_TERM))
      gps->_sentence_type = _GPS_SENTENCE_GPGGA;
    else
      gps->_sentence_type = _GPS_SENTENCE_OTHER;
    return false;
  }

if (gps->_sentence_type != _GPS_SENTENCE_OTHER && gps->_term[0])
    switch(COMBINE(gps->_sentence_type, gps->_term_number))
   {
     case COMBINE(_GPS_SENTENCE_GPRMC, 1): // Time in both sentences

     case COMBINE(_GPS_SENTENCE_GPGGA, 1):
       gps->_new_time = parse_decimal(gps);
       gps->_new_time_fix = millis();
       break;
     case COMBINE(_GPS_SENTENCE_GPRMC, 2): // GPRMC validity
       gps->_gps_data_good = gps->_term[0] == 'A';
       break;
     case COMBINE(_GPS_SENTENCE_GPRMC, 3): // Latitude

     case COMBINE(_GPS_SENTENCE_GPGGA, 2):
       gps->_new_latitude = parse_degrees(gps);
       gps->_new_position_fix = millis();
       break;
     case COMBINE(_GPS_SENTENCE_GPRMC, 4): // N/S

     case COMBINE(_GPS_SENTENCE_GPGGA, 3):
       if (gps->_term[0] == 'S')
         gps->_new_latitude = -(gps->_new_latitude);
       break;
     case COMBINE(_GPS_SENTENCE_GPRMC, 5): // Longitude

     case COMBINE(_GPS_SENTENCE_GPGGA, 4):
       gps->_new_longitude = parse_degrees(gps);
       break;
     case COMBINE(_GPS_SENTENCE_GPRMC, 6): // E/W

     case COMBINE(_GPS_SENTENCE_GPGGA, 5):
       if (gps->_term[0] == 'W')
       gps->_new_longitude = -gps->_new_longitude;
       break;
     case COMBINE(_GPS_SENTENCE_GPRMC, 7): // Speed (GPRMC)
       gps->_new_speed = parse_decimal(gps);
       break;
     case COMBINE(_GPS_SENTENCE_GPRMC, 8): // Course (GPRMC)
       gps->_new_course = parse_decimal(gps);
       break;
     case COMBINE(_GPS_SENTENCE_GPRMC, 9): // Date (GPRMC)
       gps->_new_date = gpsatol(gps->_term);
       break;
     case COMBINE(_GPS_SENTENCE_GPGGA, 6): // Fix data (GPGGA)
       gps->_gps_data_good = gps->_term[0] > '0';
       break;
     case COMBINE(_GPS_SENTENCE_GPGGA, 7): // Satellites used (GPGGA)
       gps->_new_numsats = (unsigned char)atoi(gps->_term);
       break;
     case COMBINE(_GPS_SENTENCE_GPGGA, 8): // HDOP
       gps->_new_hdop = parse_decimal(gps);
       break;
     case COMBINE(_GPS_SENTENCE_GPGGA, 9): // Altitude (GPGGA)
       gps->_new_altitude = parse_decimal(gps);
       break;
   }
 return false;
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



// /* static */
static float distance_between (float lat1, float long1, float lat2, float long2) 
 {
   // returns distance in meters between two positions, both specified 
   // as signed decimal-degrees latitude and longitude. Uses great-circle 
   // distance computation for hypothetical sphere of radius 6372795 meters.
   // Because Earth is no exact sphere, rounding errors may be up to 0.5%.
   // Courtesy of Maarten Lamers
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
   // returns course in degrees (North=0, West=270) from position 1 to position 2,
   // both specified as signed decimal-degrees latitude and longitude.
   // Because Earth is no exact sphere, calculated course may be off by a tiny fraction.
   // Courtesy of Maarten Lamers
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

// lat/long in hundred thousandths of a degree and age of fix in milliseconds
void get_position(TinyGPS* gps, long *latitude, long *longitude, unsigned long *fix_age)
{
   if (latitude) *latitude = gps->_latitude;
   if (longitude) *longitude = gps->_longitude;
   if (fix_age) *fix_age = gps->_last_position_fix == GPS_INVALID_FIX_TIME ? 
         GPS_INVALID_AGE : millis() - gps->_last_position_fix;
}

// date as ddmmyy, time as hhmmsscc, and age in milliseconds
void get_datetime(TinyGPS* gps, unsigned long *date, unsigned long *time, unsigned long *fix_age)
{
  if (date) *date = gps->_date;
  if (time) *time = gps->_time;
  if (fix_age) *fix_age = gps->_last_time_fix == GPS_INVALID_FIX_TIME ? 
    GPS_INVALID_AGE : millis() - gps->_last_time_fix;
}

void f_get_position(TinyGPS* gps, float *latitude, float *longitude, unsigned long *fix_age)
{
  long lat, lon;
  get_position(gps, &lat, &lon, fix_age);
  *latitude = lat == GPS_INVALID_ANGLE ? GPS_INVALID_F_ANGLE : (lat / 100000.0);
  *longitude = lat == GPS_INVALID_ANGLE ? GPS_INVALID_F_ANGLE : (lon / 100000.0);
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
   return gps->_altitude == GPS_INVALID_ALTITUDE ? GPS_INVALID_F_ALTITUDE : gps->_altitude / 100.0;
 }

float f_course(TinyGPS* gps)
 {
   return gps->_course == GPS_INVALID_ANGLE ? GPS_INVALID_F_ANGLE : gps->_course / 100.0;
 }

float f_speed_knots(TinyGPS* gps) 
 {
   return gps->_speed == GPS_INVALID_SPEED ? GPS_INVALID_F_SPEED : gps->_speed / 100.0;
 }

float f_speed_mph(TinyGPS* gps)   
 { 
   float sk = f_speed_knots(gps);
   return sk == GPS_INVALID_F_SPEED ? GPS_INVALID_F_SPEED : _GPS_MPH_PER_KNOT * f_speed_knots(gps); 
 }

float f_speed_mps(TinyGPS* gps)   
 { 
   float sk = f_speed_knots(gps);
   return sk == GPS_INVALID_F_SPEED ? GPS_INVALID_F_SPEED : _GPS_MPS_PER_KNOT * f_speed_knots(gps); 
 }

float f_speed_kmph(TinyGPS* gps)  
 { 
   float sk = f_speed_knots(gps);
   return sk == GPS_INVALID_F_SPEED ? GPS_INVALID_F_SPEED : _GPS_KMPH_PER_KNOT * f_speed_knots(gps); 
 }

const float GPS_INVALID_F_ANGLE = 1000.0;
const float GPS_INVALID_F_ALTITUDE = 1000000.0;
const float GPS_INVALID_F_SPEED = -1.0;