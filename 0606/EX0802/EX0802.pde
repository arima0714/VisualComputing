//マウスの左クリックのみ実装
int n = 0;

void setup(){
    size(500,500);
    fill(0);
    smooth();    
    triangle(0, 0, 500, 0, 255, 255 * sqrt(3));
}

void drawGasket(float x1, float y1,float x2, float y2,float x3, float y3, int n){
    fill(255);
    triangle((x1+x2)/2,(y1+y2)/2, (x2+x3)/2,(y2+y3)/2, (x1+x3)/2,(y1+y3)/2);
    if(n > 0){
        drawGasket(x1,y1,(x1+x2)/2,(y1+y2)/2,(x1+x3)/2,(y1+y3)/2, n-1);
        drawGasket(x2,y2,(x2+x1)/2,(y2+y1)/2,(x2+x3)/2,(y2+y3)/2, n-1);
        drawGasket(x3,y3,(x3+x2)/2,(y3+y2)/2,(x3+x1)/2,(y3+y1)/2, n-1);
    }
}

void mousePressed(){
    if((mouseButton == LEFT) && (n < 8))n++;
}

void draw(){
    text("n = " + n, 10, 30);
    drawGasket(0, 0, 500, 0, 255, 255 * sqrt(3), n);
}