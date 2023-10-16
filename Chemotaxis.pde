//declare bacteria variables here
boolean activeMousetrack=false;
boolean xLeft=false;
boolean xRight=false;
boolean yUp=false;
boolean yDown=false;
Bacteria[] colony;
void setup()   
{     
  size(600,600);
  //initialize bacteria variables here
  colony=new Bacteria[500];
  for(int i=0;i<colony.length-1;i++)
    colony[i]=new Bacteria();
}   
void draw()   
{    
  background(0);
  for(int i=0;i<colony.length-1;i++){
    colony[i].show();
    colony[i].move();
  }
}  
//void mousePressed()
//{
//  cumulativeSum+=roundSum;
//  redraw();
//  roundSum=0;
//  numRolls+=1;
//}
void keyPressed()
{
  if(key=='r'||key=='R'){
    colony=new Bacteria[500];
    for(int i=0;i<colony.length-1;i++)
      colony[i]=new Bacteria();
    redraw();
  }
  if((key=='n'||key=='N')&& activeMousetrack==true){
    activeMousetrack=false;
  }
  if((key=='m'||key=='M')&& activeMousetrack==false){
    activeMousetrack=true;
  }
  //if(keyCode==32){
  //  cumulativeSum+=roundSum;
  //  redraw();
  //  roundSum=0;
  //  numRolls+=1;
  //}
}
class Bacteria    
{     
  int myX,myY,myColor;
  Bacteria(){
    myX=(int)(Math.random()*600);
    myY=(int)(Math.random()*600);
    myColor=color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  }
  void show(){
    fill(myColor);
    ellipse(myX,myY,10,10);
  }
  void move(){
    myX=myX+(int)(Math.random()*15)-7;
    myY=myY+(int)(Math.random()*15)-7;
    if(myX<=16){
      myX=16;
      if(myX<20)
        xLeft=true;
      fill(255);
      quad(0,0,8,8,8,592,0,600);
    }
    if(myY<=16){
      myY=16;
      if(myY<20)
        yUp=true;
      fill(255);
      quad(0,0,8,8,592,8,600,0);
    }
    if(myX>=584){
      myX=584;
      if(myX>580)
        xRight=true;
      fill(255);
      quad(600,0,592,8,592,592,600,600);
    }
    if(myY>=584){
      myY=584;
      if(myY>580)
        yDown=true;
      fill(255);
      quad(0,600,8,592,592,592,600,600);
    }
    if(dist((float)myX,(float)myY,mouseX,mouseY)>0 && activeMousetrack==true){
      myX=myX+(mouseX-300)/50;
      myY=myY+(mouseY-300)/50;
    }
  }
}
