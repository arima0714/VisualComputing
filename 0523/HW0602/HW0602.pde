//gazou wo sayu hanten saseru

void setup(){

  PImage img = loadImage("img.png");
  int img_width = img.width;
  int img_height = img.height;
  println("img_width = " + img_width);
  println("img_height = " + img_height);
  PImage r = loadImage("img.png");
  PImage l = loadImage("img.png");
  int i = 0;
  int j = 0;
//for r
  for(int ly = 0; ly < img_height;  ly++){
  for(int lx = 0; lx < img_width/2;   lx++){
    i = ly * img_width + lx;
    j = ly * img_width + (img_width - lx - 1);
    r.pixels[j] = img.pixels[i];
  }
  }
  r.save("r.png");
//for l
  for(int ly = 0; ly < img_height;  ly++){
  for(int lx = 0; lx < img_width/2;   lx++){
    i = ly * img_width + lx;
    j = ly * img_width + (img_width - lx - 1);
    l.pixels[i] = img.pixels[j];
  }
  }
  l.save("l.png");
  size(1200, 385);
  background(255);
  image(img, 0, 0);
  image(r,400,0);
  image(l,800,0);
  PImage cap = get(0,0,1200,385);
  cap.save("sc.png");
}
