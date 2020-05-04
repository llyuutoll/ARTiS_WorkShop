float offset = 0.0;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  //strokeWeight(10);
}

void draw() {  
  background(0);
  //translate(width/2, height/2);
  mouseX = constrain(mouseX, 10, width);
  mouseY = constrain(mouseY, 10, height);
  
  strokeWeight(noise(offset) * 10);
  
  for (int y = 0; y < height; y+=mouseY) {
    for (int x = 0; x < width; x+=mouseX) {
      stroke(map(mouseX, 10, width, 0, 361), 100, 100);
      float size = width/2 + (map(noise(offset), 0, 1, -0.5, 0.5)) * 100;
      ellipse(x, y, size, size);
      offset += 0.01;
    }
  }
}

void keyPressd() {
  if (key == ENTER) saveFrame("output.png");
}
