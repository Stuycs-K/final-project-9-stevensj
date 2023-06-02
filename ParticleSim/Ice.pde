public class Ice extends ImmovableSolid{
    
  public Ice(){
    super(color(125, 222, 255),"ICE") ;
    this.setHeatCapacity(2.108) ;
    this.setTemp(0) ;
  }
  public void move(ElementMatrix env, int x, int y){
    if(this.getTemp() > 0){
      Water e = new Water() ;
      e.setTemp(this.getTemp()) ;
      env.change(y,x,e) ;
    }else{
    super.move(env, x, y) ;
    }
  }
}
