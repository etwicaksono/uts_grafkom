void setup(){
size(720,480);
  
}

//timeline
int tl = 0;
int xx = 0;
int ms = 0;
int xms = 0;
boolean tlch = false;
boolean msch = false;
void timeline(){
  int x = second();
  if (x != xx){
    tl += 1;
    tlch = true;
  }else{
    tlch = false;
  }
  xx = x;
  if (xms != ms){
    msch = true;
  }else{
    msch = false;
  }
  ms += 1;
  
  if (ms==60){
    ms = 0;
  }
  text(tl+":"+ms, 100,100);
}

void draw(){
smooth();
background(255);

timeline();
laut();
pantai();
pulau();
rumah();
pohon();
kapal();
angin();
//grid();
}

//laut
void laut(){
  fill(#1A0DDB);
rect(0,400,width,400);
}

//pantai
void pantai(){
  fill(150);
triangle(400,400,500,390,510,400);
}

//pulau
void pulau(){
  fill(#5F3405);
rect(500,390,220,10);
}

//rumah
void rumah(){
  noStroke();
  fill(#FF030B);
  rect(625,325,75,65);
  triangle(600,325,720,325,660,300);
  fill(#B47152);
  rect(630,340,30,50);
  rect(668,345,30,30);
  stroke(#000000);
}

//pohon
void pohon(){
noStroke();
fill (#20F716);
rumput(520,390,10,5,10);
rumput(525,390,30,15,20);
rumput(530,390,50,25,30);
rumput(535,390,60,30,35);
rumput(540,390,50,25,30);
rumput(545,390,40,20,25);

stroke(#000000);
}


float ms_gr = 0;
boolean left = true;
void rumput(float x, float y, float a, float gril, float grir){
  text("gritr = "+ ms_gr, 100,150);
  if (msch == true){
    ms_gr += 1;
  }
  if (tl < 10){
    left = true;
  }else{
    left = false;
  }
  
  if (left == true){//main
  if (tl % 2 == 0){
      triangle(x,y,x+2,y-a,x+4,y);
    }else{
      triangle(x,y,x-gril,y-a,x+4,y);
    }
  }else{//main
  if (tl % 2 == 0){
      triangle(x,y,x+2,y-a,x+4,y);
    }else{
      triangle(x,y,x+grir,y-a,x+4,y);
    }
  }
  
  
//===============
      //if (tl < 2){
      //  if (tl % 2 == 0){
      //    triangle(x,y,x+2,y-a,x+4,y);
      //  }else{
      //    triangle(x,y,x-gril,y-a,x+4,y);
      //  }
      //}else{
      //  if (tl % 2 == 0){
      //    triangle(x,y,x+2,y-a,x+4,y);
      //  }else{
      //    triangle(x,y,x+grir,y-a,x+4,y);
      //  }
      //}
//=======================
}

//kapal
float xaxis = 0;
float xaxis3 = 0;
float speed = 1;
float speed3 = 1;
void kapal(){
  if (tl > 2 && tl < 10){
    left = true;
    xaxis = xaxis + speed;
  }else if(tl>10 && tl < 18.5){
    left = false;
    xaxis = xaxis + speed;
  }
  
  if(left==true){
    //kapal angin darat
    fill(#F203FF);
    quad(250-xaxis,375,275-xaxis,400,375-xaxis,400, 400-xaxis,375);
    line(325-xaxis,375,325-xaxis,275);
    triangle(325-xaxis,275,400-xaxis,370,325-xaxis,370);
    fill(#F203FF);
    arc(325-xaxis,370,150,190,-PI,-PI+HALF_PI);
    fill(255);
    arc(325-xaxis,323,50,95,PI/2, 3*PI/2);
    }else{
    //kapal angin laut
    fill(#F203FF);
    quad(-450+xaxis,375,-475+xaxis,400,-575+xaxis,400, -600+xaxis,375);
    line(-525+xaxis,375,-525+xaxis,275);
    triangle(-525+xaxis,275,-600+xaxis,370,-525+xaxis,370);
    fill(#F203FF);
    arc(-525+xaxis,370,150,190,-PI/2,0);
    fill(255);
    arc(-525+xaxis,323,50,95,-PI/2,PI/2);
  }
}

float xaxis2 = 0;
float speed2 = 10;
void angin(){
  if (tl < 9){
    left = true;
    xaxis2 = xaxis2 + speed2;
  }else if(tl>8 && tl < 19){
    left = false;
    xaxis2 = xaxis2 + speed2;
  }
  
  if(left==true){
   float i = 0;
   while(i < 1){
   fill(#08FFF1);
   noStroke();
   rect(735-xaxis2,190,100+i,20);
   triangle(735-xaxis2,175,715-xaxis2,200,735-xaxis2,225);
   fill(#6FFFF7);
   rect(835-xaxis2,190,10,20);
   fill(#C6FFFC);
   rect(845-xaxis2,190,10,20);
   fill(#E8FFFE);
   rect(855-xaxis2,190,10,20);
   i++;
   }
   if(xaxis2 > width+150){
    xaxis2 = 0;
   }
  }else{
   float i = 0;
   while(i < 1){
   fill(#08FFF1);
   noStroke();
   rect(-165+xaxis2,190,100,20);
   triangle(-65+xaxis2,175,-50+xaxis2,200,-65+xaxis2,225);
   fill(#6FFFF7);
   rect(-165+xaxis2,190,10,20);
   fill(#C6FFFC);
   rect(-175+xaxis2,190,10,20);
   fill(#E8FFFE);
   rect(-185+xaxis2,190,10,20);
   i++;
   }
   if(xaxis2 > width+150){
    xaxis2 = 0;
   }
  }
}

//garis bantu
void grid(){
  for(int i = 0;i<=width;i+=50){
  line(i,0,i,height);
  line(0,i,width,i);
}
}
