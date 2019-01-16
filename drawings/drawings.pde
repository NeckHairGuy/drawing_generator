// state of the art
// Nguyen Minh Duc
// www.nguyenminhduc.de
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------

import java.util.*;
import spout.*;

Checkerboard board;
PImage img;  


void setup() {
  size(1920, 1080, P2D);
  img = loadImage("portrait.jpg");
  board = new Checkerboard(1920,1080,2,255);

  board.fillImage(img);
  board.display();

  background(0);
  
 
  
}


void draw() {


  board.evolveXOR(2);
  board.display();
  delay(100);
  

}
