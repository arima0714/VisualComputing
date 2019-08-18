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
  img = loadImage("input.jpg");
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
  for(int num = 0; num < 2; num++){
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
  float h = .0;
  float g_numer_r = .0;
  float g_numer_g = .0;
  float g_numer_b = .0;
  float g_denom = .0;
  for (int n=-W; n<=W; n++) {
    for (int m=-W; m<=W; m++) {
      color c_ij = k_pixs[i+j*w];
      color c_nm = k_pixs[(i+n)+(j+m)*w];
      h += h_left(m, n) * h_right(i,j,m,n,c_ij,c_nm);
      g_numer_r += h * red(c_nm);
      g_numer_g += h * green(c_nm);
      g_numer_b += h * blue(c_nm);
      sum_r += gaussian(n*n+m*m, pow(red(c_ij)-red(c_nm), 2), A, B)*red(c_nm);
      W_3_r += gaussian(n*n+m*m, pow(red(c_ij)-red(c_nm), 2), A, B);
      sum_g += gaussian(n*n+m*m, pow(green(c_ij)-green(c_nm), 2), A, B)*green(c_nm);
      W_3_g += gaussian(n*n+m*m, pow(green(c_ij)-green(c_nm), 2), A,B);
      sum_b += gaussian(n*n+m*m, pow(blue(c_ij)-blue(c_nm), 2), A,B)*blue(c_nm);
      W_3_b += gaussian(n*n+m*m, pow(blue(c_ij)-blue(c_nm), 2), A, B);
    }
  }
  return color(sum_r/W_3_r, sum_g/W_3_g, sum_b/W_3_b);
}

float gaussian(float x, float y, float a, float b) {
  return exp(-a*x-b*y);
}

float h_left(float m, float n){
  return exp(-1 * (m*m + n*n) / (2 * sigma_1*sigma_1));
}

float h_right(float i, float j, float m, float n, color pix_ij, color pix_nm){
  return exp(-1 * sq(brightness(pix_ij) - brightness(pix_nm)) / (2 * sigma_2*sigma_2));
}
