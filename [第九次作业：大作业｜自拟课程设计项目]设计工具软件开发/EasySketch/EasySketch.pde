int bs_color=0;
int bs_shape=0;
int filter=0;
float bs_size=0.5;
boolean eraser=false;
boolean clean=false;
boolean bsColor=true;
boolean pressure=true;
boolean Alpha=false;
boolean img=false;
boolean filter1=true;
boolean filter2=false;
boolean filter3=false;
color black=#011627;
color pink=#F71735;
color green=#41EAD4;
color blue=#1D5AE7;
color white=#FDFFFC;
color gray=#575E69;
color brush;
float speed = 0;
float easing = 0.07;
float r=0;
float g=0;
float b=0;
float alpha=0;
int num=200;
Agent[] as;
PImage pic;
boolean playing=true;
HScrollbar hs1,hs2,hs3,hs4,hs5;

void setup(){
  size(1500,1000);
  background(white);
  
  pic=loadImage("pic.png");
  as=new Agent[num];
  for (int i=0;i<num;i++)
  as[i]=new Agent();
  
  hs1=new HScrollbar(60,770,180,12,12);
  hs2=new HScrollbar(60,820,180,12,12);
  hs3=new HScrollbar(60,870,180,12,12);
  hs4=new HScrollbar(60,920,180,12,12);
  hs5=new HScrollbar(60,970,180,12,12);
}

void draw(){
  noStroke();
  fill(gray);
  rect(0,0,250,1000);
  hsPlay();
  bsColor();
  bsShape();
  eraser();
  bsSize();
  pSave();
  pressure();
  picture();
  
  if(mousePressed&&img){
    translate(250,0);
    pic.resize(1250,1000);
    pic.filter(THRESHOLD, 0.3);
    pic.loadPixels();
    translate(0,0);
    if(filter1){
      for (int i=0; i<num; i++)  as[i].run();
    }
    if(filter2){
      for(int i=0;i<50;i++){
        int xx=int(random(pic.width));
        int yy=int(random(pic.height));
        color c=pic.get(xx,yy);
        float b=brightness(c);
        float eSize=map(b,0,255,10,30);
        fill(c,105);
        ellipse(xx,yy,eSize,eSize);
      }
    }
    if(filter3){
      for (int y=0;y<pic.height;y+=5) {
        for (int x=0;x<pic.width;x+=5) {
          float pixel=red(pic.get(x,y));
          rectMode(CENTER);
          if (pixel<60) fill(0,43,70);
          else if (pixel>=60&&pixel<120)   fill(255,165,0);
          else if (pixel>=120&&pixel<180)   fill(0,120,255);
          else if (pixel>=180)   fill(252,224,158);
          ellipse(x,y,100,2);
        }
        rectMode(CORNER);
      }
    }
  }
  if(mousePressed&&(!img)&&(!(mouseX>0&&mouseX<250&&mouseY>0&&mouseY<1000))){
    float target=dist(mouseX,mouseY,pmouseX,pmouseY);
    speed+=(target-speed)*easing;
    
    if(bs_shape%5==0){
      if(pressure)  stroke(red(brush)+speed,green(brush)+speed,blue(brush)+speed,alpha);
      else stroke(brush,alpha);
      if(eraser) stroke(white,alpha);
      strokeWeight(speed/2*bs_size);
      line(mouseX,mouseY,pmouseX,pmouseY);
    }
    
    if(bs_shape%5==1){
      if(pressure)  stroke(red(brush)+speed,green(brush)+speed,blue(brush)+speed,alpha*0.7);
      else stroke(brush,alpha);
      if(eraser) stroke(white,alpha);
      strokeWeight(bs_size);
      line(mouseX,mouseY,pmouseX,pmouseY);
    }
    
    if(bs_shape%5==2){
      if(pressure)  stroke(red(brush)+speed,green(brush)+speed,blue(brush)+speed,alpha);
      else stroke(brush,alpha);
      if(eraser) stroke(white,alpha);
      strokeWeight(speed/2*bs_size);
      fill(0,0);
      rectMode(CORNERS);
      rect(mouseX,mouseY,pmouseX,pmouseY);
      rectMode(CORNER);
    }
    
    if(bs_shape%5==3){
      float val=speed/2*bs_size;
      for(int a=0;a<360;a+=60){
        float xoff=cos(radians(a))*val*0.93;
        float yoff=sin(radians(a))*val*0.93;
        if(pressure) fill(red(brush)+xoff-val,green(brush)+yoff-val,blue(brush)-val,alpha);
        else fill(brush,alpha);
        if(eraser)  fill(white,alpha);
        ellipse(mouseX,mouseY,val,val);
        ellipse(mouseX+xoff,mouseY+yoff,val,val);
      }
    }
    
    if(bs_shape%5==4){
      for(int x=mouseX-int(speed/2*bs_size);x<mouseX+int(speed/2*bs_size);x++){
        for(int y=mouseY-int(speed/2*bs_size);y<mouseY+int(speed/2*bs_size);y++){
          color c;
          if(eraser)  c=white;
          if(pressure) c=color(red(brush)+x-mouseX+50,green(brush)+y-mouseY+50,blue(brush)+50);
          else c=brush;
          set(x,y,c);
          fill(c,alpha);
          line(mouseX, mouseY, pmouseX, pmouseY);
        }
      }
    }   
  }
}
void mouseClicked(){
  if(mouseX<200&&mouseX>50&&mouseY<150&&mouseY>100){    //color button
    bs_color+=1;
    fill(pink);
    rect(50,100,150,50);
  }
  
  if(mouseX<200&&mouseX>50&&mouseY<250&&mouseY>200){  //shape button
    bs_shape+=1;
    fill(pink);
    rect(50,200,150,50);
  }
  
  if(mouseX<200&&mouseX>50&&mouseY<350&&mouseY>300){  //eraser button
    if(eraser) eraser=false;
    else eraser=true;
    fill(pink);
    rect(50,300,150,50);
  }
  
  if(mouseX<200&&mouseX>50&&mouseY<450&&mouseY>400){  //pressure button
    if(pressure) pressure=false;
    else pressure=true;
    fill(pink);
    rect(50,400,150,50);
  }
  
  if(mouseX<200&&mouseX>50&&mouseY<550&&mouseY>500){  //save button
    saveFrame("goodjob-####.png");
    fill(pink);
    rect(50,500,150,50);
  }
  
  if(mouseX<200&&mouseX>50&&mouseY<650&&mouseY>600){  //picture button
    if(img){
      img=false;
      fill(pink);
      rect(-200,600,150,50);
    } 
    else{
      img=true;
      fill(pink);
      rect(50,600,150,50);
    }
  }
  
  if(mouseX<235&&mouseX>215&&mouseY<135&&mouseY>115){  //color control
    if(bsColor) bsColor=false;
    else bsColor=true;
    fill(pink);
    rect(215,115,20,20);
  }
  
  if(mouseX<235&&mouseX>215&&mouseY<335&&mouseY>315){  //eraser control
    if(clean) clean=false;
    else clean=true;
    fill(pink);
    rect(215,315,20,20);
  }
  
  if(mouseX<235&&mouseX>215&&mouseY<435&&mouseY>415){  //pressrue control
    if(pressure) pressure=false;
    else pressure=true;
    fill(pink);
    rect(215,415,20,20);
  }
  
  if(mouseX<235&&mouseX>215&&mouseY<635&&mouseY>615){  //picture control
    filter+=1;
    fill(pink);
    if(img) rect(-35,615,20,20);
    else rect(215,65,20,20);
    if(filter%3==0){
      filter1=true;
      filter2=false;
      filter3=false;
    }
    if(filter%3==1){
      filter1=false;
      filter2=true;
      filter3=false;
    }
    if(filter%3==2){
      filter1=false;
      filter2=false;
      filter3=true;
    }
  }
}

