Population p;
int gen=1;
String txt;
PVector goal  = new PVector(300, 30);
void setup() {
  size(600, 900);
  frameRate(144);
  p = new Population(500);
}
void draw() { 
  background(182,194,154);
  stroke(0);
  fill(0);
  txt="generation:"+str(gen);
  textSize(40);
  text(txt, 15, 50);
  ellipse(goal.x, goal.y, 30, 30);
  stroke(0);
  strokeWeight(4);
  fill(128, 64, 0, 200);
  renderFlag();
  rect(0, 400, 400, 40);
	rect(200, 200, 400, 40);
  rect(200, 600, 400, 40);
  if (p.allDotsDead()) {
    p.calculateFitness();
    p.naturalSelection();
    p.changeUp();
    gen+=1;
  } 
  else {
    p.update();
    p.show();
  }
}
void renderFlag() {
  push();
  translate(goal.x + 18, goal.y + 10);
  rotate(sin(millis() * 0.01) * 0.1);
  fill(230, 50, 40);
  strokeWeight(3);
  line(0, 0, 0, -20);
  triangle(0, -10, 0, -30, 20, -20);
  pop();
}
