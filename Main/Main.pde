final static float moveSpeed = 5;
boolean menu = true;
boolean instruc = false;

BackGround p;
Sprite player;

void setup(){
  size(700, 599);
  p = new BackGround("data/MainMenu.png");
  player = new Sprite("data/Robo.png", 100, 200);
  
  player.speedX = 0;
  player.speedY = 0;
}  

void draw(){
  background(255);
  p.current();
  if (menu == false){
    player.display();
    player.move();
  }
  
}
void keyPressed(){
 if(keyCode == RIGHT){
  player.speedX = moveSpeed;
 }
 else if(keyCode == LEFT){
  player.speedX = -moveSpeed;
 }
 else if (keyCode == DOWN){
  player.speedY = moveSpeed;
 }
 else if (keyCode == UP){
  player.speedY = -moveSpeed;
 }
}

void keyReleased(){
if(keyCode == RIGHT){
  player.speedX = 0; 
 }
 else if(keyCode == LEFT){
  player.speedX = 0;
 }
 else if (keyCode == DOWN){
  player.speedY = 0;
 }
 else if (keyCode == UP){
  player.speedY = 0; 
 }
}

void mousePressed(){
 if (menu == true && mouseX > 231 && mouseX < 466 & mouseY > 242 && mouseY < 349){      //main game
      background(255);
      p = new BackGround("data/background.png");
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

System.out.println("X: " + mouseX);
System.out.println("Y: " + mouseY);



}
