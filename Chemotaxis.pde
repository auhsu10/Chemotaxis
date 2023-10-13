//declare bacteria variables here
boolean activeMousetrack=false;
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
    myColor=(int)(Math.random()*3);
  }
  void show(){
    if(myColor==0){
      fill(255,0,0);
    }
    else if(myColor==1){
      fill(0,255,0);
    }
    else if(myColor==2){
      fill(0,0,255);
    }
    ellipse(myX,myY,15,15);
  }
  void move(){
    myX=myX+(int)(Math.random()*15)-7;
    myY=myY+(int)(Math.random()*15)-7;
    if(myX<=8)
      myX=8;
    if(myY<=8)
      myY=8;
    if(myX>=592)
      myX=592;
    if(myY>=592)
      myY=592;
    if(dist((float)myX,(float)myY,mouseX,mouseY)>0 && activeMousetrack==true){
      myX=myX+(mouseX-300)/50;
      myY=myY+(mouseY-300)/50;
    }
  }
}    
