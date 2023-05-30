public class ElementMatrix{
  
  private Element[][] eMatrix ;
  
  public ElementMatrix(){
    int mheight = height/10 ;
    int mwidth = width/10 ;
    eMatrix = new Element[mheight][mwidth] ;
  }
  
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
    if(!(eMatrix[x][y] instanceof Border)){
      eMatrix[x][y] = E ;
      eMatrix[x][y].setPosition(y,x) ;
    }
    }
  }
  public boolean isEmpty(int x, int y){
    if(this.isValid(x,y)){
    return eMatrix[x][y] == null ;
    }else{return false ;}
  }
  public boolean MovSolMoveCheck(int x, int y){
    if(this.isValid(x,y)){
    return (eMatrix[x][y] == null) || (eMatrix[x][y] instanceof Liquid) ;
    }else{return false ;}
  }
  
  
  public void swap(int x1, int y1, int x2, int y2){
    if(this.isValid(x2,y2)){
    Element temp = eMatrix[x1][y1] ;
    /*if(eMatrix[x2][y2] instanceof Liquid){
      if(((int)random(2) == 0)&&this.isEmpty(x1,y1+1)){
        eMatrix[x1][y1+1] = eMatrix[x2][y2] ;
        eMatrix[x2][y2] = temp ;
      }
      if(((int)random(2) == 1)&&this.isEmpty(x1,y1-1)){
        eMatrix[x1][y1-1] = eMatrix[x2][y2] ;
        eMatrix[x2][y2] = temp ;
      }
    }else{*/
    eMatrix[x1][y1] = eMatrix[x2][y2] ;
    try{
      eMatrix[x1][y1].setPosition(y1,x1) ;
    }catch(NullPointerException e){
    }
    eMatrix[x2][y2] = temp ;
    try{
      eMatrix[x2][y2].setPosition(y2,x2) ;
    }catch(NullPointerException e){
    }
    //}
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
          
  //public ElementMatrix(int thickness){
  }
