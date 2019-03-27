int numShapes = 30;
int currentShape = 0;                   // counter
float[] shapeX = new float[numShapes];  // x coordinates
float[] shapeY = new float[numShapes];  // y coordinates
float[] shapeA = new float[numShapes];  // alpha values
int shapeSize = 25;
float val, speed = 0.05;
float x, y, x1, y1;
float val1;


void setup() {
  size(500, 500);
  smooth();
  noStroke();
  
  val1 = 3.0f;
}


void draw() {
  background(0);
  
  draw_neutron_one();
  draw_neutron_two();
}

void draw_neutron_one()
{
  println(val);
  x = sin(val);
  y = cos(val);
   
   //Multiply x and y by the ellipses width (100) and height (500)
  x *= 150;
  y *= 100;

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
  x1 *= 150;
  y1 *= 100;

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
