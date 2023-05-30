public class Element{
  //Temperature will be defined in terms of celsius to simplify future phase changes
  private int temp ;
  private color elementColor;
  private String name ;
  private int EX ;
  private int EY ;
  
  public Element(){
    temp = 20 ;
    elementColor = color(0) ;
    name = "EMPTY" ;
  }
  public Element(color Ecolor, String newName){
    temp = 20 ;
    elementColor = Ecolor ;
    name = newName ;
  }
  
  public void pixelDraw(int x, int y){
    for(int i = x ; i < x+10 ; i++){
      for(int k = y ; k < y+10 ; k++){
        set(i,k,elementColor) ;
      }
    }
        //println("drawn" + this.toString()) ;
  }
  
  public void pixelDraw(){
    for(int i = EX*10 ; i < i+10 ; i++){
      for(int k = EX*10 ; k < k+10 ; k++){
        set(i,k,elementColor) ;
        println("drawn" + this.toString()) ;
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
  
  
    
   
  public void setPosition(int x, int y){
    EX = x ;
    EY = y ;
  }
  
  public int eX(){
    return EX ;
  }
  public int eY(){
    return EY ;
  }
  
  
  public boolean move(ElementMatrix env, int x, int y){
    return true ;
  }
  
  
  
  public String toString(){
    return name + ", " + temp + "C" ;
  }
}
