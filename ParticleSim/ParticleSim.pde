ElementMatrix env ;
boolean mouseInterval ;
int mouseCountdown ;
String ElementChosen = "NONE";
static int MovSol = 81 ;
static int ImmovSol = 87 ;
static int Liq = 69 ;

void setup(){
  size(500,500) ;
  env = new ElementMatrix(3) ;
}

void draw(){
  drawPixels() ;
  movement() ;
  text(ElementChosen,35,40) ;
  if(mouseCountdown > 0){
    mouseCountdown-- ;
  }else{
    while(mouseInterval&& (mouseCountdown==0)){
  int mousex = mouseX/10 ;
  int mousey = mouseY/10 ;
  setParticle(mousex, mousey,key) ;
  System.out.println(env.get(mousey,mousex)) ;
  mouseCountdown += 1 ;
  }
  }
  println(mouseCountdown) ;
  
}

void drawPixels(){
  for(int y = 0 ; y < height-9 ; y+=10){
    for(int x = 0 ; x < width-9 ; x+=10){
      try{
        //System.out.println(env.get(y,x)) ;
        env.get(y/10,x/10).pixelDraw(x,y) ;
        //set(x,y,color(124,35,100)) ;
      }catch(NullPointerException e){
        for(int i = x ; i < x+10 ; i++){
      for(int k = y ; k < y+10 ; k++){
        set(i,k,color(0)) ;
      }
    }
      }
    }
  }
}

void movement(){
  for(int y = 0 ; y < height-9 ; y+=10){
    for(int x = 0 ; x < width-9 ; x+=10){
      try{
        //System.out.println(env.get(y,x)) ;
        env.get(y/10,x/10).move(env,x/10,y/10) ;
        //set(x,y,color(124,35,100)) ;
      }catch(NullPointerException e){
        
      }
    }
      }
      env.movementReset() ;
    }
  

  

void setParticle(int x, int y, int type){
  Element e = new Element();
  if(type == MovSol){
    e = new MovableSolid() ;
    env.set(y,x, e) ;
  }
  if(type == ImmovSol){
    e = new ImmovableSolid() ;
    env.set(y,x, e) ;
  }
  if(type == Liq){
    e = new Liquid() ;
    env.set(y,x, e) ;
  }
    ElementChosen = e.toString() ;
}

/*public static int rng(int possibilities){
    return random(1,possibilities) ;
    //return ((int)(Math.random()*100)+1) % possibilities ;
  }*/

void mousePressed(){
  mouseInterval = true ;
}
  /*//&& (mouseCountdown==0)
  while(mouseInterval){
  int mousex = mouseX/10 ;
  int mousey = mouseY/10 ;
  setParticle(mousex, mousey,-1) ;
  System.out.println(env.get(mousey,mousex)) ;
  mouseCountdown += 1 ;
  }
  
}*/
/*void mousePressed(){
  mouseInterval = true ;
}*/
void mouseReleased(){
  mouseInterval = false ;
}

void keyPressed(){
  if(key == 44){
    env.clear() ;
  }
}
