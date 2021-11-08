class ParticleSystem{
  ArrayList<Particle>  particles;
  PVector origin;
  ParticleSystem(PVector location){
    particles=new ArrayList<Particle>();
    origin=location.get();
  }
  void addParticle(){
    float r=random(1);
    if(r<0.5)    particles.add(new Particle(origin));
    else  particles.add(new Confetti(origin));
  }
  void run(){
    Iterator<Particle> it=particles.iterator();
    while(it.hasNext()){
      Particle p=it.next();
      p.applyForce(envir.gravity);
      p.applyForce(envir.wind);
      p.run();
      if(p.isDead()){
        it.remove();
      }
    }
  }
}
