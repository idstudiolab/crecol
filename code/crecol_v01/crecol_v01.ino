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
#define SD_CS           10
#define SD_CARD_DETECT   9

//Rotary Encoder definitions
#define ENC_SWITCH      A7
#define ENC_A            5
#define ENC_B            4
uint8_t last_button_state = 0;
volatile int16_t encoder_pos = 0;
int16_t old_encoder_pos = 0;

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
  pinMode(SD_CARD_DETECT, INPUT);
  pinMode(ENC_SWITCH, INPUT);
  pinMode(ENC_A, INPUT);
  pinMode(ENC_B, INPUT);
  pinMode(TABLE_UP, OUTPUT);
  pinMode(TABLE_DOWN, OUTPUT);
  pinMode(LED_PIN, OUTPUT);

  Wire.begin();
  Serial.begin(9600);
  
  rtc.begin();

  if (! rtc.isrunning()) {
    Serial.println("RTC is NOT running!");
    // following line sets the RTC to the date & time this sketch was compiled
    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
    // This line sets the RTC with an explicit date & time, for example to set
    // January 21, 2014 at 3am you would call:
    // rtc.adjust(DateTime(2014, 1, 21, 3, 0, 0));
  }

  attachInterrupt(digitalPinToInterrupt(SD_CARD_DETECT), readEncoder, CHANGE);
  
}

void readEncoder(){

  //digitalWrite(LED_PIN, HIGH);
  //uint8_t p0 = digitalRead(ENCODER_0_PIN);//(PIND & (1 << 0));
  //uint8_t p1 = digitalRead(ENC_B);//(PIND & (1 << 2)) >> 2;

  if (digitalRead(SD_CARD_DETECT) == digitalRead(ENC_B)) {
    encoder_pos++;
  } else {
    encoder_pos--;
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
  DateTime time = rtc.now();

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
  
  
  if( encoder_pos != old_encoder_pos ){
    old_encoder_pos = encoder_pos;
    Serial.println(encoder_pos);
  }
  
  //readEncoder();

}
