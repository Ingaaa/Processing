import java.util.List; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
//Izmēri zīmēšanas laukumam (mainās atkarībā no peles novietojuma)
float X = 800;
PImage bg;
boolean clicked = false;
List<Sign> signs = new ArrayList<Sign>();
void setup() {
  //Uzstāda ekrānu 1000x600 pikseļus lielu
  size(1000, 600);
  //Uzstāda fonu
  //bg = loadImage("Sun.jpg");
  //Uzstāda otas krāsu melnu
  stroke(0);
  //Uzstāda melnu pildījumu
  fill(0);
  //Uzstāda otas resnumu
  strokeWeight(6);
  for (int i=0; i<10; i++)
  {
    float rand = random(6);
    switch ((int)rand) {
    case 1:  
      signs.add(new Saule(random(50, 950), random(50, 550), random(360)));
      break;
    case 2:  
      signs.add(new Auseklis(random(50, 950), random(50, 550), random(360)));
      break;
    case 3:  
      signs.add(new Meness(random(50, 950), random(50, 550), random(360)));
      break;
    case 4: 
      signs.add(new Koks(random(50, 950), random(50, 550), random(360))); 
      break;
    case 5:  
      signs.add(new Jumis(random(50, 950), random(50, 550), random(360))); 
      break;
    case 6:  
      signs.add(new Ugunskrusts(random(50, 950), random(50, 550), random(360))); 
      break;
    default: 
      break;
    }
  }
}
void draw () {
  //Notīra fonu jeb no jauna uzstāda fona bildi
  background(255);
  //Aprēķina X atkarībā no peles novietojuma
  X=800;
  if (mouseX>=0 && mouseX<100) {
    X=800;
  } else if (mouseX>=100 && mouseX<=900) {
    X-=mouseX-100;
  } else if (mouseX>900) {
    X=0;
  }
  X=X/2;

  for (int i=0; i< signs.size(); i++) {
    signs.get(i).drawSign();
  }
}


void mouseClicked() {
  clicked = !clicked;
}
public class Sign {
  float translateX=0;
  float translateY=0;
  float radians = 0;
  Sign(float translateX, float translateY, float radians) {
    this.translateX= translateX;
    this.translateY= translateY;
    this.radians = radians;
  }
  void drawSign() {
  }
}
public class Saule extends Sign {
  Saule(float translateX, float translateY, float radians) {
    super(translateX, translateY, radians);
  }
  void drawSign() {
    pushMatrix();
    translate(translateX, translateY);
    rotate(radians(radians));
    //Vidus kvadrāts
    quad(-(X*0.0375), 0, 0, -(X*0.0375), (X*0.0375), 0, 0, (X*0.0375));
    //Veido zīmes "lapas", atkārtojot vienu lapu ik pēc 45 grādiem
    int r = 45;
    while (r<=360) {
      this.drawLeaf();
      rotate(radians(r));
      r+=45;
    }
    popMatrix();
  }
  void drawLeaf () {
    line(0, 0, X*0.1875, X*0.1875);
    line(X*0.1875, X*0.1875, X*0.1875, X*0.2625);
    line(X*0.1875, X*0.1875, X*0.2625, X*0.1875);
    line(X*0.1875, X*0.2625, X*0.05375, X*0.31875); //43, 255
  }
}

public class Auseklis extends Sign {
  Auseklis(float translateX, float translateY, float radians) {
    super(translateX, translateY, radians);
  }
  void drawSign() {
    pushMatrix();
    translate(translateX, translateY);
    rotate(radians(radians));
    //Vidus kvadrāts
    quad(-(X*0.025), 0, 0, -(X*0.025), X*0.025, 0, 0, X*0.025);
    //Veido zīmes "zarus", atkārtojot vienu zaru ik pēc 45 grādiem
    int r = 90;
    while (r<=360) {
      this.drawBranch();
      rotate(radians(r));
      r+=90;
    }
    popMatrix();
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

    quad(-X*0.0125, X* 0.05, -X*0.1375, X* 0.175, -X*0.1375, X* 0.35, -X*0.0125, X*0.255);
    quad(X*0.0125, X* 0.05, X*0.1375, X* 0.175, X*0.1375, X* 0.35, X*0.0125, X*0.255);
  }
}

public class Meness extends Sign {
  Meness(float translateX, float translateY, float radians) {
    super(translateX, translateY, radians);
  }
  void drawSign() {
    pushMatrix();
    translate(translateX, translateY);
    rotate(radians(radians));
    quad(-X*0.075, 0, 0, X*0.075, X*0.075, 0, 0, -X*0.075);
    int r = 90;
    //Veido zīmes "zarus", atkārtojot vienu zaru ik pēc 90 grādiem
    while (r<=360) {
      //Kā parametrs tika padots arī skaitlis, kuru funkciju nepieciešams izsaukt
      //Funkcijām ir neliela atšķirība - punkti kuri ir konstanti
      drawBranch();
      rotate(radians(r));
      r+=90;
    }
    popMatrix();
  }
  void drawBranch() {
    line(X*0.075, 0, X*0.15, X*0.075);
    line(X*0.075, 0, X*0.15, -X*0.075);
    line(X*0.15, X*0.075, X*0.1875, X*0.0375);
    line(X*0.15, -X*0.075, X*0.1875, -X*0.0375);
  }
}

