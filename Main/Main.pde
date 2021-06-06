final static float moveSpeed = 5;
final static float gravity = 0.6;

boolean menu = true;
boolean instruc = false;

PImage brick, ground;

BackGround p;
Sprite player;
Tiles map;

ArrayList <Sprite> platforms;

void setup(){
  size(700, 599);
  imageMode(CENTER);
  p = new BackGround("data/MainMenu.png");
  player = new Sprite("data/Robo.png", 100, 200);
  map = new Tiles();
  
  platforms = new ArrayList<Sprite>();
  
  brick = loadImage("data/brick.png");
  ground = loadImage("data/ground.png");
  
  player.change_x = 0;
  player.change_y = 0;
}  

void draw(){
  background(255);
  p.current();
  if (menu == false && instruc == false){
    player.display();
    player.resolvePlatformCollisions(player, platforms);
    
    for (Sprite tile: platforms){
    tile.display();
  }
 }
  
}

void keyPressed(){
 if(keyCode == RIGHT){
  player.change_x = moveSpeed;
 }
 else if(keyCode == LEFT){
  player.change_x = -moveSpeed;
 }
 else if (keyCode == DOWN){
  player.change_y = moveSpeed;
 }
 else if (keyCode == UP){
  player.change_y = -moveSpeed;
 }
}

void keyReleased(){
if(keyCode == RIGHT){
  player.change_x = 0; 
 }
 else if(keyCode == LEFT){
  player.change_x = 0;
 }
 else if (keyCode == DOWN){
  player.change_y = 0;
 }
 else if (keyCode == UP){
  player.change_y = 0; 
 }
}

void mousePressed(){
 if (menu == true && mouseX > 231 && mouseX < 466 & mouseY > 242 && mouseY < 349){      //main game
      background(255);
      p = new BackGround("data/background.jpg");
      player.display();
      map.createPlatforms("data/map.csv");
      
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
        instruc = false;
      }
  
  else if (instruc == true && mouseX > 560 && mouseX < 617 & mouseY > 515 && mouseY < 573){      //quit
        exit();
      } 

}
