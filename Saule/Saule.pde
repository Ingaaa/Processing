//Izmēri zīmēšanas laukumam (mainās atkarībā no peles novietojuma)
float X = 800;
float Y = X*0.6;
//Konstantie izmēri zīmēšanas laukumam
float constX = X;
PImage bg;
boolean clicked = false;
float angle;
void setup() {
  //Uzstāda ekrānu 1000x600 pikseļus lielu
  size(1000, 600);
  //Uzstāda fonu
  bg = loadImage("Sun.jpg");
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
  //Uzstāda viduspunktu ekrāna vidū
  translate(500, 300);
  //Ja ir noklikšķināts uz ekrāna, tad zīme rotē un leņķis ir jāpalielina,
  //lai radītu rotēšanas kustību
  if (clicked) {
    angle = angle+0.5;
  }
  rotate(radians(angle));
  //Vidus kvadrāts
  quad(-(X*0.0375), 0, 0, -(X*0.0375), (X*0.0375), 0, 0, (X*0.0375));
  //Veido zīmes "lapas", atkārtojot vienu lapu ik pēc 45 grādiem
  int r = 45;
  while (r<=360) {
    drawLeaf();
    rotate(radians(r));
    r+=45;
  }
}

void drawLeaf () {
  line(0, 0, X*0.1875, X*0.1875);
  line(X*0.1875, X*0.1875, X*0.1875, X*0.2625);
  line(X*0.1875, X*0.1875, X*0.2625, X*0.1875);
  line(X*0.1875, X*0.2625, constX*0.05375, constX*0.31875); //43, 255
}
void mouseClicked() {
  clicked = !clicked;
}