class Star {
  float x;
  float y;
  float z;

  // the value of z at previous frame
  float pz;

  Star() {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    pz = z;
  }

  void update() {
    z = z - 10;
    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      pz = z;
    }
  }

  void show() {
    fill(238,130,238);
    noStroke();

    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);;

    float r = map(z, 0, width/2, 16, 0);
    ellipse(sx, sy, r, r);

    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);

    pz = z;

    stroke(238,130,238);
    line(px, py, sx, sy);

  }
}
