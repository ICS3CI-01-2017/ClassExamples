float[] x;
float[] y;
float[] r;
float[] g;
float[] b;
int num;

void setup(){
  size(800,600);
  num = 200;
   x = new float[num];
   y = new float[num];
   r = new float[num];
   g = new float[num];
   b = new float[num];
   
   for(int i = 0; i < num; i++){
    x[i] = random(0, width);
    y[i] = random(-height,0);
    r[i] = random(0,255);
    g[i] = random(0,255);
    b[i] = random(0,255);
   }
}

void draw(){
 background(0);
 for(int i = 0; i < num; i++){
   y[i] = y[i] + 3;
   if(y[i] > height){
     // generate new coordinate
     x[i] = random(0, width);
     y[i] = 0;
     r[i] = random(0,255);
     g[i] = random(0,255);
     b[i] = random(0,255);
   }
   fill(r[i], g[i], b[i]);
   ellipse(x[i], y[i], 10, 10);
 }
 
}