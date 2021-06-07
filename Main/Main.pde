final static float moveSpeed = 5;
final static float gravity = 0.6;
final static float jump_height = 10;

final static float rightmargin = 400;
final static float leftmargin = 60;
final static float verticalmargin = 40;
float leftboundary, rightboundary;
float topboundary, bottomboundary;
float viewx = 0;
float viewy = 0;


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
  scroll();
  if (menu == false && instruc == false){
    
    player.resolvePlatformCollisions(player, platforms);
    
    for (Sprite tile: platforms){
    tile.display();
    }
    player.display();
    System.out.println(viewx);
    System.out.println(viewy);

 }
  
}

void keyPressed(){
 if(key == 'd'){
  player.change_x = moveSpeed;
 }
 else if(key == 'a'){
  player.change_x = -moveSpeed;
 }
 else if (key == ' ' && player.isOnPlatforms(player, platforms)){
  player.change_y = -jump_height;
 }
}

void keyReleased(){
if(key == 'd'){
  player.change_x = 0; 
 }
 else if(key == 'a'){
  player.change_x = 0;
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

void scroll(){
  float rightboundary=viewx+ width - rightmargin;
  if (player.getRight() > rightboundary){
    viewx += player.getRight() - rightboundary;
  }
  float leftboundary= viewx + leftmargin;
  if (player.getLeft() < leftboundary){
    viewx -= leftboundary - player.getLeft();
  }
  float bottomboundary = viewy + height - verticalmargin;
  if (player.getBottom() > bottomboundary){
    viewy += player.getBottom() - bottomboundary;
  }  
  float topboundary = viewy + verticalmargin;
  if (player.getTop() < topboundary){
    viewy -= topboundary - player.getTop();
  } 
  translate(-viewx, -viewy);
}
