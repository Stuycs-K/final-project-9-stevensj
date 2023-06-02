ElementMatrix env ;
boolean mouseInterval ;
int mouseCountdown ;
int mouseSize = 0;
float mouseSpeed = 0 ;
int ticks = 0;
String ElementChosen = "NONE";
//These Integers represent the ASCII values of certain keys, which are used to select the element to be drawn.
int selection = 97 ;
static int MovSol = 81 ; //debug, Q
static int ImmovSol = 87 ;//debug, W
static int Liq = 69 ;//debug, E
static int Gas = 82 ;//debug, R
static int SAND = 97 ;// a
static int WATER = 115 ;// s
static int IRON = 100 ;// d

void setup(){
  size(500,500) ;
  background(0) ;
  env = new ElementMatrix() ;
}

void draw(){
  background(0) ;
  drawPixels() ;
  movement() ;
  
  //Displays chosen element, last pressed key, and element at mouse location
  text(ElementChosen,35,40) ;
  text("" + key, height-10,width-10) ;
  int currentx = mouseX/10 ;
  int currenty = mouseY/10 ;
  try{
      text(env.get(currenty,currentx).toString(), 0, 400) ;
  }catch(NullPointerException e){
  }
  
  //uses countdown timer to limit elements drawn
  if(mouseCountdown > 0){
    mouseCountdown-- ;
  }else{
    while(mouseInterval&& (mouseCountdown==0)){
  int mousex = mouseX/10 ;
  int mousey = mouseY/10 ;
  
  //heat tools
  if(key == 113){
    try{
        env.get(mousey,mousex).heat((int)(20*mouseSpeed + 5)) ;
      }catch(NullPointerException e){
      }
  }
  if(key == 119){
    try{
        env.get(mousey,mousex).heat((int)(-20*mouseSpeed + 5)) ;
      }catch(NullPointerException e){
      }
  }
  
  
  else
  {
    setParticle(mousex,mousey,selection) ;
  }
  mouseCountdown += 1 ;
  }
  }
  int changeX = mouseX - pmouseX ;
  int changeY = mouseY - pmouseY ;
  mouseSpeed = sqrt((changeX*changeX)+(changeY*changeY)) ;
  ticks ++ ;
  
}

//drawPixels() loops through the ElementMatrix and attempts to draw each element present, creating the visuals.
void drawPixels(){
  for(int y = 0 ; y < height-9 ; y+=10){
    for(int x = 0 ; x < width-9 ; x+=10){
      try{
        env.get(y/10,x/10).pixelDraw(x,y) ;
      }catch(NullPointerException e){
        
      }
    }
  }
  
}

//movement() loops through the array and attempts to call move() on each element present, executing the movement and heat conduction of the simulation.
void movement(){
  for(int y = height-9 ; y >= 0  ; y-=10){
    for(int x = 0 ; x < width-9 ; x+=10){
      try{
        env.get(y/10,x/10).move(env,x/10,y/10) ;
      }catch(NullPointerException e){
        
      }
    }
      }
    }
    
//sets specified position in the ElementMatrix to the element corresponding to the key last pressed.
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
  if(type == IRON){
    e = new Iron() ;
  }
    if(!(e.toStringProper().equals("EMPTY"))){
      env.set(y,x,e) ;
    }
    ElementChosen = e.toString() ;
}

void mousePressed(){
  mouseInterval = true ;
}
void mouseReleased(){
  mouseInterval = false ;
}

//either clears the environment or changes selected element
void keyPressed(){
  if(key == 44){
    env.clear() ;
  }
  else
  {
    selection = key ;
  }
}
