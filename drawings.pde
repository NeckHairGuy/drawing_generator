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

  fullScreen();
  frameRate(60);
  background(random(255),random(255),random(255));



}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      change = true;
    }
    if (keyCode == DOWN) {
       saveFrame("frames/line-######.png");
    }
  }
}

void draw() {

   stroke(0,random(255));


  if(change){
    change = false;
    background(random(255),random(255),random(255));
  }

  float s = map(noise(sizeoff),0,1,-shift,shift);

  if (frameCount % bw > int(bw/2)){
    fill(0, random(255));
  }else{
    fill(255, random(255));
  }

  if(mousePressed){

    float ff = map(noise(yoff),0,1,0,255);
    fill(random(ff*0.1),random(ff*1.2),random(ff*0.2),random(255));
  }

  ellipse(mouseX+random(shake),mouseY+random(shake),20+s,20+s);

  yoff+=0.05;
  sizeoff+=0.1;

   //saveFrame("animation/line-######.tif");

}
