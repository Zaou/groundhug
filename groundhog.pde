class Groundhog
{
  float X=360, Y=90, Speed=10, digSpeed=2;
  float bgTran;
  int digTime=0, moveTime=0,digLRTime=0;
  PImage[] groundhog=new PImage[8];
  private boolean up = false ;
  private boolean down = false ;
  private boolean left = false ;
  private boolean right = false ;
  Groundhog()
  {
    for (int i=1; i<8; i++)
    {
      groundhog[i]=loadImage( "img/groundhog"+i+".png" );
    }
  }
  void display()
  {
    if (soil[J()][I()+1].soilK==0&&X==(J()-1)*80)
    {
      drop();
    } 
    else if (down==true)
    {
      dig();
    } 
    else if (right==true||left==true)
    {
      moveordig();
    }
    else
    {
      stand();
    }
  }
void stand()
{
  image(groundhog[1], displayX(), displayY(), 80, 80);
}
void dig()
{
  digTime++;
  if (digTime%6<3)
  { 
    image(groundhog[2], displayX(), displayY(), 80, 80);
  } else
  {
    image(groundhog[3], displayX(), displayY(), 80, 80);
  }
  soil[J()][I()+1].dig();
  digTime=digTime%500;
}
void drop()
{

  int Ybreak;
  if (I()<=4)
  {
    Ybreak=90+I()*40;
  } else
  {
    Ybreak=50+I()*80;
  }
  Y=Y+Speed;
  image(groundhog[1], displayX(), displayY(), 80, 80);
  if (displayY()>Ybreak)
  {
    return;
  }
}
void moveordig()
{
  if(I()==0)
  {
    move();
  }
  else 
  {
    if(right)
    {
      if(J()!=20)
      {
        if(soil[J()+1][I()].soilK==0||X%80!=0)
        {
          move();
        }
        else
        {
          digLR();
        }
      }
      else 
      {
        move();
      }
    }
    else if(left)
    {
      if(J()!=1)
      {
        if(soil[J()-1][I()].soilK==0||X%80!=0)
        {
          move();
        }
        else
        {
          digLR();
        }
      }
      else 
      {
        move();
      }
    }
  }
}
void digLR()
{
  digLRTime++;
  if(left)
  {
    soil[J()-1][I()].dig();
  }
  if(right)
  {
    soil[J()+1][I()].dig();
  }
  if (digLRTime%6<3)
  {
    digLRDisplay(6);
  } else
  {
    digLRDisplay(7);
  }
  digLRTime=digLRTime%500;
}
void digLRDisplay(int m)
{
  if (right)
  {
    pushMatrix();
    scale(-1, 1);
    image(groundhog[m], -displayX()-80, displayY(), 80, 80);
    popMatrix();
  } else
  {
    pushMatrix();
    scale(1, 1);
    image(groundhog[m], displayX(), displayY(), 80, 80);
    popMatrix();
  }
}
void move()
{
  moveTime++;
  if (right&&X+Speed<=1520)
  {
    X += Speed ;
  }
  if (left&&X-Speed>=0)
  {
    X -= Speed ;
  }
  if (moveTime%6<3)
  {
    moveDisplay(4);
  } else
  {
    moveDisplay(5);
  }
  moveTime=moveTime%500;
}
void moveDisplay(int m)
{
  if (right)
  {
    pushMatrix();
    scale(-1, 1);
    image(groundhog[m], -displayX()-80, displayY(), 80, 80);
    popMatrix();
  } else
  {
    pushMatrix();
    scale(1, 1);
    image(groundhog[m], displayX(), displayY(), 80, 80);
    popMatrix();
  }
}
int J()
{
  return int((X+40)/80)+1;
}
int I()
{
  if (Y<250)
  {
    return int((Y-90)/40);
  } else
  {
    return int((Y-90)/80)+2;
  }
}
float displayX()
{
  if (range())
  {
    return 360;
  } else
  {
    if (X<360)
    {
      return X;
    } 
    else
    {
      return X-800;
    }
  }
}
float displayY()
{
  if (Y<250)
  {
    return Y;
  } else
  {
    return 250;
  }
}
boolean range()
{
  if (X>=360&&X<=1160)
  {
    bgTran=X;
    return true;
  } else
  {
    if (X<360)
    {
      bgTran=360;
    } else
    {
      bgTran=1160;
    }
    return false;
  }
}
void keyPressed (int keyCode)
{
  switch (keyCode) 
  {
  case UP    : 
    up = true ;   
    break ;
  case DOWN  : 
    down = true ; 
    break ;
  case LEFT  : 
    left = true ; 
    break ;
  case RIGHT : 
    right = true ;
    break ;
  }
}
void keyReleased (int keyCode) {
  switch (keyCode) {
  case UP    : 
    up =    false ; 
    break ;
  case DOWN  : 
    down =  false ; 
    break ;
  case LEFT  : 
    left =  false ; 
    break ;
  case RIGHT : 
    right = false ; 
    break ;
  }
}
}
/*void dig2()
 {
 digTime++;
 if (digTime%4<2)
 {
 image(groundhog[2], displayX(), displayY(), 80, 80);
 } else
 {
 image(groundhog[3], displayX(), displayY(), 80, 80);
 }
 Y=Y-Speed;
 digTime=digTime%500;
 }*/