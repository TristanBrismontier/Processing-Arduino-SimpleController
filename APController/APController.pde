  import processing.serial.*;  
  
  Serial port;
  int nbStep = 10;
  boolean xp, xn, yp, yn =false;
  
  void setup()
  {
    size(1024,1024);
   size(360, 360);
  frameRate(100);
  println(Serial.list()); // List COM-ports
  //select second com-port from the list (COM3 for my device)
  // You will want to change the [1] to select the correct device
  // Remember the list starts at [0] for the first option.
  port = new Serial(this, Serial.list()[0], 9600);
  }
  
  void draw()
  {
   
   if(xp)port.write(nbStep+"q");
   if(xn)port.write(nbStep+"d");
   if(yp)port.write(nbStep+"z");
   if(yn)port.write(nbStep+"s");
  }
  
  void keyPressed(){
    if(keyCode==RIGHT)
    {
     xn =true;
     xp =false;
    }
    if(keyCode==LEFT)
    {
      xp =true;
      xn =false;
    }
    if(keyCode==UP)
    {
        yp =true;
        yn =false;
     }
    if(keyCode==DOWN)
    {
      yn =true;
      yp =false;
    }
  }
    
  void keyReleased()
  {
     if(keyCode==RIGHT)
    {
     xn =false;
    }
    if(keyCode==LEFT)
    {
      xp =false;
    }
    if(keyCode==UP)
    {
      yp =false;
     }
    if(keyCode==DOWN)
    {
      yn =false;
    }
  }
    
    
  }
