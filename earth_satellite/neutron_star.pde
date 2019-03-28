int numShapes = 30;
int currentShape = 0;                   // counter
float[] shapeX = new float[numShapes];  // x coordinates
float[] shapeY = new float[numShapes];  // y coordinates
float[] shapeA = new float[numShapes];  // alpha values
int shapeSize = 25;
float val, speed = 0.05;
float x, y, x1, y1;
float val1;
float width_factor = 100, height_factor = 150;
float explode_size = (float)shapeSize; 
int opacity =255;
PImage bg;


void setup() {
  size(500, 500);
  smooth();
  noStroke();
  //bg = loadImage("blue.jpg");
  
  val1 = 3.0f;
}


void draw() {
  background(0);
  
  //Text
  textSize(24);
  text("Collision of neutron stars", 10, 30);
  
  draw_neutron_one();
  draw_neutron_two();
  
  if(width_factor>0)
  {
    width_factor-=0.2;
  }
  if(height_factor>0)
  {
    height_factor-=0.2;
  }
  
  if(height_factor<=0 && width_factor <=0)
  {draw_explosion();}
}

void draw_neutron_one()
{
  //println(val);
  x = sin(val);
  y = cos(val);
   
   //Multiply x and y by the ellipses width (100) and height (500)
  x *= height_factor;
  y *= width_factor;

  //Move the centrepoint of the ellipse orbit where you want it
  x+= 250;
  y+= 250;
  
  shapeX[currentShape] = x;
  shapeY[currentShape] = y;
  shapeA[currentShape] = 255; 

  for (int i=0; i<numShapes ; i++) {
    fill(255, shapeA[i]);
    ellipse(shapeX[i], shapeY[i], shapeSize, shapeSize);
    shapeA[i] -= 255/numShapes;
  }

  // increment counter
  currentShape++;
  currentShape %= numShapes;  // rollover counter to 0 when up to numShapes
  
  //Update the value
  val += speed;  
}

void draw_neutron_two()
{
  x1 = sin(val1);
  y1 = cos(val1);
   
   //Multiply x and y by the ellipses width (100) and height (500)
  x1 *= height_factor;
  y1 *= width_factor;

  //Move the centrepoint of the ellipse orbit where you want it
  x1+= 250;
  y1+= 250;
  
  shapeX[currentShape] = x1;
  shapeY[currentShape] = y1;
  shapeA[currentShape] = 255;

  for (int i=0; i<numShapes ; i++) {
    fill(255, shapeA[i]);
    ellipse(shapeX[i], shapeY[i], shapeSize, shapeSize);
    shapeA[i] -= 255/numShapes;
  }

  // increment counter
  currentShape++;
  currentShape %= numShapes;  // rollover counter to 0 when up to numShapes
  
  //Update the value
  val1 += speed;
}

void draw_explosion()
{
  shapeX[currentShape] = x;
  shapeY[currentShape] = y;
  shapeA[currentShape] = 255; 

  for (int i=0; i<numShapes ; i++) {
    fill(255, opacity);
    ellipse(shapeX[i], shapeY[i], explode_size, explode_size);
    shapeA[i] -= 255/numShapes;
    
  }

  // increment counter
  currentShape++;
  currentShape %= numShapes; 
  
  if(explode_size<width/2 && explode_size<height/2)
  {
    explode_size+=0.5;
  }
  
  if(opacity>10){opacity--;}
  else{
  //run blackhole script here
  
    delay(1000);
    exit();
  }
}
