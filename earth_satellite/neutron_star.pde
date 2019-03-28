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
int opacity =200;
PImage bg;
float fillColor = 255, blackhole_size = 20;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  bg = loadImage("blue_600x600.jpg");
  
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
  
  // if(opacity>10)
  // {
  //   opacity--;
  // }
  //else{

  // // delay(1000);
  //}
  
  if(height_factor<=0 && width_factor <=0)
  {draw_explosion();
    fillColor-=2;
    if(blackhole_size<(width/2)-110)
    {  blackhole_size+=0.5;}
    draw_black_hole();
    
    if(opacity>11)
   {
     opacity-=2;
   }
  }
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
    fill(fillColor, shapeA[i]);
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
    fill(fillColor, shapeA[i]);
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
  //Text
  textSize(24);
  text("Impact leads to creation of Black Hole", 10, 30);
  
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
  
  if(explode_size<(width/2)-80 && explode_size<(height/2)-80)
  {
    explode_size+=0.7;
  }
  
}


void draw_black_hole()
{
  fill(fillColor);
  ellipse(250,250,blackhole_size,blackhole_size);
  
}
