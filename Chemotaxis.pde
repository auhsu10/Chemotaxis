//declare bacteria variables here
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
class Bacteria    
{     
  int myX,myY,myColor;
  Bacteria(){
    myX=myY=300;
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
    myX=myX+(int)(Math.random()*25)-12;
    myY=myY+(int)(Math.random()*25)-12;
  }
}    
