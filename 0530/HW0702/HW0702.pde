PImage img;
PImage imgGray;
PImage fixed;
int img_width;
int img_height;
int m = 2;
void setup(){
	//画像の読み込み
	img = loadImage("img.jpg");
	imgGray = loadImage("img.jpg");
	img_width = img.width;
	img_height = img.height;
	//画像のグレースケール化
	imgGray.filter(GRAY);
	//キャンバスの設定
	size(800,534);
	background(255);
	fixed = loadImage("img.jpg");
	image(fixed, 0 , 0);
	//処理をランダムな座標にて実行
	int random_x;
	int random_y;
	int ellipse_h;
	int ellipse_w;
	float rad = PI/3;
	float dx;
	float dy;
	noStroke();
	//処理を多数行う
	for(int n = 0; n < 1000000; n++){
		//ランダムに座標を設定(処理に余裕を見積もってマージンを設けている)
		random_x = int(random(m,img_width-m));
		random_y = int(random(m,img_height-m));
		//楕円の色の設定
		fill(fixed.pixels[random_x + random_y * img_width]);
		//傾きの決定
		dx = red(imgGray.pixels[random_x + 1 + random_y * img_width]) - red(imgGray.pixels[random_x - 1 + random_y * img_width]);
		dy = red(imgGray.pixels[random_x + (random_y+1) * img_width]) - red(imgGray.pixels[random_x + (random_y-1) * img_width]);
		rad = atan(dy/dx);
		//楕円の高さ・幅を決定
		//高さは画素値の勾配の大きさに比例
		ellipse_h = int(40 * sqrt(dx*dx + dy*dy)/(sqrt(255*255+255*255)));
		ellipse_w = int(30);
		//座標表に移動して楕円を書く
		pushMatrix();
			translate(random_x, random_y);
			rotate(rad);
			ellipse(0,0,ellipse_h,ellipse_w);
		popMatrix();
	}
	PImage cap = get(0,0,800,534);
	cap.save("fixed.jpg");
}