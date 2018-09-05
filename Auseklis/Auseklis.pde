//Izmēri zīmēšanas laukumam (mainās atkarībā no peles novietojuma)
float X = 800;
float Y = X*0.6;
//Konstantie izmēri zīmēšanas laukumam
float constX = X;
PImage bg;
boolean clicked = false;
//Leņķis, pa kuru rotēt, ja ir noklikšķināts uz ekrāna
float angle;
//Mainīgie, kas nosaka vai animācija iet uz priekšu vai atpakaļ
boolean goBack = false;
boolean goForward = true;
void setup() {
  //Uzstāda ekrānu 1000x600 pikseļus lielu
  size(1000, 600);
  //Uzstāda fonu
  bg = loadImage("Winter.jpg");
  //Uzstāda otas krāsu tumši sarkanu
  stroke(102, 35, 34);
  //Uzstāda tumši sarkanu pildījumu
  fill(102, 35, 34);
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
  //Uzstāda otas resnumu atkarībā no X
  if (X>=600) {
    strokeWeight(8);
  } else if (X>=500) {
    strokeWeight(7);
  } else if (X>=400) {
    strokeWeight(6);
  } else if (X>=300) {
    strokeWeight(5);
  } else if (X>=200) {
    strokeWeight(4);
  }
  //Ja ir noklikšķināts uz ekrāna, tad katrā kadrā maina leņķi par 0.5 grādiem
  //atkarībā no animācijas virziena.
  //Ja tiek sasniegta robeža, maina virzienu animācijai
  if (clicked) {
    if (angle==70) {
      goBack = true;
      goForward = false;
    } 
    if (angle==-70) {
      goBack = false;
      goForward = true;
    }
    if (goForward) {
      angle += 0.5;
    }
    if (goBack) {
      angle -= 0.5;
    }
  }
  translate(500, 0);
  rotate(radians(angle));
  //Uzstāda viduspunktu ekrāna vidū
  translate(0, 300);
  //Vidus kvadrāts
  quad(-(X*0.025), 0, 0, -(X*0.025), X*0.025, 0, 0, X*0.025);
  //Veido zīmes "zarus", atkārtojot vienu zaru ik pēc 45 grādiem
  int r = 90;
  while (r<=360) {
    drawBranch();
    rotate(radians(r));
    r+=90;
  }
}

void drawBranch() {
  float endPoint=X/4; //200 pie 800
  line(0, 0, endPoint, endPoint);
  //mazās līnijas uz augšu
  line(endPoint -(X*0.0375), endPoint -(X*0.0375), endPoint -(X*0.0375), endPoint -(X*0.0125));
  line(endPoint -(X*0.075), endPoint -(X*0.075), endPoint -(X*0.075), endPoint -(X*0.05));
  //mazās līnijas uz leju
  line(endPoint -(X*0.0375), endPoint -(X*0.0375), endPoint -(X*0.0125), endPoint -(X*0.0375));
  line(endPoint -(X*0.075), endPoint -(X*0.075), endPoint -(X*0.05), endPoint -(X*0.075));

  quad(-X*0.0125, X* 0.05, -X*0.1375, X* 0.175, -X*0.1375, X* 0.35, -X*0.0125, constX*0.255);
  quad(X*0.0125, X* 0.05, X*0.1375, X* 0.175, X*0.1375, X* 0.35, X*0.0125, constX*0.255);
}

void mouseClicked() {
  clicked = !clicked;
}