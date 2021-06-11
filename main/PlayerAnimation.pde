public class Player extends AnimatedSprite{
  boolean inPlace,onPlatform;
  PImage[] standLeft;
  PImage[] standRight;
  PImage[] jumpLeft;
  PImage[] jumpRight;
  PImage[] runLeft;
  PImage[] runRight;
  public Player(PImage sp){
    super(sp);
    direction = RIGHT_FACING;
    inPlace = true;
    standLeft = new PImage[1];
    standLeft[0] = loadImage("data/robostandingleft-removebg-preview.png");
    standRight = new PImage[1];
    standRight[0] = loadImage("data/Robostanding-removebg-preview.png");
    runLeft = new PImage[2];
    runLeft[0] = loadImage("data/roborunleft-removebg-preview.png");
    runLeft[1] = loadImage("data/roborunleft2-removebg-preview.png");
    runRight = new PImage[2];
    runRight[0] = loadImage("data/roborun1-removebg-preview.png");
    runRight[1] = loadImage("data/roborun2-removebg-preview.png"); 
    jumpRight = new PImage[1];
    jumpRight[0] = loadImage("data/robojump-removebg-preview.png");
    jumpLeft = new PImage[1];
    jumpLeft[0] = loadImage("data/robojumpleft-removebg-preview.png");
  }
  @Override
  public void updateAnimation(){
    onPlatform = isOnPlatforms(this, platforms);
    inPlace= change_x ==0 && change_y ==0;
    super.updateAnimation();
  }
  @Override
  public void selectDirection(){
    if(change_x > 0)
      direction = RIGHT_FACING;
    else if(change_x < 0)
      direction = LEFT_FACING;    
  }
  @Override
  public void selectCurrentImages(){
    if(direction == RIGHT_FACING){
      if(inPlace){
        currentImages = standRight;
      }
      else if (!onPlatform){
        currentImages = jumpRight;
      }
      else{
        currentImages = runRight;
      }
    }
    if(direction == LEFT_FACING){
      if(inPlace){
        currentImages = standLeft;
      }
      else if (!onPlatform){
        currentImages = jumpLeft;
      }
      else{
        currentImages = runLeft;
      }
    }
   }

}
  
