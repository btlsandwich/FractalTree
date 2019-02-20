private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
//PFont temp;
public void setup() 
{   
  size(640,800);    
  noLoop();
  //temp = loadFont("data/DejaVuMathTeXGyre-Regular-48.vlw");
} 
public void draw() 
{   
  background(0);
  stroke(180,140,20);
  fill(0);
  rect(80,50,480,700,20);
  textSize(100);
  fill(180,140,20);
  //textFont(temp);
  text('A',115,115);
  text('V',495,715);
  rect(504,692,15,1);
  stroke(140);
  line(80,200,230,50);
  line(560,600,410,750);
  line(80,620,460,700);
  line(80,100,130,50);
  line(560,180,180,100);
  line(560,700,510,750);
  line(320,480,320,580);   
  drawBranches(320,480,120,3*Math.PI/2);  
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  double angle3 = angle;
  branchLength = branchLength*=fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1)+x);
  int endY1 = (int)(branchLength*Math.sin(angle1)+y);
  int endX2 = (int)(branchLength*Math.cos(angle2)+x);
  int endY2 = (int)(branchLength*Math.sin(angle2)+y);
  int endX3 = (int)(branchLength*Math.cos(angle3)+x);
  int endY3 = (int)(branchLength*Math.sin(angle3)+y);
  //break
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if (branchLength > smallestBranch) {
    drawBranches(endX1,endY1,branchLength-5,angle-30);
    stroke(180,140,20);
    drawBranches(endX2,endY2,branchLength-5,angle+30);
    stroke(140);
    drawBranches(endX3,endY3,branchLength-6,angle);
  }
} 
