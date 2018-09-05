//Izmēri zīmēšanas laukumam (mainās atkarībā no peles novietojuma)
float X = 800;
float Y = X*0.6;
//Konstantie izmēri zīmēšanas laukumam
float constX = X;
PImage bg;
void setup() {
  //Uzstāda ekrānu 1000x600 pikseļus lielu
  size(1000, 600);
  //Uzstāda fonu
  bg = loadImage("Grain.jpg");
  //Uzstāda otas krāsu melnu
  stroke(0);
  //Uzstāda melnu pildījumu
  fill(0);
  //Uzstāda otas resnumu
  strokeWeight(10);
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

  //Zīmē mazās zīmes, kurām katrai ir noteikti konstanti nogriežņi,
  //tāpēc tiek izmantotas atšķirīgas funkcijas
  drawSign1(500, 234);
  drawSign2(400, 334);
  drawSign2(300, 434);
  drawSign2(300, 234);
  drawSign3(600, 334);
  drawSign3(700, 434);
  drawSign3(700, 234);
  drawSign4(400, 134);
  drawSign4(600, 134);
}

void drawSign1 (float translateX, float translateY) {
  pushMatrix();
  translate (translateX, translateY);
  line(-constX*0.0825, constX*0.0825, constX*0.0425, -constX*0.0425);
  line(constX*0.0825, constX*0.0825, -constX*0.0425, -constX*0.0425);

  line(constX*0.0425, -constX*0.0425, X*0.0925, X*0.0075);
  line(-constX*0.0425, -constX*0.0425, -X*0.0925, X*0.0075);

  line(X*0.0925, X*0.0075, X*0.08, X*0.02);
  line(-X*0.0925, X*0.0075, -X*0.08, X*0.02);
  popMatrix();
}

void drawSign2 (float translateX, float translateY) {
  pushMatrix();
  translate (translateX, translateY);
  line(-constX*0.0825, constX*0.0825, constX*0.0425, -constX*0.0425);
  line(X*0.0825, X*0.0825, -X*0.0425, -X*0.0425);

  line(constX*0.0425, -constX*0.0425, X*0.0925, X*0.0075);
  line(-X*0.0425, -X*0.0425, -X*0.0925, X*0.0075);

  line(X*0.0925, X*0.0075, X*0.08, X*0.02);
  line(-X*0.0925, X*0.0075, -X*0.08, X*0.02);
  popMatrix();
}

void drawSign3 (float translateX, float translateY) {
  pushMatrix();
  translate (translateX, translateY);
  line(-X*0.0825, X*0.0825, X*0.0425, -X*0.0425);
  line(constX*0.0825, constX*0.0825, -constX*0.0425, -constX*0.0425);

  line(X*0.0425, -X*0.0425, X*0.0925, X*0.0075);
  line(-constX*0.0425, -constX*0.0425, -X*0.0925, X*0.0075);

  line(X*0.0925, X*0.0075, X*0.08, X*0.02);
  line(-X*0.0925, X*0.0075, -X*0.08, X*0.02);
  popMatrix();
}

void drawSign4 (float translateX, float translateY) {
  pushMatrix();
  translate (translateX, translateY);
  line(-constX*0.0825, constX*0.0825, 0, 0);
  line(constX*0.0825, constX*0.0825, 0, 0);

  line(0, 0, X*0.0425, -X*0.0425);
  line(0, 0, -X*0.0425, -X*0.0425);

  line(X*0.0425, -X*0.0425, X*0.0925, X*0.0075);
  line(-X*0.0425, -X*0.0425, -X*0.0925, X*0.0075);

  line(X*0.0925, X*0.0075, X*0.08, X*0.02);
  line(-X*0.0925, X*0.0075, -X*0.08, X*0.02);
  popMatrix();
}