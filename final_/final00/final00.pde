// パラメータの設定
// この値は不変である必要があるので定数化

// finalのリファレンスは下記URL
// https://processing.org/reference/final.html
final float sigma_1 = 10;
final float sigma_2 = 100;
final int W = 10;

// グローバル変数の設定

// PImageの参照ページは下記URL
// http://www.musashinodenpa.com/p5/index.php?pos=995
PImage img;
color[] k_pixs;
color[] img_bilateral;
int w;
int h;

// 初期化関数の設定
void settings(){
    img = loadImage("input.jpg");
    // 高さと低さの設定
    w = img.width;
    h = img.height;
    // 実行前後を表示するために幅は5倍に設定
    size(w*5, h);
    // 元画像データを保存
    k_pixs = img.pixels;
    img_bilateral = new color[w*h];
    for(int i = 0; i < h*w ; i++){
        img_bilateral[i] = color(100);
    }
}

void setup(){
    // 縦横それぞれWのマージンを残してフィルタを実行
    for( int num = 0; num < 5 ; num++){
        for( int y = W; y<h-W; y++){
            for( int x = W; x<w-W; x++){
                color c = bilateral(x,y);
                img_bilateral[y*w+x] = x;
                set(x+w*num, y, img_bilateral[y*w+x]);
            }
        }
        k_pixs = img_bilateral.clone();
    }
}

void draw(){}

color bilateral(int i, int j){
    float sum_r = 0.0;
    float w_3_r = 0.0;
    float sum_g = 0.0; 
    float w_3_g = 0.0;
    float sum_b = 0.0;
    float w_3_b = 0.0;
    float A = 1 / (sigma_1 * sigma_1);
    float B = 1 / (sigma_2 * sigma_2);
    for(int n = -W; n <= W; n++){
        for(int m = -W; m <= W; m++){
            color c_ij = k_pixs[i+j*w];
            color c_nm = k_pixs[(i+n)+(j+m)*w];
            sum_r += gauss(n*n+m*m, pow(red(c_ij)-red(c_nm), 2), A, B) * red(c_nm);
            w_3_r += gauss(n*n+m*m, pow(red(c_ij)-red(c_nm), 2), A, B);
            sum_g += gauss(n*n+m*m, pow(green(c_ij)-green(c_nm), 2), A, B) * green(c_nm);
            w_3_g += gauss(n*n+m*m, pow(green(c_ij)-green(c_nm), 2), A, B);
            sum_b += gauss(n*n+m*m, pow(blue(c_ij)-blue(c_nm), 2), A, B) * blue(c_nm);
            w_3_b += gauss(n*n+m*m, pow(blue(c_ij)-blue(c_nm), 2), A, B);
        }
    }
    return color(sum_r/w_3_r, sum_g/w_3_g, sum_b/w_3_b);
}

float gauss(float x, float y, float a, float b){
    return exp(-a*x-b*y);
}
