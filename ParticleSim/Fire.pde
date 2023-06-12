public class Fire extends Element{
  public boolean fromSolid ;
  private boolean infinite = false;
  public Fire(boolean wasSolid){
    super(color(255, 144, 59),"FIRE") ;
    this.setTemp(1200) ;
    fromSolid = wasSolid ;
    this.setHeatCapacity(10) ;
  }
  public Fire(int infiniteMark){
    super(color(255, 144, 59),"FIRE") ;
    this.setTemp(1200) ;
    fromSolid = false;
    infinite = true ;
    this.setHeatCapacity(10) ;
  }
  
  public void move(ElementMatrix env, int x, int y){
    if(this.age > random(100,250) && !infinite){
      if(fromSolid){
        if(((int)random(5) == 3 || (int)random(5) == 4)){
          Charcoal e = new Charcoal() ;
          env.change(y,x,e) ;
        }
      }else
      {
        env.die(y,x) ;
      }
    }else{
    if(ticks % 10 == 0){
      this.setFire(env,x,y) ;
      this.spawnFire(env,x,y) ;
      this.extinguish(env,x,y) ;
    }
    super.move(env,x,y) ;
    this.setTemp(this.getTemp() + 1) ;
    }
  }
  
  public void spawnFire(ElementMatrix env, int x, int y){
        FireFloat e1 = new FireFloat() ;
        env.set(y,x+1,e1) ;
        elementsPresent.add(e1) ;
        FireFloat e2 = new FireFloat() ;
        env.set(y,x-1,e2) ;
        elementsPresent.add(e2) ;
        FireFloat e3 = new FireFloat() ;
        env.set(y-1,x,e3) ;
        elementsPresent.add(e3) ;
        FireFloat e4 = new FireFloat() ;
        env.set(y+1,x,e4) ;
        elementsPresent.add(e4) ;
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
