class Environment{
  PVector gravity;
  PVector wind;
  float t;
  Environment(){
    gravity=new PVector(0,0.1);
    wind=new PVector(0,0);
    t=0;
  }
  void update(){
    wind.x=map(noise(t),0,1,-0.3,0.3);
    t+=0.01;
  }
}