void bsColor(){
  fill(151);
  rect(50,100,150,50);
  if(!bsColor)  fill(247,68,97);
  else fill(113,175,150);
  rect(215,115,20,20);
  fill(white);
  textSize(30);
  text("color",95,134);
  if(bsColor){
    if(bs_color%6==0)  brush=black;
    if(bs_color%6==1)  brush=pink;
    if(bs_color%6==2)  brush=blue;
    if(bs_color%6==3)  brush=green;
    if(bs_color%6==4)  brush=white;
    if(bs_color%6==5)  brush=color(frameCount%360, 30, 100);
  }
  else    brush=color(r,g,b);
}

void bsShape(){
  fill(151);
  rect(50,200,150,50);
  fill(white);
  textSize(30);
  text("shape",88,233);
}

void eraser(){
  fill(151);
  rect(50,300,150,50);
  fill(white);
  textSize(30);
  if(eraser) text("painter",81,333);
  else text("eraser",86,333);
  if(clean){
    fill(white);
    rect(250,0,1250,1000);
    fill(247,68,97);
  }
  else fill(113,175,150);
  rect(215,315,20,20);
}

void bsSize(){
  if(key==CODED&&keyCode==UP)  bs_size+=0.01;
  if(key==CODED&&keyCode==DOWN)  bs_size-=0.01;
  if(bs_size==0||bs_size==2)  bs_size=0.5;
}

