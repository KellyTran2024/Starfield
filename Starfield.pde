Particle[] particles = new Particle[1000];

void setup() {
  size(1000, 1000);
  background(0);

//for oddballs 
  for (int i = 0; i < 5; i++) {
    particles[i] = new OddballParticle();
  }
// for particles 
  for (int i = 5; i < particles.length; i++) {
    particles[i] = new Particle();
  }
}

void draw() {
  //make it so it doesnt leave opacity streak 
  background(0); 
  for (int i = 0; i < particles.length; i++) {
    particles[i].move();
    particles[i].show();
    particles[i].reset();
  }
}

class Particle {
  float x, y, size;
  double speed, angle;
  color c;

  Particle() {
    x = 500;
    y = 500;
    angle = Math.random() * 360;
    speed = Math.random() * 7 +2;
    size = (float)(Math.random() + 0.5);
    c = color((int)(Math.random()*256), (int)(Math.random() * 256), (int)(Math.random()*256));
  }

  void move() {
    x += cos(radians((float)angle)) *speed;
    y += sin(radians((float)angle)) *speed;
  }

  void show() {
    fill(c);
    noStroke();
    ellipse(x, y, size * dist(25, 25, x, y) / 80, size * dist(25, 25, x, y) / 80);
  }

  void reset() {
    if (x > 1000  || y > 1000  || x<-50 || y<-50) {
      x = 500;
      y = 500;
      angle = Math.random()*360;
      speed = Math.random() * 7 + 1;
    }
  }
}

class OddballParticle extends Particle {

  OddballParticle() {
    //inheriet the xy  in particle 
    super(); 
    speed = (float)(Math.random()*5) + 3; 
    angle = (float)(Math.random() *360);   
  }

  void move() {
    x += cos(radians((float)angle)) *speed;
    y += sin(radians((float)angle)) * speed;
    
    
  }
  
  
  void show() {
    float starSize = size * dist(25, 25, x, y)/35 ; 
    fill(255, 255, 0); 
    noStroke();

    pushMatrix();
    translate(x, y);

   //for star oddball 
    beginShape();
    for (int i = 0; i < 10; i++) {
      float angle = radians(36 *i);
    float radius;
      if (i % 2 == 0) {
        radius = starSize;
      } else {
      radius = starSize/2;
      }
      float x = cos(angle) * radius;
      float y = sin(angle) * radius;
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
 }
}

