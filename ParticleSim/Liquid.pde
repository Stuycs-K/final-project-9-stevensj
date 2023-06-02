public class Liquid extends Element{
  
  public Liquid(){
    super(color(111, 0, 255), "LIQUID") ;
  }
  public Liquid(color Ecolor, String newName){
    super(Ecolor, newName) ;
  }
  
  public void move(ElementMatrix env, int x, int y){
    super.move(env,x,y) ;
    if(env.isEmpty(y+1,x)){
      env.swap(y,x,y+1,x) ;
      //this.setPosition(x, y+1) ;
        //return true ;
    }
      if(((int)random(2) == 1)&&(env.isEmpty(y,x+1))){
        env.swap(y,x,y,x+1) ;
        //this.setPosition(x+1, y) ;
        //return true ;
      }
      if(((int)random(2) == 0)&&(env.isEmpty(y,x-1))){
        env.swap(y,x,y,x-1) ;
        //this.setPosition(x-1, y) ;
        //return true ;
      }
      //return false ;
  }
}
