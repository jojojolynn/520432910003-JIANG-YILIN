int angle=0;
void setup() {
  size(1200,1200);
  background(#ffffff);
  translate(500,300);
  mondrian(); 
  frameRate(100); 
}

void draw(){
  translate(500,300);
  angle+=45;
  mondrian();
}

void mondrian(){
  float a=0;
  float b=0;
  int Width=500;
  int Height=500;
  float lineSize=0;
  float colSize=0;
  color[] colors={#ffffff,#f1f1f1,#e0e0e0,#939393,#4e4e4e};
  for(int line=0;line<Height/2;line+=lineSize+3){
    lineSize=random(4,Width/3);
    for(int col=0; col<Width/2;col+=colSize) {
      colSize=random(4,Height/3);
      if(col+colSize>Width/2){
        colSize=Width/2-col;
      }
      if(line+lineSize>Height/2){
        lineSize=Height/2-line;
      }
      float radian=radians(angle);
      color rectColor=colors[int(random(colors.length))];
      fill(rectColor);
      rect(col+300*cos(radian),line+300*sin(radian),colSize,lineSize);
      a=random(1);
      b=random(1);
      if(a<0.5){
      rect(col+300*cos(radian),line+300*sin(radian),colSize,lineSize*b);
      }
      strokeWeight(3);
      stroke(#000000);
    }
  }
}
