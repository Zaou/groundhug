class Clock
{
  int i,j,x,y;
  PImage clock;
  Clock()
  {
    clock=loadImage("img/clockR.png");
    j=floor(random(19)+1);
    i=floor(random(50)+1);
    while (soil[j][i].soilK==4)
    {
      j=floor(random(19)+1);
      i=floor(random(50)+1);
    }
    x=80*(j-1);
    y=170+80*(i-1);
  }
  void display()
  {
    image(clock,x,y,80,80);
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