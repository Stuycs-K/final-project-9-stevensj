//Always moves downward, creates pyramids and sinks in liquids
public class MovableSolid extends Element{
  
  public MovableSolid(){
    super(color(222, 186, 42),"MOVABLE_SOLID") ;
  }
  public MovableSolid(color Ecolor, String newName){
    super(Ecolor, newName) ;
  }

  public void move(ElementMatrix env, int x, int y){ 
    super.move(env,x,y) ;
    if((env.isEmpty(y+1,x) || env.get(y+1,x) instanceof Liquid)){
      env.swap(y,x,y+1,x) ;
    }else{
      if(((int)random(2) == 1)&&((env.isEmpty(y+1,x+1) || env.get(y-1,x) instanceof Liquid)){
        env.swap(y,x,y+1,x+1) ;
      }
      if(((int)random(2) == 0)&&((env.isEmpty(y+1,x-1) || env.get(y-1,x) instanceof Liquid))){
        env.swap(y,x,y+1,x-1) ;
      }
    }
  }
        
    
    
}
