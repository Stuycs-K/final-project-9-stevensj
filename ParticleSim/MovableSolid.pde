public class MovableSolid extends Element{
  
  public MovableSolid(){
    super(color(222, 186, 42),"MOVABLE_SOLID") ;
  }

  public void move(ElementMatrix env, int x, int y){
    if(env.MovSolMoveCheck(y+1,x)){
      env.swap(y,x,y+1,x) ;
      this.moved = true ;
    }else{
      //int result = (int)random(2) ;//ParticleSim.rng(3) ;
      if(((int)random(2) == 1)&&(env.MovSolMoveCheck(y+1,x+1))){
        env.swap(y,x,y+1,x+1) ;
      }
      if(((int)random(2) == 0)&&(env.MovSolMoveCheck(y+1,x-1))){
        env.swap(y,x,y+1,x-1) ;
      }
    }
  }
        
    
    
}
