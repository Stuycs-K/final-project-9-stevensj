public class Water extends Liquid{
  
  public Water(){
    super(color(0, 153, 255),"WATER") ;
  }
  
  public void move(ElementMatrix env, int x, int y){
    if(this.getTemp() >= 100){
      Steam e = new Steam() ;
      env.change(y,x,e) ;
    }else
    if(this.getTemp() <= 0){
      Ice e = new Ice() ;
      env.change(y,x,e) ;
    }else{
    super.move(env, x, y) ;
    }
  }
}
