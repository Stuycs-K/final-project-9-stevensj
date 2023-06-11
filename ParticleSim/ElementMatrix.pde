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
  
  public void set(Position P, Element E){
    int x = P.X ;
    int y = P.Y ;
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
  
  public boolean moveExtended(int xi, int yi,int xf,int yf){
    float slope = -1 ;
    try{
      slope = (xf-xi)/(yf-yi) ;
    }catch(ArithmeticException e){
      
    }
    if(slope > -1){
      
    if(slope == 0){
    float x = xi ;
    float y = yi ;
    while((y != yf)&&(this.isEmpty(round(x),round(y+1)))){
      int ixi = round(x) ;
      int iyi = round(y) ;
      y ++ ;
      int fxf = round(x) ;
      int fyf = round(y) ;
      this.swap(ixi,iyi,fxf,fyf) ;
      println("slope == 0 " + ticks) ;
    }
    }
    else
    {
    float x = xi ;
    float y = yi ;
    while((x != xf)&&(y != yf)&&(this.isEmpty(round(x+1),round(y+slope)))){
      int ixi = round(x) ;
      int iyi = round(y) ;
      x++ ;
      y += (slope);
      int fxf = round(x) ;
      int fyf = round(y) ;
      this.swap(ixi,iyi,fxf,fyf) ;
      println("slope =/= 0 " + ticks) ;
    }
    }
    return true ;
    }
    else
    {
    float x = xi ;
    float y = yi ;
    while((x != xf)&&(this.isEmpty(round(x+1),round(y+slope)))){
      int xii = round(x) ;
      int yii = round(y) ;
      x++ ;
      y += (slope);
      int xff = round(x) ;
      int yff = round(y) ;
      this.swap(xii,yii,xff,yff) ;
    }
    
    return true ;
  }
  
  
  }
  public boolean moveExtended(int xi, int yi,int xf,int yf,int movsoltoggle){
    float slope = 0 ;
    try{
      slope = (xf-xi)/(yf-yi) ;
    }catch(ArithmeticException e){
    }
    if(slope > 0){
    float x = xi ;
    float y = yi ;
    while((x != xf)&&(y != yf)&&(this.MovSolMoveCheck(round(x+1),round(y+slope)))){
      int ixi = round(x) ;
      int iyi = round(y) ;
      x++ ;
      y += (slope);
      int fxf = round(x) ;
      int fyf = round(y) ;
      this.swap(ixi,iyi,fxf,fyf) ;
    }
    
    return true ;
    }else{
    float x = xi ;
    float y = yi ;
    while((x != xf)&&(this.MovSolMoveCheck(round(x+1),round(y+slope)))){
      int xii = round(x) ;
      int yii = round(y) ;
      x++ ;
      y += (slope);
      int xff = round(x) ;
      int yff = round(y) ;
      this.swap(xii,yii,xff,yff) ;
    }
    
    return true ;
  }
  
  
  }
  
  public ArrayList<Position> lineDraw(Position A, Position B){
    float x = A.X ;
    float y = A.Y ;
    int xf = B.X ;
    int yf = B.Y ;
    float slope = 0 ;
    ArrayList<Position> finalLine = new ArrayList<Position>() ;
    try{
      slope = (yf-y)/(xf-x) ;
    }catch(ArithmeticException e){
      int direction = (yf-(int)y)/abs(yf-(int)y) ; //hopefully is either 1 or -1
      while(y < yf){
        y+= direction ;
        Position point = new Position((int)x,(int)y) ;
        finalLine.add(point) ;
        println(point) ;
      }
    }
    while((x <= xf-1)&&(y <= yf-slope)){
      x++ ;
      y += slope ;
      int xff = round(x) ;
      int yff = round(y) ;
      if(y % 0.5 == 0){
        yff = (int)(y) ;
        int yff2 = round(y) ;
        if(round(y+slope) != yff2){
          Position pointExtra = new Position(xff,yff2) ;
          finalLine.add(pointExtra) ;
          println(pointExtra + " ;; extra") ;
        }
      }
      Position point = new Position(xff,yff) ;
      finalLine.add(point) ;
      println(point) ;
    }
    return finalLine ;
  }
  
  public void drawLine(int xi, int yi,int xf,int yf, Element E){
    Position start = new Position(xi, yi) ;
    Position end = new Position(xf, yf) ;
    int lastY = 0 ;
    ArrayList<Position> linePoints = this.lineDraw(start,end) ;
    for(int i = 0 ; i < linePoints.size() ; i++){
      if((linePoints.get(i).Y - lastY > 1)&&(lastY!=0)){
        for(int k = lastY+1 ; k < linePoints.get(i).Y ; k++){
          this.set(linePoints.get(i).X, k,E) ;
          //println("set ! : " + linePoints.get(i).X + " , " + linePoints.get(i).Y) ;
        }
      }else
      {
      this.set(linePoints.get(i),E) ;
      //println("set ! : " + linePoints.get(i).X + " , " + linePoints.get(i).Y) ;
      }
      lastY = linePoints.get(i).Y ;
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
