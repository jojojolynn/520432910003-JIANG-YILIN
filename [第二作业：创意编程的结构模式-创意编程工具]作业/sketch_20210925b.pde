int angle=0;
void setup() {
  size(1000, 1000);
  background(255);
  //frameRate(10); 
  noStroke();
}

void draw() {
  int x=500;
  int y=500;
  angle+=7;
  fill(255,255,255,10);
  rect(0,0,1000,1000);
  fill(random(256), 100, 100);
  int num =int (random(500,1000));
  for (int a = 0; a < num; a++) {
    float diameter =( pow(random(1), 20))*10;
    float distance =(1 - diameter) *3;
    float radian = radians(angle);
    ellipse(x+distance*10 * cos(radian),y+ distance *10* sin(radian), diameter*20, diameter*20);
  }
}
