public class Smoke extends Gas{
  
  public Smoke(){
    super(color(38),"SMOKE") ;
  }
  public void move(ElementMatrix env, int x, int y){
    if(this.age > 150){
      env.die(y,x) ;
    }else{
    super.move(env, x, y) ;
    }
  }
}
