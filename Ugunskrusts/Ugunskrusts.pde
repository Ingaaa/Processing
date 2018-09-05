//Izmēri zīmēšanas laukumam (mainās atkarībā no peles novietojuma) //<>// //<>// //<>// //<>// //<>// //<>// //<>//
float X = 800;
float Y = X*0.6;
//Konstantie izmēri zīmēšanas laukumam
PImage bg;
int clickedCount = 0;
float coef = 0;
void setup() {
  //Uzstāda ekrānu 1000x600 pikseļus lielu
  size(1000, 600);
  //Uzstāda fonu
  bg = loadImage("Fire.jpg");
  //Uzstāda otas krāsu baltu
  stroke(255);
  //Uzstāda baltu pildījumu
  fill(255);
  //Uzstāda otas resnumu
  strokeWeight(1);
}
void draw () {
  //Notīra fonu jeb no jauna uzstāda fona bildi
  background(bg);
  //Aprēķina X atkarībā no peles novietojuma
  X=800;
  if (mouseX>=0 && mouseX<100) {
    X=800;
  } else if (mouseX>=100 && mouseX<=900) {
    X-=mouseX-100;
  } else if (mouseX>900) {
    X=0;
  }
  //Uzstāda viduspunktu ekrāna vidū
  translate(500, 300);
  rotate(radians(45));

  //Vidus kvadrāts
  quad(-X*0.01875, -X*0.05625, X*0.01875, -X*0.05625, X*0.01875, -X*0.01875, -X*0.01875, -X*0.01875);
  quad(-X*0.01875, X*0.05625, X*0.01875, X*0.05625, X*0.01875, X*0.01875, -X*0.01875, X*0.01875);
  quad(-X*0.05625, -X*0.01875, -X*0.01875, -X*0.01875, -X*0.01875, X*0.01875, -X*0.05625, X*0.01875);
  quad(X*0.05625, -X*0.01875, X*0.01875, -X*0.01875, X*0.01875, X*0.01875, X*0.05625, X*0.01875);

  //Ja ir noklikšķināts uz ekrāna pāra skaitā, tad mazās zīmes ir jāsakļauj
  if (clickedCount%2==0) {
    if (coef>0.02) {
      //Katrā kadrā mainās koeficients, lai radītu animāciju
      coef-=0.02;
    }
  }
  //Ja ir noklikšķināts uz ekrāna nepāra skaitā, tad mazās zīmes ir jāattālina
  if (clickedCount%2==1) {
    if (coef<3) {
      coef+=0.02;
    }
  }
  //Ik pēc 90 grādiem zīmē "zarus" jeb mazās zīmes
  int r = 0;
  while (r<=360) {
    drawBranch(100*coef, 0);
    rotate(radians(r));
    r+=90;
  }
}

void drawBranch (float translateX, float translateY) {
  pushMatrix();
  translate(translateX, translateY);
  quad(X*0.01875, -X*0.01875, X*0.05625, -X*0.01875, X*0.05625, -X*0.13125, X*0.01875, -X*0.13125);
  quad(X*0.05625, -X*0.13125, X*0.05625, -X*0.09375, X*0.16875, -X*0.09375, X*0.16875, -X*0.13125);
  quad(X*0.16875, -X*0.09375, X*0.20625, -X*0.09375, X*0.20625, -X*0.20625, X*0.16875, -X*0.20625);

  quad(X*0.09375, -X*0.05625, X*0.13125, -X*0.05625, X*0.13125, -X*0.16875, X*0.09375, -X*0.16875);
  quad(X*0.09375, -X*0.05625, X*0.20625, -X*0.05625, X*0.20625, -X*0.01875, X*0.09375, -X*0.01875);
  quad(X*0.13125, -X*0.16875, X*0.13125, -X*0.20625, X*0.01875, -X*0.20625, X*0.01875, -X*0.16875);
  popMatrix();
}
void mouseClicked() {
  clickedCount += 1;
}