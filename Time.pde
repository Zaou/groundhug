class Time
{
  int minute, secondOnes, secondTens,times=0;
  Time()
  {
    minute=1;
    secondOnes=0;
    secondTens=3;
  }
  void timeChange()
  {
    frameRate(60);
    times++;
    if(times==15)
    {
      secondOnes--;
      times=0;
    }
    if (secondOnes>=10)
    {
      secondTens=secondTens+1;
      secondOnes=secondOnes-10;
    }
    if (secondTens>=6)
    {
      minute=minute+1;
      secondTens=secondTens-6;
    }
    if (secondOnes<0)
    {
      secondTens=secondTens-1;
      secondOnes=secondOnes+10;
    }
    if (secondTens<0)
    {
      minute=minute-1;
      secondTens=secondTens+6;
    }
  }
}