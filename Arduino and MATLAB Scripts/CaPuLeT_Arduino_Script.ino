/* 
Head-fixed pupillometry and locomotion tracking.

Handles hardware for control of behavioral session for two head-fixation systems.
Use with MATLAB GUI "BLANK NAME".

Parameters for session are received via serial connection from MATLAB GUI. Data from hardware is then 
routed directly back via serial connection to MATLAB GUI for pupil recordings and output of wheel movement
that is captured from rotary encoders. Hardware system also incorporates a real-time clock (RTC) to correct for 
any drift in output data. 

Serial output is coded as [timestamp from RTC, timestamp from millis, rotary encoder data (steps, signed)]

Serial input is a ten number string. Numbers 1-2 will set Pulse Width Modulation (PWM) for LED, Numbers 3-4 will trigger cameras, 
Number 5 will set sampling speed of rotary encoder, and Number 6 will manually reset RTC. Number 7, 8, and 9 are extra pins that can be configured by the user. 

Input ranges:
"0-255,0-255,0-1,0-1,0-1024,0/1,0/1,0/1,0/1"

example input to reset RTC clock:
"0,0,0,0,0,50,1,0,0,0" 

*/ 


#include <Wire.h>
#include <DS3231.h>
RTClib RTC;
const int LEDPin[6] = { 42, 44, 46, 48, 50, 52 }; // Define LED pins to indicate system is working properly
const int CameraPin[2] = { 6,7 }; // Pins to trigger on cameras
const int UVIRLEDPin[2] = { 9, 10 }; // UV and IR LEDs for pupil recording
const int ExtraPin[3] = { 30, 32, 34 }; // Extra pins that can be configured for other functions
const int pin_track_a = 18; // Wheel pins which are placed to interrupt
const int pin_track_b = 19;
volatile int track_change1 = 0;  // Rotations within tracking epochs for wheel 1
signed long track_period = 50;   // Sampling speed of data output  
signed long ts_next_track = track_period;
signed long begintime = 0;
unsigned long startTime = 0; // Variable to store the reference time


void setup() {
  Serial.begin(57600);
  Wire.begin();
  for (int i = 0; i < 6; i++) {pinMode(LEDPin[i], OUTPUT);}
  for (int i = 0; i < 3; i++) {pinMode(ExtraPin[i], INPUT_PULLUP);}
  for (int i = 0; i < 2; i++) {pinMode(CameraPin[i], OUTPUT);}
  for (int i = 0; i < 2; i++) {pinMode(UVIRLEDPin[i], OUTPUT);}
  attachInterrupt(digitalPinToInterrupt(pin_track_a), TrackMovement1, RISING);
  delay(10);
  DateTime now = RTC.now();
  begintime = now.unixtime();
}

void loop() {
  unsigned long mstime = millis()-startTime;  // Record start of session
  DateTime now = RTC.now();
  unsigned long time = now.unixtime()-begintime;
  // -- TRACK MOVEMENT -- //
  if (mstime >= ts_next_track) {
    if (abs(track_change1) > 0) {
      digitalWrite(LEDPin[0], HIGH);
      Serial.print(time);
      Serial.print(",");
      Serial.print(ts_next_track);
      Serial.print(",");
      Serial.println(track_change1);
      track_change1 = 0;
      digitalWrite(LEDPin[0], LOW);
    }
    ts_next_track = ts_next_track + track_period;     // Increment ts_next_track for next track stamp
  }
  if(digitalRead(ExtraPin[0])==0){
 digitalWrite(LEDPin[2], HIGH);
 startTime = millis();
 ts_next_track = track_period;
      Serial.print(time);
      Serial.print(",");
      Serial.print(ts_next_track);
      Serial.print(",");
      Serial.println(track_change1);
    while (digitalRead(ExtraPin[0])==0)
    {delay(10);}
    digitalWrite(LEDPin[2], LOW);
  }
  if (Serial.available() > 0) {
    digitalWrite(LEDPin[1], HIGH);
    String serialData = Serial.readStringUntil('\n');
    int values[9];  // 9 ints expected
    int count = 0;
    char *token = strtok(const_cast<char *>(serialData.c_str()), ",");
    while (token != NULL && count < 9) {
      values[count++] = atoi(token);
      token = strtok(NULL, ",");}
    for (int i = 2; i < 4; i++) {digitalWrite(CameraPin[i-2], values[i]);}  // update Camera triggers   
    for (int i = 0; i < 2; i++) {analogWrite(UVIRLEDPin[i], values[i]);}  // update LEDS
    track_period = values[5]; // update sampling speed
    if(values[6]==1) { startTime = millis();
    ts_next_track = track_period;
    values[6]==0;}  // reset time
    digitalWrite(LEDPin[1], LOW); // indicate acknowledgment
    for (int i = 2; i < 4; i++) {digitalWrite(CameraPin[i-2], 0);}  // update Camera triggers
  }
}

void TrackMovement1() {
  // Track changes in rotary encoder via interrupt. If don't have an interrupt, data values are missed
  if (digitalRead(pin_track_b)) track_change1++;
  else track_change1--;
}