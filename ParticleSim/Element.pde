public class Element{
  //Temperature will be defined in terms of celsius to simplify future phase changes
  private float temp ;
  private color elementColor;
  private String name ;
  private float heatCapacity ;
  private int age ;
  private int EX ;
  private int EY ;
  
  public Element(){
    temp = 20 ;
    elementColor = color(0) ;
    name = "EMPTY" ;
    heatCapacity = 1 ;
  }
  public Element(color Ecolor, String newName){
    temp = 20 ;
    elementColor = Ecolor ;
    name = newName ;
    heatCapacity = 1 ;
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
  
  public float getTemp(){
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
  
  
  public void move(ElementMatrix env, int x, int y){
    age++ ;
    try{
      env.get(y,x).conduct(env.get(y,x+1)) ;
    }catch(NullPointerException e){
    }
    try{
      env.get(y,x).conduct(env.get(y,x-1)) ;
    }catch(NullPointerException e){
    }
    try{
      env.get(y,x).conduct(env.get(y-1,x)) ;
    }catch(NullPointerException e){
    }
    try{
      env.get(y,x).conduct(env.get(y+1,x+1)) ;
    }catch(NullPointerException e){
    }
    
    
  }
  
  public void heat(float amt){
    temp += amt ;
  }
  public void setTemp(float newTemp){
    temp = newTemp ;
  }
  public void conduct(Element other){
    if(ticks % 3 == 0){
    if(temp < other.temp){
      temp+= other.heatCapacity / heatCapacity ;
      other.temp-= heatCapacity / other.heatCapacity ;
    }
    }
  }
  public void setHeatCapacity(float amt){
    heatCapacity = amt ;
  }
  
  public String toString(){
    return name + ", " + temp + "C  " + age  ;
  }
  public String toStringProper(){
    return name ;
  }
}
