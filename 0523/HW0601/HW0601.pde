//gazou wo sayu hanten saseru

int point(PImage img, int i, int j){
	return j * img.width + i;
}

void setup(){

	PImage img = loadImage("img.png");
	int img_width = img.width;
	int img_height = img.height;
	println("img_width = " + img_width);
	println("img_height = " + img_height);
	PImage fixed = createImage(img_width, img_height, ARGB);
	for(int ly = 0; ly < img_height;	ly++){
	for(int lx = 0; lx < img_width; 	lx++){
		int i = (img_width - lx - 1) + ly * img_width;
		int j = lx + ly * img_width;
		fixed.pixels[i] = img.pixels[j];
	}
	}
	fixed.save("fixed.png");
  size(800,385);
  background(255);
  image(img, 0 , 0);
  image(fixed,400,0);
  PImage cap = get(0,0,800,400);
  cap.save("sc.png");
}
