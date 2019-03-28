int radius = 100;
int numLines = 300;
float nx = 0;
float ny = 0;

void setup(){
  size(600,600);
  background(0);
  stroke(255, 20);
}


void draw(){
  background(0);
  
  float angle = 0;
  pushMatrix();
  translate(width/2, height/2);
  for(int i = 0; i < numLines; i++){
    float x1, x2, y1, y2;
    float randLength = map(noise(nx+i*.1, ny), 0, 1, 10, radius * 2);
    strokeWeight(map(randLength, 0, radius*3, 1, 6));
    stroke(255, 20);
    x1 = radius * cos(angle);
    y1 = radius * sin(angle);
    x2 = x1 + randLength * cos(angle+PI/2);
    y2 = y1 + randLength * sin(angle+PI/2);
    line(x1, y1, x2, y2);
    angle+=TWO_PI/numLines;
  }
  popMatrix();
  nx+=.05;
  ny+=.01;
  
  //draw_gamma();
  draw_line();
}

PVector randomness(){

  PVector vec=  new PVector();
  vec.x = random(-50, 50);
  vec.y = random(-50, 50);
  
  return vec;
}

void draw_line()
{
  float gamma_width = 25;
  PVector v1 = new PVector(width/2, height/2);
  PVector v2 = new PVector(width-150 + randomness().x, 150 + randomness().y);
  //draw lines
  float r = random(0, 255);
    stroke(175,43,30, r);
    strokeWeight(gamma_width);
    line(v1.x,v1.y,v2.x,v2.y);
    stroke(255,189,46, r);
    strokeWeight(gamma_width-18);
    line(v1.x,v1.y,v2.x,v2.y);
}


void draw_gamma()
{
    //line(width/2, height/2, width- 50 + randomness().x, 50 + randomness().y);
  float gamma_width = 25;
  
  //break the lines in small parts to increase randomness
  PVector initial_coord = new PVector(width/2, height/2);
  PVector final_coord = new PVector(width-100, 100);
  float distance = PVector.dist(initial_coord, final_coord);
  
  int numLines = 10;
  float small_distance = distance/ numLines;
  
  PVector v1 =  initial_coord;
  PVector v2 = new PVector(initial_coord.x + randomness().x, 
                    initial_coord.y + randomness().y);
  for(int i=0; i<numLines; i++){
   
    //draw lines
    float r = random(0, 255);
    stroke(175,43,30, r);
    strokeWeight(gamma_width);
    line(v1.x,v1.y,v2.x,v2.y);
    stroke(255,189,46, r);
    strokeWeight(gamma_width-10);
    line(v1.x,v1.y,v2.x,v2.y);
    
    v1 = v2;
    //calculating angle between present end point and final_coord
    float angle = PVector.angleBetween(v1, final_coord); 
    PVector ran = randomness();
    v2 = new PVector(v2.x + small_distance*cos(angle) + ran.x, 
                      v2.y + small_distance*sin(angle) + ran.y);             
    gamma_width-=1;
  }
}
