float speed_factor = 0.002;
float e=0, m=0;

PImage img, bg, img1;
PShape globe, mars;
PShape satellite;
float laser, min_val;
int scene;
int numCircles = 70;
int opacity = 90;


void setup()
{  
  //bg = loadImage("blue_resize.jpg");
  size(600, 500, P3D);
  img = loadImage("earth.jpg");
  img1 = loadImage("mars.jpg");
  
  satellite = loadShape("satellite_obj.obj");
  satellite.scale(2.25);
  
  noStroke();
  noFill();
 // fill(255,255,255);
  globe = createShape(SPHERE, 50);
  globe.setTexture(img);
  
  mars = createShape(SPHERE, 50);
  mars.setTexture(img1);
  laser =0.f;
  scene =1;
}

void draw()
{
  if(scene ==1)
  {
    render_scene1();
  }else if(scene ==2)
  {
    render_scene2();
  }
    
}


void render_scene1()
{
  background(0);
  strokeCap(ROUND);
  
  draw_laser();
  //Text
  textSize(24);
  fill(255);
  text("If GRB pointed at earth", 10, 30);
  
  translate(width/4, height/2, 0);
  
  //earth
  //fill(32, 160, 255);
  rotateY(e);
  shape(globe);
  noLights();
  
  spotLight(255, 255, 255,0,0,0,1,0,0,PI/2,0);
  translate(width/4, 0, 0);
  rotateY(m);
  
  //satellite
  spotLight(255, 255, 255,0,0,0,1,0,0,PI/2,0);
  shape(satellite);
  translate(width/16, 0, 0);
  if(m>0.3*PI && m<1.7*PI)  fill(150, 100, 32);
  else if(m>0.2*PI && m<1.8*PI) fill(32, 160, 255);
  else fill(16, 16, 16);
  e=e+speed_factor;
  m = m+ 13*speed_factor;
  if(m>2*PI) m=m-2*PI;
  
  if(min_val>180.0f)
  {
    laser -=0.5;
  }else
  {
    scene = 2;
   }
}


void render_scene2()
{
   background(0);
  strokeCap(ROUND);
  
  
  //Text
  textSize(24);
  fill(255);
  text("Earth will fry in a jitter", 10, 30);
  
  translate(width/4, height/2, 0);
  
  //earth
  //fill(32, 160, 255);
  rotateY(e);
  shape(mars);
  noLights();
  
  spotLight(255, 255, 255,0,0,0,1,0,0,PI/2,0);
  translate(width/4, 0, 0);
  rotateY(m);
  
  //satellite
  if(m>0.3*PI && m<1.7*PI)  fill(150, 100, 32);
  else if(m>0.2*PI && m<1.8*PI) fill(32, 160, 255);
  else fill(16, 16, 16);
  e=e+speed_factor;
  m = m+ 13*speed_factor;
  if(m>2*PI) m=m-2*PI;
  
  if(min_val>180.0f)
  {
    laser -=0.5;
  }else
  {
    scene = 2;
   }
}

void draw_laser()
{
  float gamma_width = 25;
  PVector v1 = new PVector(width/2 + 115, height/2);
  PVector v2 = new PVector((width/2)+195, height/2);
  //draw lines
  float r = random(0, 255);
    stroke(175,43,30, r);
    strokeWeight(gamma_width);
    strokeCap(ROUND);
    line(v1.x-10 + laser,v1.y,v2.x+10 +laser,v2.y);
    stroke(255,189,46, r);
    strokeWeight(gamma_width-18);
    strokeCap(ROUND);
    line(v1.x + laser,v1.y,v2.x + laser,v2.y);
    
    min_val = v1.x-10 + laser;
}
