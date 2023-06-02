public class Iron extends ImmovableSolid{
  
    public Iron(){
    super(color(110),"IRON") ;
    this.setHeatCapacity(0.451) ;
  }
  public void move(ElementMatrix env, int x, int y){
    if(this.getTemp() > 20){
      this.setEColor(color(110+this.getTemp()/10,110+this.getTemp()/100,110+this.getTemp()/200)) ;
    }
    if(this.getTemp() > 1538){
      MoltenIron e = new MoltenIron() ;
      e.setTemp(this.getTemp()) ;
      env.change(y,x,e) ;
    }else{
    super.move(env, x, y) ;
    }
  }
}
