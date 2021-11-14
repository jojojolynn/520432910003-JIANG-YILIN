class Dot {
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;
  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest = false;
  float fitness = 0;
  Dot() {
    brain = new Brain(1000);
    pos = new PVector(width/2, height-10);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  void show() {
    if (isBest) {
      fill(244, 208, 0, 230);
      ellipse(pos.x, pos.y, 20, 20);
    } else {
      fill(255, 230);
      ellipse(pos.x, pos.y, 20, 20);
    }
  }
  void move() {
    if (brain.directions.length > brain.step) {
      acc = brain.directions[brain.step];
      brain.step++;
    } else {
      dead = true;
    }
    vel.add(acc);
    vel.limit(100);
    pos.add(vel);
  }
  void update() {
    if (!dead && !reachedGoal) {
      move();
      if (pos.x< 5|| pos.y<5 || pos.x>width-5 || pos.y>height -5) {
        dead = true;
      } else if (dist(pos.x, pos.y, goal.x, goal.y) < 15) {
        reachedGoal = true;
      } else if (pos.x < 390 && pos.x > 0 && pos.y < 450 && pos.y > 390) {
        dead = true;
      } else if (pos.x > 190 && pos.x < 600 && pos.y < 250 && pos.y > 190) {
        dead = true;
      } else if (pos.x > 190 && pos.x < 600 && pos.y < 650 && pos.y > 590) {
        dead = true;
      }
    }
  }
  void calculateFitness() {
    if (reachedGoal) {
      fitness = 1/16 + 10000/(float)(brain.step * brain.step);
    } else {
      float distanceToGoal = dist(pos.x, pos.y, goal.x, goal.y);
      fitness = 1/(distanceToGoal * distanceToGoal);
    }
  }
  Dot Baby() {
    Dot baby = new Dot();
    baby.brain = brain.clone();
    return baby;
  }
}
