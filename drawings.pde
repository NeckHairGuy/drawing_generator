// drawings
// Nguyen Minh Duc
// www.nguyenminhduc.de
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------

float yoff = 0.0;
float sizeoff = 0.0;

boolean change = false;


PGraphics hires;
int scaleFactor = 5;



void setup() {

  fullScreen();
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
      hires.save("frames/"+(millis()*random(1))+"-frame-highres.png");
      println("Finished");
    }
  }
}

void draw() {

  if (mouseX == 0 && mouseY == 0) {} else {






    float s = map(noise(sizeoff),0,1,-50,50);
    int shake = 30;
    int size = 55;


    float ff = map(noise(yoff),0,1,0,255);


    //print in high res image
    beginRecord(hires);

      if(change){
       change = false;
       background(random(255),random(255),random(255));
      }
      stroke(0,random(255));

      if (frameCount % 200 > int(200/2)){
       fill(0, random(255));
      }else{
       fill(255, random(255));
      }

      if(mousePressed){
       fill(random(ff*0.1),random(ff*1.2),random(ff*0.2),random(255));
      }
      ellipse(mouseX*scaleFactor+random(shake),mouseY*scaleFactor+random(shake),size*scaleFactor+s,size*scaleFactor+s);
      hires.scale(scaleFactor);

    endRecord();
    //print end

    //print on screen
    ellipse(mouseX+random(shake),mouseY+random(shake),size+s,size+s);
    //print end

    yoff+=0.05;
    sizeoff+=0.1;

  }

}
