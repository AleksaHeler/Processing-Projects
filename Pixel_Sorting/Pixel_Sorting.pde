// A terrible way to sort pixels
// Takes some time

PImage img;
PImage sorted;
int index = 0;

void setup() {
  size(800, 400);

  img = loadImage("rainbow.jpg");
  sorted = createImage(img.width, img.height, RGB);
  sorted = img.get();
}

void draw() {
  println(frameRate);

  sorted.loadPixels();

  // Selection sort!
  for (int n = 0; n < 10; n++) {
    float record = -1;
    int selectedPixel = index;
    for (int j = index; j < sorted.pixels.length; j++) {
      color pix = sorted.pixels[j];
      float b = hue(pix);
      if (b > record) {
        selectedPixel = j;
        record = b;
      }
    }

    // Swap selectedPixel with i
    color temp = sorted.pixels[index];
    sorted.pixels[index] = sorted.pixels[selectedPixel];
    sorted.pixels[selectedPixel] = temp;

    if (index < sorted.pixels.length -1) {
      index++;
    }
  }


  sorted.updatePixels();

  background(0);
  image(img, 0, 0);
  image(sorted, 400, 0);
}
