//マウスの左クリックのみ実装

//参考にしたWEBサイト
//http://obelisk.hatenablog.com/entry/2016/12/24/023408
//https://happycoding.io/examples/processing/creating-functions/turtle-graphics
//https://gist.github.com/nataliefreed/8483050

int n = 0;
int straightLength = 5;

float turtleX;
float turtleY;
float turtleHeading = 0;

void setup(){
    size(900,900);
    fill(0);
    background(255);
    smooth();   
    turtleX = width/2;
    turtleY = height/2;
}

void mousePressed(){
    if((mouseButton == LEFT)){
        n++;
    }
    if((n > 8)){
        clear();
        background(255);
        n = 0;
    }
}

void drawPeano(int depth, float angle){
    if(depth <= 0){
        return;
    }
    right(angle);
    drawPeano(depth - 1, -1 * angle);
    forward(straightLength);
    left(angle);
    drawPeano(depth - 1,  angle);
    forward(straightLength);
    drawPeano(depth - 1,  angle);
    left(angle);
    forward(straightLength);
    drawPeano(depth - 1, -1 * angle);
    right(angle);
}

void draw(){
    // turtleX = width/2;
    // turtleY = height/2;
    turtleX = 0 + straightLength;
    turtleY = 0 + straightLength;
    background(255);
    text("n = " + n, 10, 30);
    drawPeano(n, 90);
}


//forward()
void forward(int amount){
    float newX = turtleX + cos(radians(turtleHeading))* amount;
    float newY = turtleY + sin(radians(turtleHeading))* amount;

    line(turtleX, turtleY, newX, newY);
    turtleX = newX;
    turtleY = newY;
}

void left(float x){
    rotateTurtle(-1 * x);
}

void right(float x){
    rotateTurtle(1 * x);
}

void rotateTurtle(float degrees){
    turtleHeading += degrees;
}

//実装する関数
//forward(int x) : xだけ直線を引く
//right(float x) : xだけ右回転      //
//left(float x) : xだけ左回転       //
//実装するグローバル変数             //
//positionX : x座標の保存           //
//positionY : y座標の保存           //

// from turtle import *
// step = 10                    描く長さ
// def draw(depth, angle):      関数定義
//     if depth <= 0:           再帰の条件
//         return
//     right(angle)
//     draw(depth - 1, -angle)
//     forward(step)
//     left(angle)
//     draw(depth - 1,  angle)
//     forward(step)
//     draw(depth - 1,  angle)
//     left(angle)
//     forward(step)
//     draw(depth - 1, -angle)
//     right(angle)
// color('firebrick')
// draw(5, 90)
// input()