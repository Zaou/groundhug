class Power
{
  int i,j,x,y;
  PImage power;
  boolean everhit=false;
  Power()
  {
    power=loadImage("img/power.png");
    j=floor(random(19)+1);
    i=floor(random(50)+1);
    while (soil[j][i].soilK==4)
    {
      j=floor(random(19)+1);
      i=floor(random(50)+1);
    }
    everhit=false;
    x=80*(j-1);
    y=170+80*(i-1);
  }
  void display()
  {
    image(power,x,y,80,80);
  }
  boolean hit()
  {
    if(groundhog.J()==j&&groundhog.I()==i)
    {
      return true;
    }
    else 
    {
      return false;
    }
  }
}