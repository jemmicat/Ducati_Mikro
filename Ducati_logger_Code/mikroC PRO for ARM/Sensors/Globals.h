
// Constants
#define toRads(x) (x * 0.01745329252f)                                          // degrees conversion to radians

#define gyroGAIN         0.0048f

#define sampleFreq       1000.0f                                                // sample frequency in Hz

// Recomended values for Proportional (Kp) and Integral (Ki) gain
#define twoKpDef        (2.0f * 0.04f)                                          // 2 * proportional gain
#define twoKiDef        (2.0f * 0.002f)                                         // 2 * integral gain