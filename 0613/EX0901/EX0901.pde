float angleX;
float angleY;
float angleZ;

void setup(){
    size(400,400,P3D);
    noStroke();
}

void addAngles(float diff){
    angleX += diff*1;
    angleY += diff*2;
    angleZ += diff*3;
}

void draw(){
    background(255);
    lights();
    translate(200,150,-50);
    // rotateX(map(mouseY,0,height,PI,-PI));
    // rotateY(map(mouseX,0,width,PI,-PI));
    scale(50,50,50);
    coloredCube(255);
    addAngles(0.01);
}

void coloredCube(float alpha){
    pushMatrix();
    rotateX(angleX);
    rotateY(angleY);
    rotateZ(angleZ);
        pushMatrix();
            scale(.5,.5,.5);
            beginShape(QUADS);
            fill(255,0,0,alpha);//R
            vertex(+1,-1,-1); vertex(+1,-1,+1); vertex(+1,+1,+1); vertex(+1,+1,-1);
            fill(0,255,0,alpha);//G
            vertex(+1,+1,+1); vertex(-1,+1,+1); vertex(-1,+1,-1); vertex(+1,+1,-1);
            fill(0,0,255,alpha);//B
            vertex(-1,+1,+1); vertex(+1,+1,+1); vertex(+1,-1,+1); vertex(-1,-1,+1);
            fill(255,255,0,alpha);//Y
            vertex(-1,-1,-1); vertex(-1,-1,+1); vertex(+1,-1,+1); vertex(+1,-1,-1);
            fill(255,0,0,alpha);//M
            vertex(-1,+1,-1); vertex(-1,+1,+1); vertex(-1,-1,+1); vertex(-1,-1,-1);
            fill(255,0,0,alpha);//C
            vertex(+1,+1,-1); vertex(-1,+1,-1); vertex(-1,-1,-1); vertex(+1,-1,-1);
            endShape();
        popMatrix();
    popMatrix();
}
