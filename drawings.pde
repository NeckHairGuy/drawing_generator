// drawings
// Nguyen Minh Duc
// www.nguyenminhduc.de
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------


void setup() {

  fullScreen(P2D);

  background(0);


}


void draw() {

  if(mousePressed){
    fill(0);
    stroke(255);
    ellipse(mouseX,mouseY,11,11);
  }


}
