BackGround p;

void setup(){
  size(700, 599);
  p = new BackGround("data/MainMenu.png");
}  

void draw(){
  if (mousePressed == true && mouseX > 231 && mouseX < 466 & mouseY > 242 && mouseY < 349){
    background(255);
    p = new BackGround("data/background.png");
  }
  else if (mousePressed == true && mouseX > 63 && mouseX < 267 & mouseY > 512 && mouseY < 577){
    background(255);
    p = new BackGround("data/instruction.png");
  }
  else if (mousePressed == true && mouseX > 560 && mouseX < 619 & mouseY > 517 && mouseY < 575){
    exit();
  }
  else if (mousePressed == true && mouseX > 15 && mouseX < 62 & mouseY > 551 && mouseY < 583){
    background(255);
    p = new BackGround("data/MainMenu.png");
  }
}

void mouseClicked(){
  //System.out.println("X:"+mouseX);
  //System.out.println("Y:"+mouseY);
}
