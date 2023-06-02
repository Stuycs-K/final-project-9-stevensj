public class Sand extends MovableSolid{
  
  public Sand(){
    super(color(237, 228, 147),"SAND") ;
    this.setHeatCapacity(0.83) ;
  }
  public void move(ElementMatrix env, int x, int y){
    if(this.getTemp() > 0){
      this.setEColor(color(237+this.getTemp()/10,228+this.getTemp()/100,147+this.getTemp()/200)) ;
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
