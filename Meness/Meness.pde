//Izmēri zīmēšanas laukumam (mainās atkarībā no peles novietojuma)
float X = 800;
float Y = X*0.6;
//Konstantie izmēri zīmēšanas laukumam
float constX = X;
PImage bg;
//Mainīgais, kas nosaka, vai rādīt mazās Mēness zīmes
boolean showSmall = false;
void setup() {
  //Uzstāda ekrānu 1000x600 pikseļus lielu
  size(1000, 600);
  //Uzstāda formu zīmēšanu bez pildījuma
  noFill();
  //Uzstāda otas krāsu baltu
  stroke(255);
  //Uzstāda otas resnumu
  strokeWeight(10);
  //Uzstāda fonu
  bg = loadImage("Night.jpg");
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
  //Zīmē vidējo zīmi
  drawSign(500, 300, 1);

  //Ja ir noklikšķināts uz erkāna, tad zīmē arī 4 mazās zīmes
  if (showSmall) {
    //Mazo zīmju izmērs ir uz pusi mazāks
    X=X/2;
    drawSign(250, 150, 2);
    drawSign(250, 450, 3);
    drawSign(750, 150, 3);
    drawSign(750, 450, 2);
  }
}

void drawSign (float translateX, float translateY, int function) {
  pushMatrix();
  translate(translateX, translateY);
  quad(-X*0.075, 0, 0, X*0.075, X*0.075, 0, 0, -X*0.075);
  int r = 90;
  //Veido zīmes "zarus", atkārtojot vienu zaru ik pēc 90 grādiem
  while (r<=360) {
    //Kā parametrs tika padots arī skaitlis, kuru funkciju nepieciešams izsaukt
    //Funkcijām ir neliela atšķirība - punkti kuri ir konstanti
    if (function==1) {
      drawBranch1();
    } else if (function==2) {
      drawBranch2();
    } else if (function==3) {
      drawBranch3();
    }

    rotate(radians(r));
    r+=90;
  }
  popMatrix();
}

void drawBranch1() {
  line(X*0.075, 0, constX*0.15, X*0.075);
  line(X*0.075, 0, constX*0.15, -X*0.075);
  line(constX*0.15, X*0.075, X*0.1875, X*0.0375);
  line(constX*0.15, -X*0.075, X*0.1875, -X*0.0375);
}
void drawBranch2() {
  line((constX/2)*0.075, 0, X*0.15, X*0.075);
  line((constX/2)*0.075, 0, X*0.15, -X*0.075);
  line(X*0.15, X*0.075, X*0.1875, X*0.0375);
  line(X*0.15, -X*0.075, X*0.1875, -X*0.0375);
}
void drawBranch3() {
  line(X*0.075, 0, X*0.15, X*0.075);
  line(X*0.075, 0, X*0.15, -X*0.075);
  line((constX/2)*0.15, X*0.075, X*0.1875, X*0.0375);
  line((constX/2)*0.15, -X*0.075, X*0.1875, -X*0.0375);
}

void mouseClicked() {
  showSmall = !showSmall;
}