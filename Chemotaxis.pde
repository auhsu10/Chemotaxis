//declare variables here
boolean activeMousetrack=false;
double time=0;
Bacteria[] colony;
int numGone=0;
int sumBlackdots=0;
double timeFinal=0;
void setup()   
{
  background(0,0.999);
  size(600,650);
  //initialize bacteria variables here
  colony=new Bacteria[501];
  for(int i=0;i<colony.length-1;i++)
    colony[i]=new Bacteria();
}   
void draw()
{    
  sumBlackdots=0;

  time+=0.016;
  for(int i=0;i<colony.length-1;i++){
    colony[i].show();
    colony[i].move();
    colony[i].disappear();
    sumBlackdots=sumBlackdots+colony[i].notBlack;
  }
  stroke(255);
  fill(0);
  ellipse(mouseX,mouseY,20,20);
  stroke(0);
  fill(255);
  rect(0,600,600,50);
  fill(0);
  textAlign(CENTER);
  textSize(22);
  if(sumBlackdots<=500)
    text("Time: "+(int)time+" seconds",150,630);
    text("Number of dots left: "+(500-sumBlackdots),425,630);
  if(sumBlackdots==500){
    fill(255);
    rect(0,600,600,100);
    timeFinal=time;
    time=time-0.016;
    fill(220,185,15);
    text("Time: "+(int)timeFinal+" seconds",300,630);
    fill(0);
    rect(50,250,500,80);
    fill(255);
    textSize(40);
    text("Game Over! Press r to reset.",300,300);
  }
}  
void keyPressed()
{
  if(key=='r'||key=='R'){
    colony=new Bacteria[501];
    for(int i=0;i<colony.length-1;i++)
      colony[i]=new Bacteria();
    time=0;
    background(0,0.1);
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
  int notBlack;
  Bacteria(){
    myX=(int)(Math.random()*600);
    myY=(int)(Math.random()*600);
    myColor=color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    notBlack=0;
  }
  void show(){
    fill(myColor);
    ellipse(myX,myY,10,10);
  }
  void move(){
    if(notBlack==0){
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
    if(notBlack==0 && mouseX>=2 && mouseX<=598 && mouseY>=2 && mouseY<=598 && activeMousetrack==true){
      if(mouseX>myX)
        myX=myX+(int)(Math.random()*5)-1;
      else if(mouseX<myX)
        myX=myX+(int)(Math.random()*5)-3;
      if(mouseY>myY)
        myY=myY+(int)(Math.random()*5)-1;
      else if(mouseY<myY)
        myY=myY+(int)(Math.random()*5)-3;
    }
  }
  void disappear(){
    if(dist((float)myX,(float)myY,mouseX,mouseY)<=8){
      myX=300;
      myY=650;
      notBlack=1;
      myColor=color(0);
    }
  }
}
