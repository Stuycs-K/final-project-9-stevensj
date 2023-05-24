public class Element{
  //Temperature will be defined in terms of celsius to simplify future phase changes
  private int temp ;
  private color elementColor;
  private String name ;
  
  public Element(){
    temp = 20 ;
    elementColor = color(0) ;
    name = "EMPTY" ;
  }
  
  public void pixelDraw(int x, int y){
    set(x,y,elementColor) ;
  }
  
  public void setEColor(color eColor){
    elementColor = eColor ;
  }
  
  public int getTemp(){
    return temp ;
  }
  
  public String toString(){
    return name + ", " + temp + "C" ;
  }
}
