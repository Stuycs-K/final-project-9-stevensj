public class ElementMatrix{
  
  private Element[][] eMatrix ;
  
  public ElementMatrix(int borderWidth){
    eMatrix = new Element[height][width] ;
    for(int x = 0 ; x < width ; x++){
      for(int y = 0 ; y < borderWidth ; y++){
        eMatrix[y][x] = new Border() ;
      }
    }
    for(int x = 0 ; x < width ; x++){
      for(int y = height-1 ; y > height-borderWidth ; y--){
        eMatrix[y][x] = new Border() ;
      }
    }
    for(int x = 0 ; x < borderWidth ; x++){
      for(int y = borderWidth ; y < height ; y++){
        eMatrix[y][x] = new Border() ;
      }
    }
    for(int x = width-1 ; x > width-borderWidth ; x--){
      for(int y = borderWidth ; y < height ; y++){
        eMatrix[y][x] = new Border() ;
      }
    }
  } 
  
  public Element get(int x, int y){
    return eMatrix[x][y] ;
  }
  
  public void set(int x, int y, Element E){
    eMatrix[x][y] = E ;
  }
  //public ElementMatrix(int thickness){
  }
