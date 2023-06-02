//Immovable Elements that can still interact with the environment
public class ImmovableSolid extends Element{
  
  public ImmovableSolid(){
    super(color(34, 255, 0),"IMMOVABLE_OBJECT") ;
  }
  public ImmovableSolid(color Ecolor, String newName){
    super(Ecolor, newName) ;
  }
  public void move(ElementMatrix env, int x, int y){
    super.move(env,x,y) ;
  }
}
