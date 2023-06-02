public class MoltenIron extends Liquid{
  
  public MoltenIron(){
    super(color(255, 120, 87),"MOLTENIRON") ;
    this.setHeatCapacity(0.46) ;
  }
  
  public void move(ElementMatrix env, int x, int y){
    if(this.getTemp() <= 1538){
      Iron e = new Iron() ;
      e.setTemp(this.getTemp()) ;
      env.change(y,x,e) ;
    }else{
    super.move(env, x, y) ;
    }
  }
}