public class Koks extends Sign {
  Koks(float translateX, float translateY, float radians) {
    super(translateX, translateY, radians);
  }
  void drawSign() {
    pushMatrix();
    translate(translateX, translateY);
    rotate(radians(radians));
    line(0, X*0.05, 0, X*0.2125);
    line(0, X*0.14375, X*0.0625, X*0.08125);
    line(0, X*0.14375, -X*0.0625, X*0.08125);
    drawSymbol(-45, X*0.04375, X*0.1, X);
    drawSymbol(-135, -X*0.04375, X*0.1, X);

    quad(-X*0.05, 0, 0, X*0.05, X*0.05, 0, 0, -X*0.05);
    pushMatrix();
    drawLines(X);
    rotate(radians(90));
    drawLines(X);
    popMatrix();

    pushMatrix();
    int r = -90;
    while (r>=-270) {
      drawLeaf1(X);
      rotate(radians(-90));
      r-=90;
    }
    popMatrix();

    drawLeaf2(X);
    pushMatrix();
    rotate(radians(-90));
    drawLeaf2(X);
    popMatrix();

    popMatrix();
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

  void drawLines (float X) {
    line (-X*0.0375, X*0.0125, X*0.0125, -X*0.0375);
    line (-X*0.025, X*0.025, X*0.025, -X*0.025);
    line (-X*0.0125, X*0.0375, X*0.0375, -X*0.0125);
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
}

public class Jumis extends Sign {
  Jumis(float translateX, float translateY, float radians) {
    super(translateX, translateY, radians);
  }
  void drawSign() {
    pushMatrix();
    translate(translateX, translateY);
    rotate(radians(radians));
    line(-X*0.0825, X*0.0825, X*0.0425, -X*0.0425);
    line(X*0.0825, X*0.0825, -X*0.0425, -X*0.0425);

    line(X*0.0425, -X*0.0425, X*0.0925, X*0.0075);
    line(-X*0.0425, -X*0.0425, -X*0.0925, X*0.0075);

    line(X*0.0925, X*0.0075, X*0.08, X*0.02);
    line(-X*0.0925, X*0.0075, -X*0.08, X*0.02);
    popMatrix();
  }
}

public class Ugunskrusts extends Sign {
  Ugunskrusts(float translateX, float translateY, float radians) {
    super(translateX, translateY, radians);
  }
  void drawSign() {
    pushMatrix();
    translate(translateX, translateY);
    rotate(radians(radians));

    //Vidus kvadrāts
    quad(-X*0.01875, -X*0.05625, X*0.01875, -X*0.05625, X*0.01875, -X*0.01875, -X*0.01875, -X*0.01875);
    quad(-X*0.01875, X*0.05625, X*0.01875, X*0.05625, X*0.01875, X*0.01875, -X*0.01875, X*0.01875);
    quad(-X*0.05625, -X*0.01875, -X*0.01875, -X*0.01875, -X*0.01875, X*0.01875, -X*0.05625, X*0.01875);
    quad(X*0.05625, -X*0.01875, X*0.01875, -X*0.01875, X*0.01875, X*0.01875, X*0.05625, X*0.01875);

    int r = 0;
    while (r<=360) {
      drawBranch();
      rotate(radians(r));
      r+=90;
    }
    popMatrix();
  }
  void drawBranch () {
    quad(X*0.01875, -X*0.01875, X*0.05625, -X*0.01875, X*0.05625, -X*0.13125, X*0.01875, -X*0.13125);
    quad(X*0.05625, -X*0.13125, X*0.05625, -X*0.09375, X*0.16875, -X*0.09375, X*0.16875, -X*0.13125);
    quad(X*0.16875, -X*0.09375, X*0.20625, -X*0.09375, X*0.20625, -X*0.20625, X*0.16875, -X*0.20625);

    quad(X*0.09375, -X*0.05625, X*0.13125, -X*0.05625, X*0.13125, -X*0.16875, X*0.09375, -X*0.16875);
    quad(X*0.09375, -X*0.05625, X*0.20625, -X*0.05625, X*0.20625, -X*0.01875, X*0.09375, -X*0.01875);
    quad(X*0.13125, -X*0.16875, X*0.13125, -X*0.20625, X*0.01875, -X*0.20625, X*0.01875, -X*0.16875);
  }
}