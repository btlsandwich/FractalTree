private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
int[][] colors = new int[3][3];
int colorIndex = 0;
int timer = 0;
public void setup() 
{   
  size(640,480);    
  //noLoop(); 
  colors[0] = new int[]{175,140,0};
  colors[1] = new int[]{130,40,20};
  colors[2] = new int[]{78,200,1};
} 
public void draw() 
{   
  if (timer == 10) {
  background(0);   
  colorIndex++;
  if (colorIndex == 3)
    colorIndex = 0;
  stroke(colors[colorIndex][0],colors[colorIndex][1],colors[colorIndex][2]);
  line(320,480,320,380);   
  drawBranches(320,380,120,3*Math.PI/2);  
  timer = 0;
  }
  else {
    timer++;
  }
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
    drawBranches(endX2,endY2,branchLength-5,angle+30);
    drawBranches(endX3,endY3,branchLength-7,angle);
  }
} 
