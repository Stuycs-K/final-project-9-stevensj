public class Wood extends ImmovableSolid{
  
  public Wood(){
    super(color(140, 108, 52),"WOOD") ;
    this.flammable = true ;
  }
  
  public void move(ElementMatrix env, int x, int y){
    if(this.getTemp() > 20){
      this.setEColor(color(140+this.getTemp()/10,108+this.getTemp()/100,52+this.getTemp()/200)) ;
    }
    if(this.getTemp() > 250){
      Fire e = new Fire(true) ;
      e.setTemp(this.getTemp()) ;
      env.change(y,x,e) ;
    }else{
    super.move(env, x, y) ;
    }
  }
  
}
