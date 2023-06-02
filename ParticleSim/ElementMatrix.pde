public class ElementMatrix{
  
  private Element[][] eMatrix ;
  //scales to window size
  public ElementMatrix(){
    int mheight = height/10 ;
    int mwidth = width/10 ;
    eMatrix = new Element[mheight][mwidth] ;
  }
  //creates border of specified width around the edge of the window
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
      for(int y = mheight-1 ; y > mheight-1-borderWidth ; y--){
        eMatrix[y][x] = new Border() ;
      }
    }
    for(int x = 0 ; x < borderWidth ; x++){
      for(int y = borderWidth ; y < mheight ; y++){
        eMatrix[y][x] = new Border() ;
      }
    }
    for(int x = mwidth-1 ; x > mwidth-1-borderWidth ; x--){
      for(int y = borderWidth ; y < mheight ; y++){
        eMatrix[y][x] = new Border() ;
      }
    }
  } 
  //checks that the mouse is in the window, prevents crashing
  public boolean isValid(int x, int y){
    return (x < eMatrix.length && x >= 0) && (y < eMatrix[0].length && y >= 0) ;
  }
  
  public Element get(int x, int y){
    if(this.isValid(x,y)){
    return eMatrix[x][y] ;
    }else{
      Element e = new Element() ;
      return e ;
  }
  }
  
  public void set(int x, int y, Element E){
    if(this.isValid(x,y)){
    if(this.isEmpty(x,y)){
      eMatrix[x][y] = E ;
    }
    }
  }
  //version of set that does not check for emptiness, used for phase changes
  public void change(int x, int y, Element E){
    if(this.isValid(x,y)){
      eMatrix[x][y] = E ;
    }
  }
  public boolean isEmpty(int x, int y){
    if(this.isValid(x,y)){
    return eMatrix[x][y] == null ;
    }else{return false ;}
  }
  
  //swaps two specified elements, the main method used in move()
  public void swap(int x1, int y1, int x2, int y2){
    if(this.isValid(x2,y2)){
    Element temp = eMatrix[x1][y1] ;
    eMatrix[x1][y1] = eMatrix[x2][y2] ;
    eMatrix[x2][y2] = temp ;
    }
  }
  
  public void clear(){
    for(int i = 0 ; i < eMatrix.length ; i++){
      for(int k = 0 ; k < eMatrix[i].length ; k++){
        if(!(eMatrix[i][k] instanceof Border) || this.isEmpty(i,k)){
          eMatrix[i][k] = null ;
        }
      }
    }
  }
  }
