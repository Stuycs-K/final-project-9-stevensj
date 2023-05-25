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
    for(int i = x ; i < 10 ; i++){
      for(int k = y ; k < 10 ; k++){
        set(i,k,elementColor) ;
      }
    }
  }
  
  public void setEColor(color eColor){
    elementColor = eColor ;
  }
  public void setEName(String newName){
    name = newName ;
  }
  
  public int getTemp(){
    return temp ;
  }
  
  public String toString(){
    return name + ", " + temp + "C" ;
  }
}
