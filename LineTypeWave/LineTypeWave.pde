import geomerative.*;

RFont font;
String SampleText = "Progress";
RPoint[] pnts;
float nx = 0;
void setup() {
  size(1200, 500);
  background(0);
  fill(255);
  stroke(255);
  pixelDensity(2);
  RG.init(this);
  font = new RFont("Helvetica.ttf", 230, RFont.CENTER);
  
  // define points along font outline
  RCommand.setSegmentLength(10);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  
  if (SampleText.length() > 0) {
    RGroup grp;
    grp = font.toGroup(SampleText);
    pnts = grp.getPoints();
  }
  
  
}



void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  for(int i = 0; i < pnts.length-1; i++ ) {
    //noStroke();
    stroke(255, 80);
    strokeWeight(2);
    point(pnts[i].x, pnts[i].y);
    strokeWeight(3);
    line(pnts[i].x - map(noise(nx + i *.01), 0, 1, 2, 50) , pnts[i].y, pnts[i].x, pnts[i].y);
  }
  popMatrix();
  
  nx +=0.01;
}