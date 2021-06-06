public class Enemy extends AnimatedSprite{
  float boundaryLeft, boundaryRight;
  public Enemy(PImage img, float scale, float bLeft, float bRight){
    super(img, scale);
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
    speed_x = 2;
  }
  
  void update(){
    // call update of Sprite(super)
    super.move();
    
    if(getRight() >= boundaryRight){
      setRight(boundaryRight);
      speed_x *= -1;
    }
    if(getLeft() <= boundaryLeft){
      setLeft(boundaryLeft);
      speed_x *= -1;
    }

  }
}
