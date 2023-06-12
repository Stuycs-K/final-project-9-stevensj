public class FireFloat extends Gas{
  
  public FireFloat(){
    super(color(255, 144, 59),"FIREFLOAT") ;
    this.setTemp(1200) ;
    this.setHeatCapacity(10) ;
  }
  public void move(ElementMatrix env, int x, int y){
    if(this.age > 100){
      Smoke e = new Smoke() ;
      e.setTemp(this.getTemp()) ;
      env.change(y,x,e) ;
    }else{
    if(ticks % 18 == 0){
      this.setFire(env,x,y) ;
      this.extinguish(env,x,y) ;
    }
    super.move(env, x, y) ;
    }
  }
  public void setFire(ElementMatrix env, int x, int y){
    try{
      if(env.get(y,x+1).flammable){
        Fire e = new Fire(env.get(y,x+1) instanceof ImmovableSolid || env.get(y,x+1) instanceof MovableSolid) ;
        env.change(y,x+1,e) ;
      }
    }catch(NullPointerException e){
    }
    try{
      if(env.get(y,x-1).flammable){
        Fire e = new Fire(env.get(y,x-1) instanceof ImmovableSolid || env.get(y,x-1) instanceof MovableSolid) ;
        env.change(y,x-1,e) ;
      }
    }catch(NullPointerException e){
    }
    try{
      if(env.get(y-1,x).flammable){
        Fire e = new Fire(env.get(y-1,x) instanceof ImmovableSolid || env.get(y-1,x) instanceof MovableSolid) ;
        env.change(y-1,x,e) ;
      }
    }catch(NullPointerException e){
    }
    try{
      if(env.get(y+1,x).flammable){
        Fire e = new Fire(env.get(y+1,x) instanceof ImmovableSolid || env.get(y+1,x) instanceof MovableSolid) ;
        env.change(y+1,x,e) ;
      }
    }catch(NullPointerException e){
    }
  }
  public void extinguish(ElementMatrix env, int x, int y){
    try{
      if(env.get(y,x-1) instanceof Water || env.get(y+1,x) instanceof Steam){
        env.die(y,x) ;
      }
    }catch(NullPointerException e){
    }
    try{
      if(env.get(y,x+1) instanceof Water || env.get(y+1,x) instanceof Steam){
        env.die(y,x) ;
      }
    }catch(NullPointerException e){
    }
    try{
      if(env.get(y-1,x) instanceof Water || env.get(y+1,x) instanceof Steam){
        env.die(y,x) ;
      }
    }catch(NullPointerException e){
    }
    try{
      if(env.get(y+1,x) instanceof Water || env.get(y+1,x) instanceof Steam){
        env.die(y,x) ;
      }
    }catch(NullPointerException e){
    }
  }
}
