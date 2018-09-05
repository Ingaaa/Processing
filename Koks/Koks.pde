//Izmēri zīmēšanas laukumam //<>// //<>// //<>// //<>//
float X1 = 0, X2=0, X3=0, X4=0;
PImage bg;
//Kadru skaits animācijā
int numFrames = 290;
//Pašreizējais kadrs
int currentFrame = 0;
//Koka centra koordinātas
float translateX = 500;
float translateY = 350;
void setup() {
  //Uzstāda ekrānu 1000x600 pikseļus lielu
  size(1000, 600);
  //Uzstāda fonu
  bg = loadImage("Tree.jpg");
  //Uzstāda otas krāsu baltu
  stroke(255);
  //Uzstāda bez pildījuma;
  noFill();
  //Uzstāda otas resnumu
  strokeWeight(6);
  //Uzstāda kadru skaitu sekundē
  frameRate(24);
}
void draw () {
  //Nosaka pašreizējo kadru
  currentFrame = (currentFrame+1) % numFrames;
  //Notīra fonu jeb no jauna uzstāda fona bildi
  background(bg);

  //Uzstāda viduspunktu ekrāna vidū vai tur, kur lietotājs noklikšķinājis
  translate(translateX, translateY);
  //Pirmais animācijas posms - kadri 1-40, atpakaļ ejot kadri 250-290
  if (currentFrame>=1) {
    if (currentFrame<250) {
      if (X1<800) {
        X1+=20;
      }
    }
    if (currentFrame>=250) {
      if (X1>0) {
        X1-=20;
      }
    }
    if (X1>0) {
      line(0, X1*0.05, 0, X1*0.2125);
      line(0, X1*0.14375, X1*0.0625, X1*0.08125);
      line(0, X1*0.14375, -X1*0.0625, X1*0.08125);
      drawSymbol(-45, X1*0.04375, X1*0.1, X1);
      drawSymbol(-135, -X1*0.04375, X1*0.1, X1);
    }
  }
  //Otrais animācijas posms - kadri 40-60, atpakaļ ejot kadri 230-250
  if (currentFrame>=40) {
    if (currentFrame<230) {
      if (X2<800) {
        X2+=40;
      }
    }
    if (currentFrame>=230) {
      if (X2>0) {
        X2-=40;
      }
    }
    if (X2>0) {
      quad(-X2*0.05, 0, 0, X2*0.05, X2*0.05, 0, 0, -X2*0.05);
      pushMatrix();
      drawLines(X2);
      rotate(radians(90));
      drawLines(X2);
      popMatrix();
    }
  }
  //Trešais animācijas posms - kadri 60-100, atpakaļ ejot kadri 190 - 230
  if (currentFrame>=60) {
    if (currentFrame<190) {
      if (X3<800) {
        X3+=20;
      }
    }
    if (currentFrame>=190) {
      if (X3>0) {
        X3-=20;
      }
    }
    if (X3>0) {
      pushMatrix();
      int r = -90;
      while (r>=-270) {
        drawLeaf1(X3);
        rotate(radians(-90));
        r-=90;
      }
      popMatrix();
    }
  }
  //Ceturtais animācijas posms - kadri 100-140, stāvot uz vietas kadri 140-150
  //atpakaļ ejot kadri 150-190
  if (currentFrame>=100) {
    if (currentFrame<150) {
      if (X4<800) {
        X4+=20;
      }
    }
    if (currentFrame>=150) {
      if (X4>0) {
        X4-=20;
      }
    }
    if (X4>0) {
      drawLeaf2(X4);
      pushMatrix();
      rotate(radians(-90));
      drawLeaf2(X4);
      popMatrix();
    }
  }
}

void drawLeaf1 (float X) {
  //pamata līnija
  line(X*0.05, 0, X*0.3375, 0);
  //pirmā zvaigzne
  line (X*0.1, X*0.0375, X*0.1, -X*0.0375);
  line (X*0.075, -X*0.025, X*0.125, X*0.025);

  line (X*0.075, X*0.025, X*0.125, -X*0.025);
  //otrais
  drawSymbol(0, X*0.175, 0, X);

  //tresais
  quad(X*0.24375, 0, X*0.2625, -X*0.01875, X*0.28125, 0, X*0.2625, X*0.01875);
  pushMatrix();
  translate(X*0.2625, 0);
  line(0, -X*0.05625, 0, X*0.05625);
  int r = 0;
  while (r<=360) {
    line(-X*0.01875, 0, -X*0.0375, -X*0.01875);
    line(-X*0.01875, 0, -X*0.0375, X*0.01875);
    rotate(radians(r));
    r+=90;
  }
  popMatrix();
}
void drawLeaf2 (float X) {
  line(0, 0, X*0.1875, -X*0.1875);
  drawSymbol(-45, X*0.16875, -X*0.16875, X);
  line(X*0.0875, -X*0.1375, X*0.1375, -X*0.0875);
  drawSymbol(-135, X*0.0875, -X*0.1375, X);
  drawSymbol(45, X*0.1375, -X*0.0875, X);

  line(X*0.05, -X*0.05, X*0.05, -X*0.075);
  line(X*0.05, -X*0.05, X*0.075, -X*0.05);
}
void drawLines (float X) {
  line (-X*0.0375, X*0.0125, X*0.0125, -X*0.0375);
  line (-X*0.025, X*0.025, X*0.025, -X*0.025);
  line (-X*0.0125, X*0.0375, X*0.0375, -X*0.0125);
}

void drawSymbol(float r, float x, float y, float X) {
  pushMatrix();
  translate(x, y);
  rotate(radians(r));
  line (0, 0, X*0.01875, -X*0.01875);
  line (X*0.01875, -X*0.01875, 0, -X*0.0375);
  line (0, -X*0.0375, -X*0.01875, -X*0.01875);

  line (0, 0, X*0.01875, X*0.01875);
  line (X*0.01875, X*0.01875, 0, X*0.0375);
  line (0, X*0.0375, -X*0.01875, X*0.01875);
  popMatrix();
}

void mouseClicked() {
  //Pēc noklikšķināšanas uz ekrāna tiek saglabātas kursora koordinātas
  translateX = mouseX;
  translateY=mouseY;
}