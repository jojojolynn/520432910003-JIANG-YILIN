class Particle{

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifeSpan;
  float angle;
  
    Particle(PVector l){
      location=l.get();
      velocity=new PVector(random(-1,1),random(-2,0));
      acceleration=new PVector();
      lifeSpan=255;
    }
    void update(){
      velocity.add(acceleration);
      acceleration.mult(0);
      location.add(velocity);
      lifeSpan-=1;
      angle+=0.1;
    }
    void display(){
      noStroke();
      fill(200,70,80,lifeSpan);
      translate(location.x,location.y);
      rotate(angle);
             for(int i=0;i<360;i+=60){
      int val=int(random(10,20));
      float xoff=cos(radians(i))*val*0.93;
      float yoff=sin(radians(i))*val*0.93;
      ellipse(location.x,location.y,val,val);
      ellipse(location.x+xoff,location.y+yoff,val,val);

      }
    }
    void applyForce(PVector force){
      acceleration.add(force);
    }
    void run(){
      update();
      display();
    }
    boolean isDead(){
      if(lifeSpan<0)  return true;
      else  return false;
    }
}

class Confetti extends Particle{
  Confetti(PVector l){
    super(l);
  }
  void display(){
    noStroke();
    fill(47,102,80,lifeSpan);
    ellipse(location.x,location.y,8,8);
  }

}
