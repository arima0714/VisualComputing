void setup(){
    size(400,300,P3D);
    noStroke();
    noSmooth();
}

void draw(){
    background(255);
    translate(width/2, height/2, 0);
    rotateX(-PI/8.);
    rotateY(-PI/4.);
    drawAxis('x',color(255,0,0));
    drawAxis('y',color(0,255,0));
    drawAxis('z',color(0,0,255));
}

void drawAxis(char s, color c){
    fill(c);
    pushMatrix();
        switch(s){
            case 'x': box(200,1,1); break;
            case 'y': box(1,200,1); break;
            case 'z': box(1,1,200); break;
        }
    popMatrix();
    pushMatrix();
        switch(s){
            case 'x': translate(100,0,0); break;
            case 'y': translate(0,100,0); break;
            case 'z': translate(0,0,100); break;
        }
        sphere(3);
        text(s,5,0,0);
    popMatrix();
}
