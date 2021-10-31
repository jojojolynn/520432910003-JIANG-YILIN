import java.util.Iterator;
ArrayList<FlowerMoveSystem> systems;
float x,y;
int angle=0;

void setup() {
  size(1500,1000);
  systems = new ArrayList<FlowerMoveSystem>();
}

void draw() {
  angle+=5;
  background(255);
  loadPixels();
  float tx=0.0;
  for(int x=0;x<width;x++){
    float ty=0.0;
    for(int y=0;y<height;y++){
      int col=y*width+x;  
      int blue=(int)map(noise(tx,ty),0,1,80,150);
      int red=(int)map(noise(tx,ty),0,1,50,80);
      int green=(int)map(noise(tx,ty),0,1,30,50);
      pixels[col]=color(red,green,blue,random(0,20)); 
      ty+=0.01;
    }tx+=0.01;
  }
  updatePixels(); 
  for (FlowerMoveSystem f:systems) { 
    f.run();
    f.addFlowerMove();
  }
  x=(mouseX+20*angle)*cos(angle);
  y=(mouseY+20*angle)*sin(angle);
  systems.add(new FlowerMoveSystem(new PVector(x, y)));
  saveFrame("pic/a-###.png");
}

void mousePressed() {

  systems.add(new FlowerMoveSystem(new PVector(mouseX, mouseY)));
}
