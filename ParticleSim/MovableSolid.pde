public class MovableSolid extends Element{
  
  public MovableSolid(){
    super() ;
    setEColor(color(222, 186, 42)) ;
    setEName("MOVABLE_SOLID") ;
  }
  
  public void move(ElementMatrix env, int x, int y){
    if(!this.moved){
    if(env.isEmpty(y+1,x)){
      env.swap(y,x,y+1,x) ;
      this.moved = true ;
    }else{
      int result = ParticleSim.rng(2) ;
      if((result == 0)&&(env.isEmpty(y+1,x-1))){
        env.swap(y,x,y+1,x+1) ;
        this.moved = true ;
      }
      if((result == 1)&&(env.isEmpty(y+1,x+1))){
        env.swap(y,x,y+1,x+1) ;
        this.moved = true ;
      }
    }
    }
  }
        
    
    
}
