void setup(){
    size(500,500,P3D);
}

void draw(){
    background(256,256,256);
    rotateX(map(mouseY,0,width,PI,-PI));
    rotateY(map(mouseX,0,height,PI,-PI));
    fill(256,0,0);
    //胴体
    pushMatrix();
        translate(width/2,height/2);
        box(70,100,75);
    popMatrix();
    //頭
    pushMatrix();
        translate(width/2,height/2 - 80);
        box(50,50,50);
    popMatrix();
    //腕
    pushMatrix();
        fill(0,256,0);
        translate(width/2 + 55,height/2 - 15);
        box(30,70,50);
    popMatrix();
    //腕
    pushMatrix();
        translate(width/2 - 55,height/2 - 15);
        box(30,70,50);
    popMatrix();
    //足
    pushMatrix();
        fill(0,256,0);
        translate(width/2 - 15,height/2 + 90);
        box(30,70,50);
    popMatrix();
    //足
    pushMatrix();
        translate(width/2 + 15,height/2 + 90);
        box(30,70,50);
    popMatrix();
}
