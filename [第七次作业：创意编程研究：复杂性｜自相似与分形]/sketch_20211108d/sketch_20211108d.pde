
float theta;
boolean forest=false;
void setup() {
  size(1300,800);
  background(255);
}
 
void draw() {
  //background(255);
  translate(width/2, height);
  stroke(0);
  if(forest)  branch(200);
  //background(255);
  saveFrame("pic/a-###.png");
}
void branch(float len) {
  float theta = random(0,PI/3);
  stroke(47,90,50,map(len,0,300,255,10));
  strokeWeight(len/30);
  line(width/2,height,width/2,-len);
  translate(0, -len);
  len *= 0.7;
  if (len > 2) {
    pushMatrix();
    rotate(theta);
    branch(len);
    popMatrix();
    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
  }
}
void mousePressed(){
  if(forest)  forest=false;
  else forest=true;
}
