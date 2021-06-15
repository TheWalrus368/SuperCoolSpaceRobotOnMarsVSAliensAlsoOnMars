public class AnimatedSprite extends Sprite{
//define arrays and veriables (local)
  PImage[] currentImages;
  PImage[] standNeutral;
  PImage[] moveLeft;
  PImage[] moveRight;
  int direction;
  int index;
  int frame;

//will create a sprite variables such as witch higet and position/speed
  public AnimatedSprite(PImage spr){
    super(spr);    
    direction = NEUTRAL_FACING;
    index = 0;
    frame = 0;
  }
  
//set the frame rate of the animation and also call the methods to animate the sprite
  public void updateAnimation(){
    frame++;
    if(frame % 5 == 0){
      selectDirection();
      selectCurrentImages();
      advanceToNextImage();
    }
  }
  
//the method will select the direction of the sprite depending on the movement of the sprite
  public void selectDirection(){
    if(change_x > 0)
      direction = RIGHT_FACING;
    else if(change_x < 0)
      direction = LEFT_FACING;    
    else
      direction = NEUTRAL_FACING;  
  }

//selects the images in the methods to be shown depending on the direction
  public void selectCurrentImages(){
    if(direction == RIGHT_FACING)
      currentImages = moveRight;
    else if(direction == LEFT_FACING)
      currentImages = moveLeft;
    else
      currentImages = standNeutral;
  }

//go the the next image in the index to cycle through the images
  public void advanceToNextImage(){
    index++;
    if(index >= currentImages.length)
      index = 0;
    sp = currentImages[index];
  }
}
