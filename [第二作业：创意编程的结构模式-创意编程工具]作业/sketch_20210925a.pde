int angle=0;
void setup(){
  size(1000,1000);
  background(0,0,0);
  noStroke();
  frameRate(20); 
  fill(0,102);
}
void draw(){
  background(0,0,0,0);
  for(int i=1;i<=80;i++){
  fill(random(100),random(150),random(255),random(255));
  ellipse(random(1000),random(1000),15,15);
  }
  angle+=5;
  float val=cos(radians(angle))*25;
  for(int a=0;a<360;a+=60){
    float xoff=cos(radians(a))*val;
    float yoff=sin(radians(a))*val;
    fill(random(255),random(0),random(150));
    ellipse(mouseX+xoff*3,mouseY+yoff*3,val*4,val*4);
  }
  fill(255,220,0);
  ellipse(mouseX,mouseY,60,60);
}
