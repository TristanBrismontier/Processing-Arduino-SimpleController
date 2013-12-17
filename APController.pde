  import processing.serial.*;
  import cc.arduino.*;
  
  Arduino arduino;
  int analogPin = 0;
  int pushButtonPin = 2;
  int maxAnalogPinValue = 1023;
  int rectWidth = 50;
  
  void setup()
  {
    size(500,500);
    println(Arduino.list());
    arduino = new Arduino(this, Arduino.list()[0], 57600);
    arduino. pinMode(pushButtonPin, Arduino.INPUT);
  }
  
  void draw()
  {
    background(255);
    int sensorValue = arduino.analogRead(analogPin);
    int pushButtonValue = arduino.digitalRead(pushButtonPin);
    
    if(pushButtonValue < 1){
      fill(255);
    }else{
      fill(0);
    }
     float x = (width-rectWidth) * (float) ((float)sensorValue/maxAnalogPinValue);
     rect(x,height/2,rectWidth,rectWidth);
  }
