public class Steam extends Gas{
  
  public Steam(){
    super(color(192, 218, 235),"STEAM") ;
    this.setTemp(100) ;
  }
  public void move(ElementMatrix env, int x, int y){
    if(this.getTemp() < 100){
      Water e = new Water() ;
      e.setTemp(this.getTemp()) ;
      env.change(y,x,e) ;
    }else{
    super.move(env, x, y) ;
    }
  }
}
