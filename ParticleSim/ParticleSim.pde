ElementMatrix env ;

void setup(){
  size(1200,800) ;
  env = new ElementMatrix(20) ;
}

void draw(){
  drawPixels() ;
}

void drawPixels(){
  for(int y = 0 ; y < height ; y++){
    for(int x = 0 ; x < width ; x++){
      try{
        //System.out.println(env.get(y,x)) ;
        env.get(y,x).pixelDraw(x,y) ;
        //set(x,y,color(124,35,100)) ;
      }catch(NullPointerException e){
        set(x,y,color(0)) ;
      }
    }
  }
}
