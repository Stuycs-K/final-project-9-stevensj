ElementMatrix env ;

void setup(){
  size(500,500) ;
  env = new ElementMatrix(5) ;
}

void draw(){
  drawPixels() ;
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

void setParticle(int x, int y, int type){
  if(type == -1){
    Element e = new MovableSolid() ;
    env.set(y,x, e) ;
  }
}

void mouseClicked(){
  int mousex = mouseX/10 ;
  int mousey = mouseY/10 ;
  setParticle(mousex, mousey,-1) ;
  System.out.println(env.get(mousey,mousex)) ;
}
