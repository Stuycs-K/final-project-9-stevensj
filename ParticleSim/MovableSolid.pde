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
      int result = (int)random(0,2) ;//ParticleSim.rng(3) ;
      if((result == 1)&&(env.isEmpty(y+1,x+1))){
        env.swap(y,x,y+1,x+1) ;
        this.moved = true ;
      }
      if((result == 2)&&(env.isEmpty(y+1,x-1))){
        env.swap(y,x,y+1,x+1) ;
        this.moved = true ;
      }
      
    }
    }
  }
        
    
    
}
