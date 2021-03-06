/****************************************************************************************************************/
/*                                                                                                              */
/*                      SUPER COOL SPACE ROBOT ON SPACE ON MARS VS ALIENS ALSO ON MARS                          */
/*                                                                                                              */
/*                      @authors Darren Wallace and Mathewos Kagnew                                             */
/*                                                                                                              */
/*   You will have to complete 4 levels while defeating the aliens on each level to reach the end and win!      */
/*   Use the arrow keys to move and the spacebar to jump. Using a sprite object avoid the collisions with the   */
/*   alien sprite objects in order to maintain the limited lives given (3). Each collision with the rocket will */
/*   result in the level increasing.                                                                            */
/****************************************************************************************************************/

final static float moveSpeed = 5;                      //global variable declaration 
final static float gravity = 0.5;
final static float jump_height = 10;
final static float ground_level = 600;

final static float right_margin = 400;
final static float left_margin = 150;
final static float vertical_margin = 40;

final static int NEUTRAL_FACING = 0; 
final static int RIGHT_FACING = 1; 
final static int LEFT_FACING = 2; 

float view_x = 0;
float view_y = 0;
float lives;
int level;
boolean menu;
boolean instruc;
boolean isGameOver;

PImage brick, ground, alien, rocket, pImg, winScreen, lossScreen;

BackGround bg;                                                          //creating objects
BackGround win;
BackGround loss;
Sprite threeHearts, twoHearts, oneHeart;
Tiles map;
Enemy enemy;
Player player;

ArrayList <Sprite> platforms;
ArrayList<Enemy> enemies; 
ArrayList<Sprite> rocketship; 

void setup(){                                      //initalize method that runs once at the beginning of the program and once when called
  size(700, 599);
  imageMode(CENTER);
    
  lives = 3;                                      
  level = 1;
  menu = true;
  instruc = false;
  isGameOver = false;

  bg= new BackGround("data/MainMenu.png");
  
  pImg = loadImage("data/Robostanding-removebg-preview.png");            
  player = new Player(pImg);
  player.center_x=150;
  player.center_y=500;
  map = new Tiles();
  
  platforms = new ArrayList<Sprite>();
  enemies = new ArrayList<Enemy>();
  rocketship = new ArrayList<Sprite>();

  brick = loadImage("data/brick.png");
  ground = loadImage("data/ground.png");
  alien = loadImage("data/alienwalking.jpg");
  rocket = loadImage("data/rocket-removebg-preview (1).png");

  player.change_x = 0;
  player.change_y = 0;
}  

void draw(){                                                                        //this is the main code that is constantly running
  if (menu == false && instruc == false && isGameOver == false){
    background(255);
    bg.current();
    scroll();
    player.display();
    player.updateAnimation();
    player.resolvePlatformCollisions(player, platforms);
    player.checkDeath();
    player.checkRocketCollision();
    for (Sprite tile: rocketship){
      tile.display();
    }
    
    for (Sprite tile: platforms){
      tile.display();
    }
    for (Enemy enemy : enemies){
      enemy.display();
      enemy.update();
      enemy.updateAnimation(); 
    } 
    
    if (lives == 3 && isGameOver == false){
      threeHearts = new Sprite("data/threeHearts.png", view_x + 600, view_y + 50);
      threeHearts.display();
    }
    if (lives == 2 && isGameOver == false){
      twoHearts = new Sprite("data/twoHearts.png", view_x + 630, view_y + 50);
      twoHearts.display();
    }
    if (lives == 1 && isGameOver == false){
      oneHeart = new Sprite("data/oneHeart.png", view_x + 645, view_y + 50);
      oneHeart.display();
    }
 }

  if (level == 4){
    win = new BackGround("data/winScreen.png");
  }
  if (lives == 0){
    loss = new BackGround("data/lossScreen.png");
  }
  
}


void keyPressed(){                                                //this method is run when a key is pressed
 if(keyCode == RIGHT){                                                //it checks which one is pressed and does the contents of the if statement, if none are pressed it does nothing
  player.change_x = moveSpeed;
 }
 else if(keyCode == LEFT){
  player.change_x = -moveSpeed;
 }
 else if (key == ' ' && player.isOnPlatforms(player, platforms)){
  player.change_y = -jump_height;
 }
 else if (key == 'r' && isGameOver == true){
   setup();
 }
}

void keyReleased(){                                            //this method is run when a key is released
if(keyCode == RIGHT){
  player.change_x = 0; 
 }
 else if(keyCode == LEFT){
  player.change_x = 0;
 }
}

void mousePressed(){
 if (menu == true && mouseX > 231 && mouseX < 466 & mouseY > 242 && mouseY < 349){      //main game button on the menu
      background(255);
      bg= new BackGround("data/background.jpg");
      player.display();
      map.createPlatforms("data/level1.csv");
      menu = false;
    }
    
  else if (menu == true && mouseX > 62 && mouseX < 264 & mouseY > 518 && mouseY < 578){       //instuctions button on the menu
      background(255);
      bg= new BackGround("data/instruction.png");
      instruc = true;
      menu = false;
    }
    
  else if (menu == true && mouseX > 558 && mouseX < 617 & mouseY > 516 && mouseY < 576){      //quit button on the menu
      exit();
    } 

  if (instruc == true && mouseX > 75 && mouseX < 133 & mouseY > 518 && mouseY < 570){      //main menu button on the instruction screen
        background(255);
        bg= new BackGround("data/MainMenu.png");
        menu = true;
        instruc = false;
      }
  
  else if (instruc == true && mouseX > 560 && mouseX < 617 & mouseY > 515 && mouseY < 573){      //quit button on the instruction screen
        exit();
      } 
}

public void scroll(){                                            //this method scrolls the player view with the player around the map
  float right_boundary = view_x + width - right_margin;
  if (player.getRight() > right_boundary){
    view_x += player.getRight() - right_boundary;
  }
  
  float left_boundary = view_x + left_margin;
  if (player.getLeft() < left_boundary){
    view_x -= left_boundary - player.getLeft();
  } 
  
  float bottom_boundary = view_y + height - vertical_margin;
  if (player.getBottom() > bottom_boundary){
    view_y += player.getBottom() - bottom_boundary;
  } 
  
  float top_boundary = view_y + vertical_margin;
  if (player.getTop() < top_boundary){
    view_y -= top_boundary - player.getTop();
  } 
  translate(-view_x, -view_y);
}
