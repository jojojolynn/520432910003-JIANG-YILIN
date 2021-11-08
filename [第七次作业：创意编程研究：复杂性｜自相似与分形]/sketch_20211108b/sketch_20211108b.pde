import java.util.Iterator;
Environment envir;
ParticleSystem ps;
float theta;
boolean forest=false;
void setup() {
  size(1300,800);
  background(255);
  ps=new ParticleSystem(new PVector(random(width/3,width/3*2),random(height/3,height/3*2)));
  envir=new Environment();
}
 
void draw() {
  //background(255);
  envir.update();
  ps.addParticle();
  ps.run();
  translate(width/2, height);
  stroke(0);
  if(forest)  branch(200);
  //background(255);
  saveFrame("pic/a-###.png");
}
void branch(float len) {
  float theta = random(0,PI/3);
  stroke(150,70,10,map(len,0,200,250,20));
  strokeWeight(len/10);
  line(0, 0, 0, -len);
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
