float theta;
float r=0;
boolean forest=false;
void setup() {
  size(1300,800);
  background(8,46,84);  
}
void draw() {
  if(forest)   meteoShower(300);
  saveFrame("pic/a-###.png");
}
void meteoShower(float len) {
  float theta= random(-PI,PI);
  stroke(240,230,140,map(len,0,300,255,0));
  strokeWeight(len/30);
  line(r,height/2,r,-len);
  translate(width/2,-height/2-len);
  len *= 0.7;
  if (len>2) {
    pushMatrix();
    rotate(theta);
    meteoShower(len);
    popMatrix();
  }
}
void mousePressed(){
  r+=50;
  if(forest)  forest=false;
  else forest=true;
}
