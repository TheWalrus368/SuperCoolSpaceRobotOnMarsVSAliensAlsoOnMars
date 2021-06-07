public class BackGround{
  PImage bg;
  String fileName;
  
  public BackGround(String fileName){
     bg = loadImage(fileName);
     image(bg, 350, 299.5);
  }
  
  public void current(){
    image(bg, 350, 299.5);
  }
}
