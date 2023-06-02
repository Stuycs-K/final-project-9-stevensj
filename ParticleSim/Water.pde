public class Water extends Liquid{
  
  public Water(){
    super(color(0, 153, 255),"WATER") ;
    this.setHeatCapacity(4.18) ;
  }
  
  public void move(ElementMatrix env, int x, int y){
    if(this.getTemp() >= 100){
      Steam e = new Steam() ;
      e.setTemp(this.getTemp()) ;
      env.change(y,x,e) ;
    }else
    if(this.getTemp() <= 0){
      Ice e = new Ice() ;
      e.setTemp(this.getTemp()) ;
      env.change(y,x,e) ;
    }else{
    super.move(env, x, y) ;
    }
  }
}
