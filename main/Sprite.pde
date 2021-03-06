public class Sprite{
   PImage sp;                      //variable declaration 
   float center_x, center_y;
   float change_x, change_y;
   float w, h;
   
   public Sprite(String fileName, float x, float y){
    sp = loadImage(fileName);                              //this method loads and displays a image when a file name and its x and y location are required for its placement
    w = sp.width;
    h = sp.height;
    center_x = x;
    center_y = y;
    change_x = 0;
    change_y = 0;
   }
   
   public Sprite(PImage tile){                             //this method is used in animations to initialize the image of the sprite
    sp = tile;
    w = sp.width;
    h = sp.height;
    center_x = 0;
    center_y = 0;
    change_x = 0;
    change_y = 0; 
   }
    
    public void display(){                              //this method displays an image to its current x and y position 
     image (sp, center_x, center_y); 
    }
    
    public void move(){                                //this method updates the current x and y position by the current change in x and y
     center_x += change_x;
     center_y += change_y;
    }
    
    void setLeft(float left){                          //these methods below get and then set the hitboxes/sides of the the sprites
    center_x = left + w/2;
  }
  float getLeft(){
    return center_x - w/2;
  }
  void setRight(float right){
    center_x = right - w/2;
  }
  float getRight(){
    return center_x + w/2;
  }
  void setTop(float top){
    center_y = top + h/2;
  }
  float getTop(){
    return center_y - h/2;
  }
  void setBottom(float bottom){
    center_y = bottom - h/2;
  }
  float getBottom(){
    return center_y + h/2;
  }
    
      public boolean checkRocketCollision(Sprite s, ArrayList<Sprite> rocekt){                    //this method checks for player collision with the rocket and returns a boolean
      boolean x = false;
      for(Sprite p: rocekt){
        if(checkCollision(s, p)){
          x = true;
          break;
        }
        else{
         x = false; 
        }
      }
      return x;
     }
     
    public void checkRocketCollision(){                                                          //this method decides what to do when the player collides with the rocket
      boolean collidedRocket = checkRocketCollision(player, rocketship);
      if (collidedRocket){
        level += 1;
        lives = 3;
        player.center_x = 150;
        player.center_y = 500;
        if (level == 2){
          platforms = new ArrayList<Sprite>();
          enemies = new ArrayList<Enemy>();
          rocketship = new ArrayList<Sprite>();
          map.createPlatforms("data/level2.csv");
        }
        else if (level == 3){
          platforms = new ArrayList<Sprite>();
          enemies = new ArrayList<Enemy>();
          rocketship = new ArrayList<Sprite>();
          map.createPlatforms("data/level3.csv");
        }
        else if (level == 4){
          isGameOver = true;
          platforms = new ArrayList<Sprite>();
          enemies = new ArrayList<Enemy>();
          rocketship = new ArrayList<Sprite>();
        }
      }
      
    }  
    
   public boolean checkCollision(Sprite s1, Sprite s2){                                           //this method checks for collision between 2 specific sprites and returns a boolean
    boolean noXOverLap = s1.getRight() <= s2.getLeft() || s1.getLeft() >= s2.getRight();
    boolean noYOverLap = s1.getBottom() <= s2.getTop() || s1.getTop() >= s2.getBottom();
    
    if (noXOverLap || noYOverLap){
     return false; 
    }
    else{
     return true; 
    }
  }
  
  public ArrayList<Sprite> checkCollisionList(Sprite s, ArrayList<Sprite> list){                //this method decides what to do when if the sprites collide
    ArrayList<Sprite> collision_list = new ArrayList<Sprite>();
    for(Sprite p: list){
      if(checkCollision(s, p)){
        collision_list.add(p);
      }
    }
    return collision_list;
  }
  
  public void resolvePlatformCollisions(Sprite s, ArrayList<Sprite> walls){                    //this method is used to make the platforms solid and make the player unable to pass through
  s.change_y += gravity;
  
  s.center_y += s.change_y;    
    ArrayList<Sprite> col_list = checkCollisionList(s, walls);
    if (col_list.size() > 0){
      Sprite collided = col_list.get(0);
      if (s.change_y > 0){
        s.setBottom(collided.getTop());
      }
      else if (s.change_y < 0){
        s.setTop(collided.getBottom());
      }
      s.change_y = 0;
    }
  
   s.center_x += s.change_x;    
    col_list = checkCollisionList(s, walls);
    if (col_list.size() > 0){
      Sprite collided = col_list.get(0);
      if (s.change_x > 0){
        s.setRight(collided.getLeft());
      }
      else if (s.change_x < 0){
        s.setLeft(collided.getRight());
      }
    }
  }
    
    public boolean isOnPlatforms(Sprite s, ArrayList<Sprite> walls){                        //this method checks if the player is on any platforms in order to be able to jump only once
      s.center_y += 5;
      ArrayList<Sprite> col_list = checkCollisionList(s, walls);
      s.center_y += -5;
      if (col_list.size() > 0){
        return true;
      }
      else {
       return false; 
      }
    }
    
    public boolean checkEnemyCollision(Sprite s, ArrayList<Enemy> alien){                //this method checks if the player collides with a enemy and returns a boolean
      boolean x = false;
      for(Sprite p: alien){
        if(checkCollision(s, p)){
          x = true;
          break;
        }
        else{
         x = false; 
        }
      }
      return x;
     }
    
    public void checkDeath(){                                                          //this method decides what to do if the player collides with an enemy and/or checks if they fall off a cliff
      boolean collidedEnemy = checkEnemyCollision(player, enemies);
      boolean fallOffCliff = player.getBottom() > ground_level;
      if (collidedEnemy || fallOffCliff){
        lives--;
        if (lives == 0){
         view_x = 0;
         view_y = 0;
         isGameOver = true;

       }        
        else {
         player.center_x = 150;
         player.setBottom(550);
         view_x = 0;
         view_y = 0;
       }
      }
    
}
  
}
