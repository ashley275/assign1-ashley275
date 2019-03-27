/*
   Assign 1 : Open Up
   Update : 3.13.2019
*/

int spaceX = 80, spaceY = 80;

int soldierX = 0, soldierY = floor(random(2,6));
int robotX = floor(random(2,8)), robotY = floor(random(2,6));

int rayX = robotX*spaceX+25, rayY = robotY*spaceY+37;
int rayW = 0, rayMaxW = 40;

PImage skyImg, soilImg, lifeImg;
PImage groundhogImg, soldierImg, robotImg;


void setup() {
	size(640, 480, P2D);

	skyImg = loadImage("img/bg.jpg");
  soilImg = loadImage("img/soil.png");
  lifeImg = loadImage("img/life.png");
  
  groundhogImg = loadImage("img/groundhog.png");
  soldierImg = loadImage("img/soldier.png");
  robotImg = loadImage("img/robot.png");
  
}

void draw() {
  //background image
	image( skyImg, 0, 0 );
  image( soilImg, 0, spaceY*2 );
  
  //grass drawing
  noStroke();
  fill( 124, 204, 25 );
  rect( 0, spaceY*2-15, 640, 15);
  
  //sun drawing
  noStroke();
  fill( 255, 255, 0);
  ellipse( 640-50, 50, 120+10, 120+10 );
  fill( 253, 184, 19 );
  ellipse( 640-50, 50, 120, 120 );
  
  
  //life image : image width 50px & space 20px
  image( lifeImg, 10, 10 ); 
  image( lifeImg, 10+(50+20), 10 );
  image( lifeImg, 10+(50+20)+(50+20), 10);
  
  //groundhog image : image width 80px
  image( groundhogImg, 640/2-80/2, spaceY );
  
  //soldier walking
  image( soldierImg, (soldierX += 5)-spaceX, soldierY*spaceY );
  soldierX = soldierX % (640+spaceX);
  
  //robot image
  image( robotImg, robotX*spaceX, robotY*spaceY );
  
  //ray shooting
  stroke(#ff0000);
  strokeWeight(10);
  line( (rayX -= 2), rayY, rayX+rayW, rayY );
  rayW = min( rayW += 2, rayMaxW );
  if ( rayX < (robotX-2)*spaceX+25 ) {
     rayX = robotX*spaceX+25;
     rayW = 0;
  }
  
}
