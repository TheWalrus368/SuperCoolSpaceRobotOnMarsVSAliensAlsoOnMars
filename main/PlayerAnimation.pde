public class Player extends AnimatedSprite{
//define variables/arrays
  boolean inPlace,onPlatform;
  PImage[] standLeft;
  PImage[] standRight;
  PImage[] jumpLeft;
  PImage[] jumpRight;
  PImage[] runLeft;
  PImage[] runRight;
  
//method to initialize all arrays and variables like constructor  
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

//Overloading/overiding methods used in the super class AnimatedSprite for player animation specifically

//checks to see is the player is on the platforms and checks to see if they are in place then it will be called to the super class for the updateAnimation method
  @Override
  public void updateAnimation(){
    onPlatform = isOnPlatforms(this, platforms);
    inPlace= change_x ==0 && change_y ==0;
    super.updateAnimation();
  }
  
//override the other selectDirection to check which direction the sprite is facing
  @Override
  public void selectDirection(){
    if(change_x > 0)
      direction = RIGHT_FACING;
    else if(change_x < 0)
      direction = LEFT_FACING;    
  }
  
//  based on the orientation of the player sprite the specific animation array will be selected
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
  
