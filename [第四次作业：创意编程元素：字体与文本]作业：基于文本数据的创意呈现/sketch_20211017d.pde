PFont f;
float r=20;
float angle=0;
float arclength=0;
String string = "ppppppppioioioioppppppppioioioio";
String str = "ddddddddddddddddddddddddddddddddddddddddddddddddddd";
boolean a=true;
void setup(){
  size(800,600);
  f=createFont("3ds",60,true);
  textFont(f);
  textAlign(CENTER);
  stroke(0);
  frameRate(100);
  smooth();
}
float t=0f;
void draw(){
  r+=5;
  if(r==400)  r=20;
  background(255);
  translate(width/2,height/2);  
  t++;
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
    float n=noise(0.015*x,0.015*y,0.015*t)*255;
    set(x,y,color(n));
    }
  }
  grow(r);
  if(r>100&&r<201){
    grow(r-100);
  }
  if(r>200&&r<301){
    grow(r-200);
  }
  if(r>300&&r<400){
    grow(r-300);}
  }
void grow(float rr){
    if(mousePressed){
    if(a==true){
      a=false;
    }
    if(a==false){
      a=true;
    }
  }
  if(a==true){
    for (int i=0;i<string.length();i++){
    angle+=5;
    char c=string.charAt(i);
    float w=textWidth(c);
    arclength+=w/2;
    float theta=PI+arclength / rr;
    pushMatrix();
    translate((rr-100)*cos(theta+angle),(rr-100)*sin(theta+angle));
    rotate(theta+PI/2+angle);
    fill(0);
    text(c,0,0);
    popMatrix();
    arclength += w/2;
  }
  }
  if(a==false){
    for (int i=0;i<str.length();i++){
    angle+=5;
    char c=str.charAt(i);
    float w=textWidth(c);
    arclength+=w/2;
    float theta=PI+arclength / rr;
    pushMatrix();
    translate((rr-100)*cos(theta+angle),(rr-100)*sin(theta+angle));
    rotate(theta+PI/2+angle);
    fill(0);
    text(c,0,0);
    popMatrix();
    arclength += w/2;
  }
  }
}
