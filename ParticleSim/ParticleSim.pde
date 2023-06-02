ElementMatrix env ;
//ArrayList<Element> elementsPresent = new ArrayList<Element>() ;
boolean mouseInterval ;
int mouseCountdown ;
int mouseSize = 0;
float mouseSpeed = 0 ;
int ticks = 0;
String ElementChosen = "NONE";
int selection = 97 ;
static int MovSol = 81 ;
static int ImmovSol = 87 ;
static int Liq = 69 ;
static int Gas = 82 ;
static int SAND = 97 ;
static int WATER = 115 ;

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
  stroke(255) ;
  square(mouseX,mouseY,(1+mouseSize)*10) ;
  int currentx = mouseX/10 ;
  int currenty = mouseY/10 ;
  try{
      text(env.get(currenty,currentx).toString(), 0, 400) ;
  }catch(NullPointerException e){
  }
  
  if(mouseCountdown > 0){
    mouseCountdown-- ;
  }else{
    while(mouseInterval&& (mouseCountdown==0)){
  int mousex = mouseX/10 ;
  int mousey = mouseY/10 ;
  //pen(mousex,mousey,mouseSize,selection) ;
  if(key == 113){
    try{
        env.get(mousey,mousex).heat((int)(20*mouseSpeed+10)) ;
        System.out.println(env.get(mousey,mousex)) ;
      }catch(NullPointerException e){
      }
    println("heated") ;
  }
  if(key == 119){
    try{
        env.get(mousey,mousex).heat((int)(-20*mouseSpeed+10)) ;
        System.out.println(env.get(mousey,mousex)) ;
      }catch(NullPointerException e){
      }
    println("heated") ;
  }else
  {
    setParticle(mousex,mousey,selection) ;
    System.out.println(env.get(mousey,mousex)) ;
  }
  mouseCountdown += 1 ;
  }
  }
  int changeX = mouseX - pmouseX ;
  int changeY = mouseY - pmouseY ;
  mouseSpeed = sqrt((changeX*changeX)+(changeY*changeY)) ;
  ticks ++ ;
 // println(elementsPresent.size()) ;
  
}

void pen(int startx, int starty, int size, int input){
  for(int x = startx ; x < startx+size ; x++){
    for(int y = starty ; y < starty+size ; y++){
      setParticle(x,y,input) ;
    }
  }
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

void movement(){
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
    }
    
/*void movement(){
  
  for(int i = 0 ; i < elementsPresent.size() ; i++){
    Element e = elementsPresent.get(i) ;
    if(e.move(env, e.eX(), e.eY()) ){
      //println("moved" + ticks + " " +e.eX() +" " + e.eY() + " " + env.get(e.eX(), e.eY())) ;
    }
    
  }
  
}*/
  
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
  if(type == Gas){
    e = new Gas() ;
  }
  if(type == SAND){
    e = new Sand() ;
  }
  if(type == WATER){
    e = new Water() ;
  }
    if(!(e.toStringProper().equals("EMPTY"))){
      env.set(y,x,e) ;
    }
    ElementChosen = e.toString() ;
    //elementsPresent.add(e) ;
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
  if(key == 61){
    mouseSize++ ;
  }
  if(key == 45){
    mouseSize-- ;
  }
  else
  {
    selection = key ;
  }
}
