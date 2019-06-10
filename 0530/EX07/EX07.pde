void setup(){
	//gazou yomikomi
	PImage img = loadImage("img.jpg");
	int img_width = img.width;
	int img_height = img.height;
	//kyanbasu no settei
	size(800,534);
	background(255);
	PImage fixed = loadImage("img.jpg");
	image(fixed, 0 , 0);
	//モザイク化を30回実行
	int random_x;
	int random_y;
	int random_h;
	int random_w;
	noStroke();
	for(int n = 0; n < 9000; n++){
		random_x = int(random(img_width));
		random_y = int(random(img_height));
		random_h = int(random(20,60));
		random_w = int(random(20,40));
		//座標表に移動して楕円を書く
		fill(img.pixels[random_y * random_x]);
		pushMatrix();
			translate(random_x, random_y);
			rotate(PI/3);
			ellipse(0,0,random_h,random_w);
		popMatrix();
	}
	PImage cap = get(0,0,800,534);
	cap.save("fixed.jpg");
}
