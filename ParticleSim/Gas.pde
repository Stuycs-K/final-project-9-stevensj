public class Gas extends Element{
  public boolean moved = false;
  private int lastTick = 0 ;
  public Gas(){
    super(color(255,0,0), "GAS") ;
  }
  
  public Gas(color Ecolor, String newName){
    super(Ecolor, newName) ;
  }
  
  public void move(ElementMatrix env, int x, int y){
    super.move(env,x,y) ;
    if(lastTick != ticks){
      moved = false ;
    }
    if(!moved){
      if(((int)random(4) == 1 || (int)random(4) == 2)&&(env.isEmpty(y-1,x) || env.get(y-1,x) instanceof Liquid)){
        env.swap(y,x,y-1,x) ;
        lastTick = ticks ;
        moved = true ;
      }else
      if(((int)random(4) == 3)&&(env.isEmpty(y-1,x-1) || env.get(y-1,x-1) instanceof Liquid)){
        env.swap(y,x,y-1,x-1) ;
        lastTick = ticks ;
        moved = true ;
      }else
      if(((int)random(4) == 0)&&(env.isEmpty(y-1,x+1) || env.get(y-1,x+1) instanceof Liquid)){
        env.swap(y,x,y-1,x+1) ;
        lastTick = ticks ;
        moved = true ;
      }else
      if(((int)random(2) == 0)&&(env.isEmpty(y,x-1))){
        env.swap(y,x,y,x-1) ;
        lastTick = ticks ;
        moved = true ;
      }else
      if(((int)random(2) == 1)&&(env.isEmpty(y,x+1))){
        env.swap(y,x,y,x+1) ;
        lastTick = ticks ;
        moved = true ;
      }else
      if(((int)random(5) == 1 || (int)random(5) == 2)&&(env.isEmpty(y+1,x-1))){
        env.swap(y,x,y+1,x-1) ;
        lastTick = ticks ;
        moved = true ;
      }else
      if(((int)random(5) == 3 || (int)random(5) == 4)&&(env.isEmpty(y+1,x+1))){
        env.swap(y,x,y+1,x+1) ;
        lastTick = ticks ;
        moved = true ;
      }else
      if(((int)random(5) == 0)&&(env.isEmpty(y+1,x))){
        env.swap(y,x,y+1,x) ;
        lastTick = ticks ;
        moved = true ;
      }
    }
  }
  
}
