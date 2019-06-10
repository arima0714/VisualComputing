//マウスの左クリックのみ実装
int n = 0;
int straightLength = 20;

void setup(){
    size(500,500);
    fill(0);
    background(255);
    smooth();   
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
    drawPeano(depth - 1, 2*angle);
    forward(straightLength);
    left(angle);
    drawPeano(depth - 1,  angle);
    forward(straightLength);
    drawPeano(depth - 1,  angle);
    left(angle);
    forward(straightLength);
    drawPeano(depth - 1, 2*angle);
    right(angle);
}

void draw(){
    text("n = " + n, 10, 30);
    translate(width/2,height/2);
    drawPeano(n,PI/2);
}

int positionX=0;
int positionY=0;

//forward()
void forward(int x){
    line(positionX,positionY,positionX,x);
    positionY = x;

}

void left(float x){
    translate(positionX, positionY);
    rotate(PI * -1 / 2);
    positionX = 0;
    positionY = 0;
}

void right(float x){
    translate(positionX, positionY);
    rotate(PI / 2);
    positionX = 0;
    positionY = 0;
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