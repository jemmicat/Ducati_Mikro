
typedef struct {
  int x;
  int y;
  int z;
} tAxisB;

typedef struct {
  int x;
  int y;
  int z;
} tAxis;

typedef struct {
  float x;
  float y;
  float z;
} tAxisF;



typedef struct {
   tAxis accel;
   tAxis gyro;
   tAxis mag;
   tAxisF calib_accel;
   tAxisF calib_gyro;
   tAxisF calib_mag;
   tAxisF out_accel;
   tAxisF out_gyro;
   tAxisF out_mag;
   tAxisF mag_scale;
   tAxis mag_off;
   float temp;
   float gdt;            //gyro sample time (sec)
} tSensor;