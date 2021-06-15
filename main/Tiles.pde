public class Tiles{
  float spriteSize = 50.0;          //setting the standard sprite size
  
 
  public void createPlatforms(String fileName){                                    //this method is an algorithm that uses the .csv files to create the levels and place the enemies
    String [] lines = loadStrings(fileName);
    for (int row = 0; row < lines.length; row++){
      String[] values = split(lines[row], ",");
       for (int col = 0; col < values.length; col++){
           if (values[col].equals("1")){                                          //if there is a 1 in the file it will place a ground block
              Sprite tile = new Sprite(ground);
              tile.center_x = spriteSize/2 + col * spriteSize - 50;
              tile.center_y = spriteSize/2 + row * spriteSize;
              platforms.add(tile);
           }
           if (values[col].equals("2")){                                          //if there is a 2 in the file it will place a brick block
              Sprite tile = new Sprite(brick);
              tile.center_x = spriteSize/2 + col * spriteSize - 50;
              tile.center_y = spriteSize/2 + row * spriteSize;
              platforms.add(tile);
           }
           if (values[col].equals("5")){                                          //if there is a 5 in the file it will place the rocket
              Sprite tile = new Sprite(rocket);
              tile.center_x = spriteSize/2 + col * spriteSize - 50;
              tile.center_y = spriteSize/2 + row * spriteSize;
              rocketship.add(tile);
           }           
           else if (values[col].equals("3")){                                    //if there is a 3 in the file it will place an enemy
              float bLeft = col * spriteSize - 50;                               //if there is a 0 it will place nothing and check the next number
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
