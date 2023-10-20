//declare bacteria variables here
boolean activeMousetrack=false;
double time=0;
Bacteria[] colony;
int numGone=0;
void setup()   
{     
  size(600,650);
  //initialize bacteria variables here
  colony=new Bacteria[500];
  for(int i=0;i<colony.length-1;i++)
    colony[i]=new Bacteria();
}   
void draw()   
{    
  background(0);
  time+=0.016;
  for(int i=0;i<colony.length-1;i++){
    colony[i].show();
    colony[i].move();
    colony[i].disappear();
  }
  stroke(255);
  fill(0);
  ellipse(mouseX,mouseY,20,20);
  stroke(0);
  fill(255);
  rect(0,600,600,50);
  fill(0);
  textAlign(CENTER);
  textSize(16);
  text("Time: "+(int)time+" seconds",300,630);
  System.out.println(numGone);
}  
void keyPressed()
{
  if(key=='r'||key=='R'){
    colony=new Bacteria[500];
    for(int i=0;i<colony.length-1;i++)
      colony[i]=new Bacteria();
    time=0;
    redraw();
  }
  if((key=='n'||key=='N')&& activeMousetrack==true){
    activeMousetrack=false;
  }
  if((key=='m'||key=='M')&& activeMousetrack==false){
    activeMousetrack=true;
  }
}
class Bacteria    
{     
  int myX,myY,myColor;
  boolean notBlack;
  Bacteria(){
    myX=(int)(Math.random()*600);
    myY=(int)(Math.random()*600);
    myColor=color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    notBlack=true;
  }
  void show(){
    fill(myColor);
    ellipse(myX,myY,10,10);
  }
  void move(){
    if(notBlack==true){
      myX=myX+(int)(Math.random()*5)-2;
      myY=myY+(int)(Math.random()*5)-2;
    }
    if(myX<=16){
      myX=16;
      fill(255);
      quad(0,0,8,8,8,592,0,600);
    }
    if(myY<=16){
      myY=16;
      fill(255);
      quad(0,0,8,8,592,8,600,0);
    }
    if(myX>=584){
      myX=584;
      fill(255);
      quad(600,0,592,8,592,592,600,600);
    }
    if(myY>=584 && myY!=650){
      myY=584;
      fill(255);
      quad(0,600,8,592,592,592,600,600);
    }
    if(notBlack==true && mouseX>=2 && mouseX<=598 && mouseY>=2 && mouseY<=598 && activeMousetrack==true){
      if(mouseX>myX)
        myX=myX+(int)(Math.random()*7)-1;
      else if(mouseX<myX)
        myX=myX+(int)(Math.random()*7)-5;
      if(mouseY>myY)
        myY=myY+(int)(Math.random()*7)-1;
      else if(mouseY<myY)
        myY=myY+(int)(Math.random()*7)-5;
    }
  }
  void disappear(){
    if(dist((float)myX,(float)myY,mouseX,mouseY)<=8){
      myX=300;
      myY=650;
      notBlack=false;
      myColor=color(0);
    }
    for(int i=0;i<colony.length-1;i++){
      if(colony[i].notBlack==false && colony[i].myX==300 && colony[i].myY==650)
        numGone=numGone+1;
    }
  }
}
