public class BackGround{
  PImage bg;
  String fileName;
  
  public BackGround(String fileName){
     bg = loadImage(fileName);
     image(bg, 0, 0);
  }
}
