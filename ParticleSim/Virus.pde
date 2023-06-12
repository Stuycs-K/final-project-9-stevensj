public class Virus extends Liquid{
    
  public Virus(){
    super(color(136, 0, 255),"VIRUS") ;
    this.setHeatCapacity(0.83) ;
  }
  public void move(ElementMatrix env, int x, int y){
    if(this.age > random(300,400)){
      env.die(y,x) ;
    }else{
    this.infect(env,x,y) ;
    super.move(env, x, y) ;
    }
  }
  
  public void infect(ElementMatrix env, int x, int y){
    try{
      if(!(env.isEmpty(y,x+1))&&!(env.get(y,x+1) instanceof Virus)&&!(env.get(y,x+1) instanceof VirusSolid)){
        VirusSolid e = new VirusSolid() ;
        env.change(y,x+1,e) ;
      }
    }catch(NullPointerException e){
    }
    try{
      if(!(env.isEmpty(y,x-1))&&!(env.get(y,x-1) instanceof Virus)&&!(env.get(y,x-1) instanceof VirusSolid)){
        VirusSolid e = new VirusSolid() ;
        env.change(y,x-1,e) ;
      }
    }catch(NullPointerException e){
    }
    try{
      if(!(env.isEmpty(y-1,x))&&!(env.get(y-1,x) instanceof Virus)&&!(env.get(y-1,x) instanceof VirusSolid)){
        VirusSolid e = new VirusSolid() ;
        env.change(y-1,x,e) ;
      }
    }catch(NullPointerException e){
    }
    try{
      if(!(env.isEmpty(y+1,x))&&!(env.get(y+1,x) instanceof Virus)&&!(env.get(y+1,x) instanceof VirusSolid)){
        VirusSolid e = new VirusSolid() ;
        env.change(y+1,x,e) ;
      }
    }catch(NullPointerException e){
    }
  }
}
