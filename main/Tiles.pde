public class Tiles{
  float spriteSize = 50.0;
  
 
  public void createPlatforms(String fileName){
    String [] lines = loadStrings(fileName);
    for (int row = 0; row < lines.length; row++){
      String[] values = split(lines[row], ",");
       for (int col = 0; col < values.length; col++){
           if (values[col].equals("1")){
              Sprite tile = new Sprite(ground);
              tile.center_x = spriteSize/2 + col * spriteSize - 50;
              tile.center_y = spriteSize/2 + row * spriteSize;
              platforms.add(tile);
           }
           if (values[col].equals("2")){
              Sprite tile = new Sprite(brick);
              tile.center_x = spriteSize/2 + col * spriteSize - 50;
              tile.center_y = spriteSize/2 + row * spriteSize;
              platforms.add(tile);
           }
           if (values[col].equals("5")){
              Sprite tile = new Sprite(rocket);
              tile.center_x = spriteSize/2 + col * spriteSize - 50;
              tile.center_y = spriteSize/2 + row * spriteSize;
              rocketship.add(tile);
           }           
           else if (values[col].equals("3")){
              float bLeft = col * spriteSize - 50;
              float bRight = bLeft + 5 * spriteSize;
              enemy = new Enemy(alien, bLeft, bRight);
              enemy.center_x = spriteSize/2 + col * spriteSize;
              enemy.center_y = spriteSize/2 + row * spriteSize + 5;
              enemies.add(enemy);
          }      
      
       }
    }
  }
  
}
