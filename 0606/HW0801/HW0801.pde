//マウスの左クリックのみ実装
int n = 0;
float straightLength = 300;
float theta = PI/6;

void setup(){
    size(500,500);
    fill(0);
    background(255);
    smooth();   
}

void drawTree(int num, float len, int defX, int defY){
    line(defX,defY,defX,len);
    if(num > 0){
        pushMatrix();
            translate(defX, len);
            rotate(theta);
            drawTree(num-1, len/2, 0, 0);
        popMatrix();
        pushMatrix();
            translate(defX, len);
            rotate(theta * -1);
            drawTree(num-1, len/2, 0, 0);
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
    line(width/2, height,width/2, height/2);
    drawTree(n, straightLength,width/2,height/2);
}
