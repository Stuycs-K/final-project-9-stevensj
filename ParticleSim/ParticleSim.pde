ElementMatrix env ;
ArrayList<Element> elementsPresent = new ArrayList<Element>() ;
boolean mouseInterval ;
int mouseCountdown ;
int ticks = 0;
String ElementChosen = "NONE";
int selection = 113 ; //81
static int MovSol = 113 ; //81
static int ImmovSol = 119 ; // 87
static int Liq = 101 ; //69

void setup(){
  size(500,500) ;
  background(0) ;
  env = new ElementMatrix() ;
}

void draw(){
  background(0) ;
  drawPixels() ;
  movement() ;
  text(ElementChosen,35,40) ;
  text("" + key, height-10,width-10) ;
  if(mouseCountdown > 0){
    mouseCountdown-- ;
  }else{
    while(mouseInterval&& (mouseCountdown==0)){
  int mousex = mouseX/10 ;
  int mousey = mouseY/10 ;
  setParticle(mousex, mousey,selection) ;
  System.out.println(env.get(mousey,mousex)) ;
  mouseCountdown += 1 ;
  }
  }
  ticks ++ ;
 // println(elementsPresent.size()) ;
  
}

void drawPixels(){
  for(int y = 0 ; y < height-9 ; y+=10){
    for(int x = 0 ; x < width-9 ; x+=10){
      try{
        //System.out.println(env.get(y,x)) ;
        env.get(y/10,x/10).pixelDraw(x,y) ;
        //set(x,y,color(124,35,100)) ;
      }catch(NullPointerException e){
        
      }
    }
  }
}

/*void movement(){
  for(int y = height-9 ; y >= 0  ; y-=10){
    for(int x = 0 ; x < width-9 ; x+=10){
      try{
        //System.out.println(env.get(y,x)) ;
        env.get(y/10,x/10).move(env,x/10,y/10) ;
        //set(x,y,color(124,35,100)) ;
      }catch(NullPointerException e){
        
      }
    }
      }
      //env.movementReset() ;
    }*/
    
void movement(){
  
  for(int i = 0 ; i < elementsPresent.size() ; i++){
    Element e = elementsPresent.get(i) ;
    if(e.move(env, e.eX(), e.eY()) ){
      //println("moved" + ticks + " " +e.eX() +" " + e.eY() + " " + env.get(e.eX(), e.eY())) ;
    }
    
  }
  
}
  

  



void setParticle(int x, int y, int type){
  Element e = new Element();
  if(type == MovSol){
    e = new MovableSolid() ;
  }
  if(type == ImmovSol){
    e = new ImmovableSolid() ;
  }
  if(type == Liq){
    e = new Liquid() ;
  }
    env.set(y,x,e) ;
    ElementChosen = e.toString() ;
    elementsPresent.add(e) ;
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
  else
  {
    selection = key ;
  }
}
