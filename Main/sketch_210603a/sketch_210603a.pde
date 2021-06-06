
final static float moveSpeed = 5;
boolean menu = true;
boolean instruc = false;
PImage brick, ground, alien;
final static float SPRITE_SCALE = 50.0/50;
final static float SPRITE_SIZE = 50;

final static int NEUTRAL_FACING = 0; 
final static int RIGHT_FACING = 1; 
final static int LEFT_FACING = 2; 
ArrayList<Sprite> platforms;
ArrayList<Enemy> enemies; 

Enemy enemy;
BackGround p;
Sprite player;

void setup(){
  size(700, 599);
  p = new BackGround("data/MainMenu.png");
  player = new Sprite("data/Robo.png", SPRITE_SCALE, 100, 200);
  player.speed_x = 0;
  player.speed_y = 0;
  enemies = new ArrayList<Enemy>();
  platforms = new ArrayList<Sprite>();
  alien = loadImage("data/alienwalking.jpg");
  brick = loadImage("data/brick.png");
  ground = loadImage("data/ground.png");
  createPlatforms("data/map.csv"); 
}  

void draw(){
  background(255);
  p.current();
  if (menu == false){
    player.display();
    player.move();  
    for (Enemy enemy : enemies){
      enemy.display();
      enemy.update();
      enemy.updateAnimation(); 
    }  
    for(Sprite tile: platforms){
     tile.display();
    }
  }
}

void keyPressed(){
 if(keyCode == RIGHT){
  player.speed_x = moveSpeed;
 }
 else if(keyCode == LEFT){
  player.speed_x = -moveSpeed;
 }
 else if (keyCode == DOWN){
  player.speed_y = moveSpeed;
 }
 else if (keyCode == UP){
  player.speed_y = -moveSpeed;
 }
}

void keyReleased(){
if(keyCode == RIGHT){
  player.speed_x = 0; 
 }
 else if(keyCode == LEFT){
  player.speed_x = 0;
 }
 else if (keyCode == DOWN){
  player.speed_y = 0;
 }
 else if (keyCode == UP){
  player.speed_y = 0; 
 }
}

void mousePressed(){
 if (menu == true && mouseX > 231 && mouseX < 466 & mouseY > 242 && mouseY < 349){      //main game
      background(255);
      p = new BackGround("data/background.jpg");
      player.display();      
      menu = false;
    }
    
  else if (menu == true && mouseX > 62 && mouseX < 264 & mouseY > 518 && mouseY < 578){       //instuctions
      background(255);
      p = new BackGround("data/instruction.png");
      instruc = true;
      menu = false;
    }
    
  else if (menu == true && mouseX > 558 && mouseX < 617 & mouseY > 516 && mouseY < 576){      //quit
      exit();
    } 

  if (instruc == true && mouseX > 75 && mouseX < 133 & mouseY > 518 && mouseY < 570){      //main game
        background(255);
        p = new BackGround("data/MainMenu.png");
        menu = true;
      }
  
  else if (instruc == true && mouseX > 560 && mouseX < 617 & mouseY > 515 && mouseY < 573){      //quit
        exit();
      } 

}

void createPlatforms(String filename){
  String[] lines = loadStrings(filename);
  for(int row = 0; row < lines.length; row++){
    String[] values = split(lines[row], ",");
    for(int col = 0; col < values.length; col++){
      if (values[col].equals("1")){
         Sprite tile = new Sprite(ground, SPRITE_SCALE);
         tile.center_x = SPRITE_SIZE/2 + col *SPRITE_SIZE - 25;
         tile.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE - 25;
         platforms.add(tile);
      }      
      else if (values[col].equals("2")){
        Sprite tile = new Sprite(brick, SPRITE_SIZE);
        tile.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE - 25;
        tile.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE - 25;
        platforms.add(tile);
      }
      
      else if (values[col].equals("3")){
        float bLeft = col * SPRITE_SIZE;
        float bRight = bLeft + 4 * SPRITE_SIZE;
        enemy = new Enemy(alien,0.1, bLeft, bRight);
        enemy.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
        enemy.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE-10;
        enemies.add(enemy);
      }      
      else if(values[col].equals("0")){
        continue; // continue with for loop, i.e do nothing.
      }

    }
  }
}
