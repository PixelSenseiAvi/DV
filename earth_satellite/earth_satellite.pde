float speed_factor = 0.002;
float e=0, m=0;

PImage img, bg;
PShape globe;
PShape satellite;


Star[] stars = new Star[7];


void setup()
{  
  //starfield
  for(int i =0; i <stars.length; i++){
    stars[i] = new Star();
  }
  
  
  bg = loadImage("blue_resize.jpg");
  size(500, 500, P3D);
  img = loadImage("earth.jpg");
  satellite = loadShape("satellite_obj.obj");
  satellite.scale(2.25);
  
  noStroke();
  noFill();
 // fill(255,255,255);
  globe = createShape(SPHERE, 50);
  globe.setTexture(img);
  
}

void draw()
{
  background(0);  
  //Text
  textSize(24);
  fill(255);
  text("1960: GRB detected by spy satellite", 10, 30);
  
  translate(width/2, height/2, 0);
  
  //starfield
  for(int i =0; i <stars.length; i++){
    stars[i].update();
    stars[i].show();
  }
  
  
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
  
}
