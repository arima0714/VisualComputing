// https://qiita.com/micky_dtl/items/9a5e1c3fb0e8b1be5fd9 このページを参照して作成しました。
// パラメータ。この値は何らかの手違いで変わっては困るので定数化
final float sigma_1 = 10;
final float sigma_2 = 100;
final int W = 10;

// 様々な関数などで使うためのグローバル変数
PImage img;
color[] k_pixs;
color[] img_bilateral;
int w, h;

void settings() {
    //画像のロード
  img = loadImage("img2.jpg");
  //高さと低さの設定
  w = img.width;
  h = img.height;
  //実行前後を表示するために幅はn倍に設定
  size(w*5, h);
  //元の画像データを保存している
  k_pixs = img.pixels;
  img_bilateral = new color[w*h];
  for (int i=0; i<h*w; i++) { img_bilateral[i]=color(100); }
}

void setup() {
  //縦横それぞれwのマージンを残してフィルタを実行
  for(int num = 0; num < 5; num++){
    for (int y=W; y<h-W; y++) {
      for (int x=W; x<w-W; x++) {
        color c = bilateral(x, y);
        img_bilateral[y*w+x] = c;
        set(x + w * num, y, img_bilateral[y*w+x]);
      }
    }
    //加工した画像をさらに加工するために材料となる配列に加工後の配列を代入
    k_pixs=img_bilateral.clone();
  }
}

void draw() {
}

color bilateral(int i, int j) {
  float sum_r = 0.0;
  float W_3_r = 0.0;
  float sum_g = 0.0;
  float W_3_g = 0.0;
  float sum_b = 0.0;
  float W_3_b = 0.0;
  float A = 1 / (sigma_1 * sigma_1);
  float B = 1 / (sigma_2 * sigma_2);
  for (int n=-W; n<=W; n++) {
    for (int m=-W; m<=W; m++) {
      color c_ij = k_pixs[i+j*w];
      color c_nm = k_pixs[(i+n)+(j+m)*w];
      sum_r += gauss(n*n+m*m, pow(red(c_ij)-red(c_nm), 2), A, B)*red(c_nm);
      W_3_r += gauss(n*n+m*m, pow(red(c_ij)-red(c_nm), 2), A, B);
      sum_g += gauss(n*n+m*m, pow(green(c_ij)-green(c_nm), 2), A, B)*green(c_nm);
      W_3_g += gauss(n*n+m*m, pow(green(c_ij)-green(c_nm), 2), A,B);
      sum_b += gauss(n*n+m*m, pow(blue(c_ij)-blue(c_nm), 2), A,B)*blue(c_nm);
      W_3_b += gauss(n*n+m*m, pow(blue(c_ij)-blue(c_nm), 2), A, B);
    }
  }
  return color(sum_r/W_3_r, sum_g/W_3_g, sum_b/W_3_b);
}

float gauss(float x, float y, float a, float b) {
  return exp(-a*x-b*y);
}
