public class Sprite{
   PImage sp;
   float centerX, centerY;
   float speedX, speedY;
   float w, h;
   
   public Sprite(String fileName, float x, float y){
    sp = loadImage(fileName);
    centerX = x;
    centerY = y;
    speedX = 0;
    speedY = 0;
   }
   
   public Sprite(PImage tile){
    sp = tile;
    centerX = 0;
    centerY = 0;
    speedX = 0;
    speedY = 0; 
   }
   
   
  public Sprite(String fileName){
   this(fileName, 0, 0); 
  }
  
  public void display(){
   image (sp, centerX, centerY); 
  }
  
  public void move(){
   centerX += speedX;
   centerY += speedY;
  }
  
}
