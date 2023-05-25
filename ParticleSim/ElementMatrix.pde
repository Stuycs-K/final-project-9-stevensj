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
    if(eMatrix[x][y] != null){
      eMatrix[x][y] = E ;
    }
  }
  //public ElementMatrix(int thickness){
  }