void pSave(){
  fill(151);
  rect(50,500,150,50);
  fill(white);
  textSize(30);
  text("save",96,533);
  if(keyPressed&&(key=='s'||key=='S'))  saveFrame("goodjob-####.png");
}

void picture(){
  fill(151);
  rect(50,600,150,50);
  fill(white);
  textSize(30);
  text("picture",81,633);
  if(filter%3==0)  fill(247,68,97);
  if(filter%3==1)  fill(113,175,150);
  if(filter%3==2)  fill(227,160,93);
  rect(215,615,20,20); 
}

void pressure(){
  fill(151);
  rect(50,400,150,50);
  fill(white);
  textSize(30);
  text("pressure",72,432);
  if(!pressure)  fill(247,68,97);
  else fill(113,175,150);
  rect(215,415,20,20);
}

void hsPlay(){
  hs1.run();
  hs2.run();
  hs3.run();
  hs4.run();
  hs5.run();
  fill(white);
  textSize(19);
  text("R:",22,776);
  text("G:",22,826);
  text("B:",22,876);
  text("size:",15,926);
  text("alpha:",7,976);
  r=map(hs1.getPos(),0,15,0,255);
  g=map(int(hs2.getPos()),0,20,0,255);
  b=map(hs3.getPos(),0,20,0,255);
  bs_size=map(hs4.getPos(),0,20,0,2);
  if(keyPressed&&(key=='a'||key=='A')){
    if(Alpha)  Alpha=false;
    else  Alpha=true;
  }
  if(Alpha)   alpha=map(hs5.getPos(),0,20,0,255);
  else  alpha=255;
}

class HScrollbar {
  int swidth, sheight;
  float xpos, ypos;
  float spos, newspos;
  float sposMin, sposMax;
  int loose;
  boolean over;
  boolean locked;
  float ratio;

  HScrollbar (float xp,float yp,int sw,int sh,int l) {
    swidth=sw;
    sheight=sh;
    int widthtoheight=sw-sh;
    ratio=(float)sw/(float)widthtoheight;
    xpos=xp;
    ypos=yp-sheight/2;
    spos=xpos + swidth/2 - sheight/2;
    newspos=spos;
    sposMin=xpos;
    sposMax=xpos + swidth - sheight;
    loose=l;
  }

  void update() {
    if (overEvent())  over = true;
    else   over = false;
    if (mousePressed&&over)    locked=true;
    if (!mousePressed)  locked=false;
    if (locked)  newspos=constrain(mouseX-sheight/2,sposMin,sposMax);
    if (abs(newspos-spos)>1)  spos=spos+(newspos-spos)/loose;
  }

  float constrain(float val,float minv,float maxv) {
    return min(max(val,minv),maxv);
  }

  boolean overEvent() {
    if (mouseX>xpos&&mouseX<xpos+swidth&&mouseY>ypos&&mouseY<ypos+sheight)    return true;
    else  return false;
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over||locked)   fill(0);
    else   fill(130);
    ellipse(spos,ypos+sheight/2,sheight*1.5,sheight*1.5);
  }
  
  void run(){
    update();
    display();
  }

  float getPos() {
    return (newspos-xpos)/sheight*ratio ;
  }
}

class Agent {
  PVector center;
  PVector spd;
  PVector loc;
  PVector prev;
  float a;
  float angle=random(TWO_PI);
  float angleSpd=random(0.01,0.02);
  float rad=random(10,100);
  color c;
  int energy;

  Agent() {
    center=new PVector(random(width),random(height));
    spd=PVector.random2D();
    spd.mult(random(0.2, 1));
    loc=new PVector();
    loc.set(center.x+cos(angle)*rad,center.y+sin(angle)*rad);
    prev=loc.copy();
    c=pic.get(int(loc.x),int(loc.y));
  }

  void update() {
    center.add(spd);
    angle+=angleSpd;
    loc.set(center.x+cos(angle)*rad,center.y+sin(angle)*rad);
    if (loc.x<0||loc.x>width||loc.y<0||loc.y>height) {
      center.set(random(width),random(height));
      loc.set(center.x+cos(angle)*rad,center.y+sin(angle)*rad);
      prev=loc.copy();
      energy=0;
    }
  }

  void display() {
    if (brightness(pic.get(int(loc.x),int(loc.y)))==255) {
      energy-=5;
      energy=max(energy,0);
    } 
    else  energy++;
    if (energy>0) {
      a=map(spd.mag(),0,2,13,0);
      strokeWeight(random(a));
      stroke(c, 60);
      line(prev.x, prev.y, loc.x, loc.y);
    }     
    prev=loc.copy();
  }
  
  void run(){
    update();
    display();
  }
}
