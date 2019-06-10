//マウスの左クリックのみ実装
int n = 0;
float straightLength = 100;
float theta = PI/6;

void setup(){
    size(500,500);
    fill(0);
    background(255);
    smooth();   
}

void drawReef(int num, float len){
    if(num > 0){
        pushMatrix();
            rotate(theta);
            line(0,0,0,int(len));
            translate(0,int(len));
            drawReef(num-1, len/3 * 2);
        popMatrix();
        pushMatrix();
            rotate(theta * -1);
            line(0,0,0,int(len));
            translate(0,int(len));
            drawReef(num-1, len/3 * 2);
        popMatrix();
    }
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

void draw(){
    text("n = " + n, 10, 30);
    line(width/2, height,width/2, (height/5)*4);
    translate(width/2, (height/5)*4);
    rotate(PI);
    drawReef(n, straightLength);
}
