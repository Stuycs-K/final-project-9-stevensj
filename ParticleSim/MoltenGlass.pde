public class MoltenGlass extends Liquid{
  
  public MoltenGlass(){
    super(color(255, 150, 127),"MOLTENGLASS") ;
    this.setHeatCapacity(0.84) ;
  }
  
  public void move(ElementMatrix env, int x, int y){
    if(this.getTemp() <= 1700){
      Glass e = new Glass() ;
      e.setTemp(this.getTemp()) ;
      env.change(y,x,e) ;
    }else{
    super.move(env, x, y) ;
    }
  }
}
