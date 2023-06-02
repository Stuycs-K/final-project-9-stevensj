public class Glass extends ImmovableSolid{
  
    public Glass(){
    super(color(150),"Glass") ;
    this.setHeatCapacity(0.84) ;
  }
  public void move(ElementMatrix env, int x, int y){
    if(this.getTemp() > 0){
      this.setEColor(color(150+this.getTemp()/20,150+this.getTemp()/100,150+this.getTemp()/200)) ;
    }
    if(this.getTemp() > 1700){
      MoltenGlass e = new MoltenGlass() ;
      e.setTemp(this.getTemp()) ;
      env.change(y,x,e) ;
    }else{
    super.move(env, x, y) ;
    }
  }
}
