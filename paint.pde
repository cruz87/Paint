int x, y, newX, newX2, newY;
int figura;
ArrayList<Shape> Figuras;

void setup() {
  size(900, 600);
  figura=1;   
  Figuras= new ArrayList<Shape>();
}

void draw()
{  
  rectMode(CORNERS);
  ellipseMode(CORNERS);
  background(5, 200, 30);
  fill(233);
  rect(-1, -1, 150, 600);
  fill(0, 0, 255);  
  stroke(0);
  rect(30, 30, 120, 120);
  stroke(0);
  ellipse(30, 140, 120, 230);
  stroke(0);
  triangle(75, 250, 30, 330, 120, 330);
  fill(255);
  stroke(0);
  quad(30, 350, 100, 350, 120, 390, 50, 390);
  for (Shape fig : Figuras) {
    switch(fig.figura)
    {
    case 1:
      fill(#999DB4);      
      stroke(0);
      rect(fig.x, fig.y, fig.x2, fig.y2);
      break;
    case 2:
      fill(#999DB4); 
      stroke(0);
      ellipse(fig.x, fig.y, fig.x2, fig.y2);
      break;
    case 3:
      fill(#999DB4); 
      stroke(0);
      triangle(fig.x, fig.y, fig.x2, fig.y2, fig.x3, fig.y3);
      break;
    case 4:
      fill(5, 200, 30);
      noStroke();
      rect(fig.x, fig.y, fig.x2, fig.y2);
      break;
    }
  }
  fill(#999DB4);
  stroke(0);
  switch(figura)
  {
  case 1:
    rect(x, y, newX, newY);
    break;
  case 2:
    ellipse(x, y, newX, newY);
    break;
  case 3:
    triangle(x, y, newX2, newY, newX, newY);
    break;
  case 4:
    fill(5, 200, 30);
    noStroke();
    rect(newX, newY, newX+20, newY+20);
    break;
  }
}

void mousePressed() {
  if (mouseX>=30 && mouseX<=120 && mouseY>=30 && mouseY<=120)
  {
    figura=1;
  }
  if (mouseX>=30 && mouseX<=120 && mouseY>=140 && mouseY<=230)
  {
    figura=2;
  }
  if (mouseX>=30 && mouseX<=120 && mouseY>=250 && mouseY<=330)
  {
    figura=3;
  }
  if (mouseX>=30 && mouseX<=120 && mouseY>=350 && mouseY<=390)
  {
    figura=4;
  }
  if (mouseX>150 && mouseX<900 && mouseY>0 && mouseY<600)
  {  
    x=mouseX;
    y=mouseY;
    newX=x;
    newY=y;
    newX2=x;
  }
}

void mouseDragged() {
  if (mouseX>150 && mouseX<900 && mouseY>0 && mouseY<600)
  {  
    newX=mouseX;
    if ((mouseX-(mouseX-x)*2)>150)
    {
      newX2=mouseX-(mouseX-x)*2;
    }
    newY=mouseY;
    if (figura==4)
    {
      Figuras.add(new Shape(newX, newY, newX+20, newY+20, 0, 0, 4));
    }
  }
}

void mouseReleased() {
  switch(figura)
  {
  case 1:
    Figuras.add(new Shape(x, y, newX, newY, 0, 0, 1));
    break;
  case 2:
    Figuras.add(new Shape(x, y, newX, newY, 0, 0, 2));
    break;
  case 3:
    Figuras.add(new Shape(x, y, newX2, newY, newX, newY, 3));
    break;
  default:      
    break;
  }
  x=y=newX=newX2=newY=-20;
}

class Shape {
  public int figura;
  public int x, x2, x3, y, y2, y3;

  public Shape(int x, int y, int x2, int y2, int x3, int y3, int figura) {
    this.x=x;
    this.x2=x2;
    this.x3=x3;
    this.y=y;
    this.y2=y2;
    this.y3=y3;
    this.figura=figura;
  }
}
