public class Tiles{
  float spriteSize = 50.0;
  
 
  public void createPlatforms(String fileName){
    String [] lines = loadStrings(fileName);
    for (int row = 0; row < lines.length; row++){
      String[] values = split(lines[row], ",");
       for (int col = 0; col < values.length; col++){
           if (values[col].equals("1")){
              Sprite tile = new Sprite(ground);
              tile.centerX = spriteSize/2 + col * spriteSize - 25;
              tile.centerY = spriteSize/2 + row * spriteSize - 25;
              platforms.add(tile);
           }
           if (values[col].equals("2")){
              Sprite tile = new Sprite(brick);
              tile.centerX = spriteSize/2 + col * spriteSize - 25;
              tile.centerY = spriteSize/2 + row * spriteSize - 25;
              platforms.add(tile);
           }
       }
    }
  }
  
}
