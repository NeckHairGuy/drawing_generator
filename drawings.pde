// drawings
// Nguyen Minh Duc
// www.nguyenminhduc.de
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------

int shift = 30;
int inc = 1;
int shake = 20;
int length = 50;

float yoff = 0.0;
float sizeoff = 0.0;

float bw = 200;

boolean change = false;

void setup() {

  fullScreen(P2D);

  background(random(255),random(255),random(255));


}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      change = true;
    }
  }
}

void draw() {

  if(change){
    change = false;

    background(random(255),random(255),random(255));
  }

  float s = map(noise(sizeoff),0,1,-shift,shift);

  if (frameCount % bw > int(bw/2)){
    fill(0);
    stroke(255);
  }else{
    fill(255);
    stroke(0);
  }

  if(mousePressed){
    fill(map(noise(yoff),0,1,0,255),100,100,random(255));
    stroke(random(255),random(255),random(255),random(255));
  }

  ellipse(mouseX+random(shake),mouseY+random(shake),50+s,50+s);

  yoff+=0.25;
  sizeoff+=0.1;
}
