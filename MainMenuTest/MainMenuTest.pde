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
  
}

void mouseClicked(){
  //System.out.println("X:"+mouseX);
  //System.out.println("Y:"+mouseY);
}
