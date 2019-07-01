// drawings
// Nguyen Minh Duc
// www.nguyenminhduc.de
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------

float yoff = 0.0;
float sizeoff = 0.0;

boolean change = false;

float red = random(0,2);
float green = random(0,2);
float blue = random(0,2);

PGraphics hires;
int scaleFactor = 5;



void setup() {

  fullScreen(P2D);
  frameRate(60);

  hires = createGraphics(
                        width * scaleFactor,
                        height * scaleFactor,
                        JAVA2D);
  println("Generating high-resolution image...");


  beginRecord(hires);
    background(random(255),random(255),random(255));
  endRecord();


}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      change = true;
    }
    if (keyCode == DOWN) {
      endRecord();
      hires.save("frames/"+(millis()*random(1))+".png");
      println("Finished");
    }
  }
}

void draw() {

  if (mouseX == 0 && mouseY == 0) {} else {

    float s = map(noise(sizeoff),0,1,-20,20);
    int shake = 30;
    int size = 25;

    float ff = map(noise(yoff),0,1,0,255);

    //print in high res image
    beginRecord(hires);

      if(change){
       change = false;
       background(random(255),random(255),random(255));
       red = random(0,2);
       green = random(0,2);
       blue = random(0,2);
      }
      stroke(0,random(255));
      strokeWeight(1*scaleFactor*0.5);

      if (frameCount % 500 > int(500/2)){
       fill(0, random(255));
      }else{
       fill(255, random(255));
      }

      if(mousePressed){
       fill(random(ff*red)*1,random(ff*green)*1,random(ff*blue)*1,random(255));
      }
      ellipse(mouseX*scaleFactor+random(shake)*scaleFactor,mouseY*scaleFactor+random(shake)*scaleFactor,size*scaleFactor+s*scaleFactor,size*scaleFactor+s*scaleFactor);
      // hires.scale(scaleFactor);

    endRecord();
    //print end

    //print on screen
    strokeWeight(1);
    ellipse(mouseX+random(shake),mouseY+random(shake),size+s,size+s);
    //print end

    yoff+=0.05;
    sizeoff+=0.1;

  }

}
