//Crecol v0.1
//Code applies to HV3.0

#include <Wire.h>

//LED definitions
#include <Adafruit_NeoPixel.h>
#define LED_PIN          8
#define LED_COUNT       16
#define BRIGHTNESS     255 

//RTC definitions
#include "RTClib.h"
#define RTC_INT         A0
RTC_DS1307 rtc;

//SD definitions
#include <SPI.h>
#include <SD.h>
#define SD_CS           10
File logfile;

//Rotary Encoder definitions
#define ENC_SWITCH      A7
#define ENC_A            9
#define ENC_B            4
uint8_t last_button_state = 0;
volatile int16_t encoderPos = 0;
int16_t oldEncoderPos = 0;

//Motor Driver definitions
#define TABLE_UP         2
#define TABLE_DOWN       3

//State Machine definitions
#define UNDEFINED       0
#define STANDING        1
#define SITTING         2
#define TEAM            3
uint8_t current_state = 0;
uint8_t for_last_state = 0; 

#define LED_PIN        13


void setup() {
  pinMode(LED_PIN, OUTPUT);
  pinMode(RTC_INT, INPUT);
  pinMode(SD_CS, OUTPUT);
  pinMode(ENC_SWITCH, INPUT);
  pinMode(ENC_A, INPUT);
  pinMode(ENC_B, INPUT);
  pinMode(TABLE_UP, OUTPUT);
  pinMode(TABLE_DOWN, OUTPUT);
  pinMode(LED_PIN, OUTPUT);

  Wire.begin();
  Serial.begin(9600);
  while(!Serial);
  
  rtc.begin();

  if (! rtc.isrunning()) {
    Serial.println("RTC is NOT running!");
    // following line sets the RTC to the date & time this sketch was compiled
    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
    // This line sets the RTC with an explicit date & time, for example to set
    // January 21, 2014 at 3am you would call:
    // rtc.adjust(DateTime(2014, 1, 21, 3, 0, 0));
  }
  Serial.println("RTC innitialized");
  DateTime time = rtc.now();
  Serial.println(time.timestamp(DateTime::TIMESTAMP_FULL));

  attachInterrupt(digitalPinToInterrupt(ENC_A), readEncoder, CHANGE);
  Serial.println("Encoder initialized");
  
  if (!SD.begin(SD_CS)) {
    Serial.println("Card init. failed!");
  }
  Serial.println("SD card initialized");
  
//  char filename[15];
//  strcpy(filename, "/ANALOG00.TXT");
//  for (uint8_t i = 0; i < 100; i++) {
//    filename[7] = '0' + i/10;
//    filename[8] = '0' + i%10;
//    // create if does not exist, do not open existing, write, sync after write
//    if (! SD.exists(filename)) {
//      break;
//    }
//  }
//    logfile = SD.open(filename, FILE_WRITE);
//  if( ! logfile ) {
//    Serial.print("Couldnt create "); 
//    Serial.println(filename);
//  }
//  Serial.print("Writing to "); 
//  Serial.println(filename);
//  Serial.println("Ready!");
  
}

void readEncoder(){

  //digitalWrite(LED_PIN, HIGH);
  //uint8_t p0 = digitalRead(ENCODER_0_PIN);//(PIND & (1 << 0));
  //uint8_t p1 = digitalRead(ENC_B);//(PIND & (1 << 2)) >> 2;

  if (digitalRead(ENC_A) == digitalRead(ENC_B)) {
    encoderPos++;
  } else {
    encoderPos--;
  }
  digitalWrite(LED_PIN, HIGH);
}

bool encoder_switch(){
  if( !digitalRead(ENC_SWITCH) && last_button_state == 0 ){
    last_button_state = 1;
    return( true );
  }
  else if( digitalRead(ENC_SWITCH) ){
    last_button_state = 0;
    return( false );
  }
}



void loop() {
  //DateTime time = rtc.now();

 //Full Timestamp
  //Serial.println(String("DateTime::TIMESTAMP_FULL:\t")+time.timestamp(DateTime::TIMESTAMP_FULL));

//  digitalWrite(TABLE_UP, HIGH);
//  digitalWrite(TABLE_DOWN, LOW);
//  Serial.println("up");
//  delay(3000);
//
//  digitalWrite(TABLE_UP, LOW);
//  digitalWrite(TABLE_DOWN, HIGH);
//  Serial.println("down");
//  delay(3000);

  switch( current_state ){
    case( UNDEFINED ):
      if( encoder_switch()  ){
        current_state = STANDING;
        Serial.println("STANDING");
      }
    break;

    case( STANDING ):
      if( encoder_switch() ){
        current_state = TEAM;
        for_last_state = STANDING;
        Serial.println("TEAM");
      }
      
    break;

    case( SITTING ):
      if( encoder_switch() ){
        current_state = TEAM;
        for_last_state = SITTING;
        Serial.println("TEAM");
      }

    break;

    case( TEAM ):
      if( encoder_switch() ){
        if( for_last_state == STANDING ){
          current_state = SITTING;
          Serial.println("SITTING");
        }
        else if( for_last_state == SITTING ){
          current_state = STANDING;
          Serial.println("STANDING");
        }
      }
    break;
  }
  
  
  if( encoderPos != oldEncoderPos ){
    oldEncoderPos = encoderPos;
    Serial.println(encoderPos);
    
    File dataFile = SD.open("datalog.txt", FILE_WRITE);

      // if the file is available, write to it:
    if (dataFile) {
      dataFile.println(encoderPos);
      dataFile.close();
        // print to the serial port too:
        //Serial.println(dataString);
    }
    // if the file isn't open, pop up an error:
    else {
      Serial.println("error opening datalog.txt");
    }
  }

  digitalWrite(TABLE_UP, HIGH);
  digitalWrite(TABLE_DOWN, LOW);
  delay(5000);
  digitalWrite(TABLE_UP, LOW);
  digitalWrite(TABLE_DOWN, HIGH);
  delay(5000);
  
  //readEncoder();

}
