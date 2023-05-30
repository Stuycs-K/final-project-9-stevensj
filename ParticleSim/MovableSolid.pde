public class MovableSolid extends Element{
  
  public MovableSolid(){
    super(color(222, 186, 42),"MOVABLE_SOLID") ;
  }

  public boolean move(ElementMatrix env, int x, int y){
    return this.move(env, x, y, 1) ;
  }
  public boolean move(ElementMatrix env, int x, int y, int speed){
    
    if(env.MovSolMoveCheck(y+1,x)){
      env.moveExtended(y,x,y+speed,x,0) ;
      //this.setPosition(x,y+speed) ;
      return true ;
    }else{
      //int result = (int)random(2) ;//ParticleSim.rng(3) ;
      if(((int)random(2) == 1)&&(env.MovSolMoveCheck(y+1,x+1))){//&&(env.MovSolMoveCheck(y+1,x+1))
        env.moveExtended(y,x,y+speed,x+speed,0) ;
        //this.setPosition(x+speed,y+speed) ;
        //println("right") ;
        return true ;
      }
      if(((int)random(2) == 0)&&(env.MovSolMoveCheck(y+1,x-1))){//&&(env.MovSolMoveCheck(y+1,x-1))
        env.moveExtended(y,x,y+speed,x-speed,0) ;
        //this.setPosition(x-speed, y+speed) ;
        return true ;
      }
    }
    return false ;
  }
        
    
    
}
