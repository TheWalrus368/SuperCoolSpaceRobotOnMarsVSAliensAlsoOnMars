public class Enemy extends AnimatedSprite{
//define variables
  float boundaryLeft, boundaryRight;
  
//initalize all the varaibles and arrays for the enemy sprites  
  public Enemy(PImage spr, float bLeft, float bRight){
    super(spr);
    moveLeft = new PImage[2];
    moveLeft[0] = loadImage("data/alienwalking.png");
    moveLeft[1] = loadImage("data/alienwalking2.png");
    moveRight = new PImage[2];
    moveRight[0] = loadImage("data/alienwalking.png");
    moveRight[1] =loadImage("data/alienwalking2.png");
    currentImages = moveRight;
    direction = RIGHT_FACING;
    boundaryLeft = bLeft;
    boundaryRight = bRight;
    change_x = 2;
  }
 // sets trhe boundaries that the enemy sprite can move and also moves by calling the sprite class
  void update(){
    // call update of Sprite(super)
    super.move();
    
    if(getRight() >= boundaryRight){
      setRight(boundaryRight);
      change_x *= -1;
    }
    if(getLeft() <= boundaryLeft){
      setLeft(boundaryLeft);
      change_x *= -1;
    }

  }
}
