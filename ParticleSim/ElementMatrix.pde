public class ElementMatrix{
  
  private Element[][] eMatrix ;
  
  public ElementMatrix(int borderWidth){
    int mheight = height/10 ;
    int mwidth = width/10 ;
    eMatrix = new Element[mheight][mwidth] ;
    for(int x = 0 ; x < mwidth ; x++){
      for(int y = 0 ; y < borderWidth ; y++){
        eMatrix[y][x] = new Border() ;
      }
    }
    for(int x = 0 ; x < mwidth ; x++){
      for(int y = mheight-1 ; y > mheight-borderWidth ; y--){
        eMatrix[y][x] = new Border() ;
      }
    }
    for(int x = 0 ; x < borderWidth ; x++){
      for(int y = borderWidth ; y < mheight ; y++){
        eMatrix[y][x] = new Border() ;
      }
    }
    for(int x = mwidth-1 ; x > mwidth-borderWidth ; x--){
      for(int y = borderWidth ; y < mheight ; y++){
        eMatrix[y][x] = new Border() ;
      }
    }
  } 
  
  public Element get(int x, int y){
    return eMatrix[x][y] ;
  }
  
  public void set(int x, int y, Element E){
    Border ref = new Border() ;
    if(!(eMatrix[x][y] instanceof Border)){
      eMatrix[x][y] = E ;
      //eMatrix[x][y].setPosition(y,x) ;
    }
  }
  public boolean isEmpty(int x, int y){
    return eMatrix[x][y] == null ;
  }
  
  public void swap(int x1, int y1, int x2, int y2){
    Element temp = eMatrix[x1][y1] ;
    eMatrix[x1][y1] = eMatrix[x2][y2] ;
    eMatrix[x2][y2] = temp ;
  }
  public void movementReset(){
    for(int i = 0 ; i < eMatrix.length ; i++){
      for(int j = 0 ; j < eMatrix[i].length ; j++){
        try{
          eMatrix[i][j].moved = false ;
        }catch(NullPointerException e){
        }
      }
    }
  }
  //public ElementMatrix(int thickness){
  }
