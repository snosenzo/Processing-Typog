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
  RCommand.setSegmentLength(5);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  
  if (SampleText.length() > 0) {
    RGroup grp;
    grp = font.toGroup(SampleText);
    pnts = grp.getPoints();
  }
  
  
}



void draw() {
  //background(0);
  pushMatrix();
  translate(width/2, height/2);
  for(int i = 0; i < pnts.length-1; i++ ) {
    //noStroke();
    stroke(255, 10);
    strokeWeight(2);
    //point(pnts[i].x, pnts[i].y);
    point(pnts[i].x - nx*map(noise(nx + i *.03), 0, 1, 2, 50) , pnts[i].y);
    strokeWeight(2);
    //line(pnts[i].x - map(noise(nx + i *.03), 0, 1, 2, 50) , pnts[i].y, pnts[i].x, pnts[i].y);
    //stroke(255, 0, 255, 30);
    //line(pnts[i].x - map(noise(nx + i *.02), 0, 1, 2, 50) , pnts[i].y + 2, pnts[i].x, pnts[i].y-2);
    //stroke(255, 255, 0, 30);
    //line(pnts[i].x - map(noise(nx + i *.05), 0, 1, 2, 50) , pnts[i].y + 5, pnts[i].x, pnts[i].y-8);
    //stroke(0, 255, 255, 30);
    //line(pnts[i].x - map(noise(nx + i *.08), 0, 1, 2, 50) , pnts[i].y + 5, pnts[i].x, pnts[i].y-8);
  }
  popMatrix();
  
  nx +=0.01;
}