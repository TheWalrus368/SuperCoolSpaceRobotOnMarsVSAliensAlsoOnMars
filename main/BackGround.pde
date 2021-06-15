public class BackGround{
  PImage bg;                      //variable declaration  
  String fileName;
  
  public BackGround(String fileName){
     bg = loadImage(fileName);            //this method sets the background
     image(bg, 350, 299.5);
  }
  
  public void current(){                  //this method updates the back ground to the current one
    image(bg, 350, 299.5);
  }
}
