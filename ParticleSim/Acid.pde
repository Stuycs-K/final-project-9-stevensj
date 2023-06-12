public class Acid extends Liquid{
  private int amountDest = 0 ;
  private int disCount = 3 ;
  public Acid(){
    super(color(162, 255, 0),"ACID") ;
    this.setHeatCapacity(2.18) ;
  }
  
  public void move(ElementMatrix env, int x, int y){
    if(amountDest >= 5){
      env.die(x,y) ;
      println("finished " + elementsPresent.size()) ;
    }else{
    if(disCount <= 0){
    this.disintigrate(env,x,y) ;
    disCount+=3 ;
    }else
    {
    super.move(env, x, y) ;
    disCount-- ;
    }
    }
  }
  public void disintigrate(ElementMatrix env, int x, int y){
  if(ticks % 10 == 0){
  if(env.isValid(y-1,x)&&!env.isEmpty(y-1,x)){
    if(!(env.get(y-1,x) instanceof Acid)){
      env.die(y-1,x) ;
      amountDest++ ;
  }
  }else
  if(env.isValid(y+1,x)&&!env.isEmpty(y+1,x)){
    if(!(env.get(y+1,x) instanceof Acid)){
      env.die(y+1,x) ;
      amountDest++ ;
  }
  }else
  if(env.isValid(y,x-1)&&!env.isEmpty(y,x-1)){
    if(!(env.get(y,x-1) instanceof Acid)){
      env.die(y,x-1) ;
      amountDest++ ;
  }
  }else
  if(env.isValid(y,x+1)&&!env.isEmpty(y,x+1)){
    if(!(env.get(y,x+1) instanceof Acid)){
      env.die(y,x+1) ;
      amountDest++ ;
  }
  }
  }
  }
  
}
