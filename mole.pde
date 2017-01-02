PImage bg;
PImage[] soilC=new PImage[5],robotI=new PImage[2];
int[] powertime= new int[15];
int soilKind;
Soil[][] soil=new Soil[21][60];
Groundhog groundhog;
Robot[] robot=new Robot[30];
Base base;
Power[] power=new Power[15];
Clock[] clock=new Clock[15];
float bgTran;
void setup ()
{
  size(800, 600);
  bg = loadImage( "img/bg.jpg" ); 
  soilC[0]=loadImage( "img/yellow1.png" ); 
  soilC[1]=loadImage( "img/brown1.png" ); 
  soilC[2]=loadImage( "img/grey1.png" ); 
  soilC[3]=loadImage( "img/black1.png" );
  soilC[4]=loadImage( "img/yellow2.png" );
  robotI[0]=loadImage( "img/robot0.png" );
  robotI[1]=loadImage( "img/robot1.png" );
  for (int i=1; i<60; i++)
  {
    for (int j=1; j<21; j++)
    {
      soil[j][i]=new Soil(j,i,floor(random(3)+1));
    }
  }
  for(int i=0;i<30;i++)
  {
    robot[i]=new Robot();
  }
  for(int i=0;i<15;i++)
  {
    power[i]=new Power();
    clock[i]=new Clock();
  }
  base= new Base();
  groundhog=new Groundhog();
}

void draw ()
{
    image(bg, 0, 0, 800,600);
    pushMatrix();
    translate(-(groundhog.bgTran-360),-(groundhog.Y-90));
    for(int i=0;i<3;i++)
    {
      image(bg,i*800,0);  
    }
    for (int i=1; i<60; i++)
    {
      for (int j=1; j<21; j++)
      {
        soil[j][i].display();
      }
    }
    
    for(int i=0;i<30;i++)
    {
      robot[i].shootdisplay();
      robot[i].display();
      if(robot[i].hit())
      {
        base.life--;
      }
    }
    for(int i=0;i<30;i++)
    {
      robot[i].display();
    }
    for(int i=0;i<15;i++)
    {
      power[i].display();
      if(power[i].hit())
      {
         power[i].everhit=true;
         powertime[i]=base.time.minute*60+base.time.secondTens*10+base.time.secondOnes;
         println(base.time.minute,base.time.secondTens,base.time.secondOnes);
         groundhog.digSpeed=groundhog.digSpeed*5;
         power[i].i=0;
         power[i].j=0;
         power[i].x=-80;
         power[i].y=-80;
      }
      if(powertime[i]-(base.time.minute*60+base.time.secondTens*10+base.time.secondOnes)>=5&&power[i].everhit)
      {
        println(powertime[i],base.time.minute,base.time.secondTens,base.time.secondOnes,'h');
        power[i].everhit=false;
        groundhog.digSpeed=groundhog.digSpeed/5;
      }
      clock[i].display();
      if(clock[i].hit())
      {
         base.time.secondOnes=base.time.secondOnes+5;
         clock[i].i=0;
         clock[i].j=0;
         clock[i].x=-80;
         clock[i].y=-80;
      }
    }
    popMatrix();
    groundhog.display();
    base.display();
    println(groundhog.digSpeed);
}
void keyPressed() 
{
  groundhog.keyPressed(keyCode) ;
}
void keyReleased() 
{
  groundhog.keyReleased(keyCode) ;
}