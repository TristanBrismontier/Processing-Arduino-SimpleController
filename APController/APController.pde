  import processing.serial.*;
  import cc.arduino.*;
  
  Arduino arduino;
  int analogPinX = 0;
  int analogPinY = 1;
  int servoPin = 10;
  int pushButtonPin = 2;
  int maxAnalogPinValue = 1023;
  int rectWidth = 1;
  float x= 0;
  float y= 0;
  
  
  
  void setup()
  {
    size(1024,1024);
    println(Arduino.list());
    arduino = new Arduino(this, Arduino.list()[0], 57600);
    arduino.pinMode(pushButtonPin, Arduino.INPUT);
    arduino.pinMode(servoPin, Arduino.OUTPUT);
  }
  
  void draw()
  {
    
    int sensorValueX = arduino.analogRead(analogPinX);
    int sensorValueY = arduino.analogRead(analogPinY);
    int pushButtonValue = arduino.digitalRead(pushButtonPin);
    int angle = (int) (180 * (float) ((float)sensorValueX/maxAnalogPinValue));
   println(angle);
    arduino.analogWrite(servoPin,angle);  
    if(pushButtonValue < 1){
      stroke(0);
    }else{
       background(209);  
    }
    
     float newX = (width-rectWidth) * (float) ((float)sensorValueX/maxAnalogPinValue);
     float newY = (height-rectWidth) * (float) ((float)sensorValueY/maxAnalogPinValue);
    if(frameCount > 10){
      line(x,y,newX,newY);
    }
    x= newX;
    y= newY;
     rect(x,y,rectWidth,rectWidth);
  }
