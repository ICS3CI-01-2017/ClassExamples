float[] x;
float[] y;
float[] alpha;
int num;

void setup(){
  size(800,600);
  num = 1000;
   x = new float[num];
   y = new float[num];
   alpha = new float[num];
  
   
   for(int i = 0; i < num; i++){
    x[i] = random(0, width);
    y[i] = random(-height,0);
    alpha[i] = random(0,255);
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
     alpha[i] = random(0,255);
     
   }
   fill(255, 255, 255, alpha[i]);
   ellipse(x[i], y[i], 10*alpha[i]/255, 10*alpha[i]/255);
 }
 
}