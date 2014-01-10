DraggableHouse house;
Draggable_Triangle roof;
DraggableWindows window;
DraggableWind wind;
DraggableDoor door;


String[] headlines = {
  "Let's play a game called building the house." 
};

PFont f; // Global font variable
float x; // Horizontal location
int index = 0;


void setup() {
  size(800,800);
  smooth();
  house = new DraggableHouse(120,120,120,120);
   roof= new Draggable_Triangle(width/2,height/2,120);
   window = new DraggableWindows(20,20,20,20);
   wind = new DraggableWind(600,400,20,20);
   door = new DraggableDoor( 100,100,20,40);
   
   f = createFont( "Arial" ,16,true);
    x = width;
}

void draw() {
 
  
  //background
  noStroke();
   background(163,214,237);
    fill(118,211,111);
  ellipse(500,620,800,300);//1
  ellipse(600,650,750,400);//2
  ellipse(100,650,825,400);
 

  
  //clouds
   noFill();
  fill(206,233,240);
   ellipse(95,95,55,55);
   ellipse(125,85,30,30);
   ellipse(120,80,30,30);//first cluster of background for clouds
   
   ellipse(330, 130,55,55);//second cluster of background
   ellipse(310,140,30,30);
   ellipse(320,150,40,40);
   
   ellipse(550,200,55,55);//third cluster
   ellipse(540,210,30,30);
   ellipse(530,220,40,40);
   
   ellipse(740,80,55,55);//fourth cluster
   ellipse(720,90,30,30);
   ellipse(730,100,40,40);
   
   
  noFill();
  fill(255);
   ellipse(100, 100, 55, 55);//first cluster of clouds
   ellipse(130,90,30,30);
   ellipse(120,110,40,40);
   
   ellipse(335, 135,55,55);//second cluster of clouds
   ellipse(325,145,30,30);
   ellipse(315,155,40,40);
   
   ellipse(555,205,55,55);//third
   ellipse(535,215,30,30);
   ellipse(545,225,40,40);
   
   ellipse(745,85,55,55);//fourth
   ellipse(725,95,30,30);
   ellipse(735,105,40,40);
   
    textFont(f,16);
  textAlign (LEFT);
  
  // A specific String from the array is displayed according to the value of the "index" variable.
  text(headlines[index],x,180); 
  
  // Decrement x
  x = x - 2; //adjust - 2 to change speed
  
  // If x is less than the negative width, then it is off the screen
  //ie. if text is 10 wide needs to be at x = -10 to be off screen
  // textWidth() is used to calculate the width of the current String.
  float w = textWidth(headlines[index]); 
  if (x < -w) {
    x = width; //go back to other side
    
    // index is incremented when the current String has left the screen in order to display a new String.
    index++;
    if (index>= headlines.length) index=0;
  }
   
   //draw in the lines
//   noFill();
//   fill(155,0);
//   rect(120,120,120,120)
//   triangle(width/2,height/2,120);
 
 
 
   
// d.rollover(mouseX,mouseY);
  house.drag(mouseX,mouseY);
  house.display();
  roof.drag(mouseX,mouseY);
  roof.display();
  window.drag(mouseX,mouseY);
  window.display();
  wind.drag(mouseX,mouseY);
  wind.display();
  door.drag(mouseX,mouseY);
  door.display();
}

void mousePressed() {

  house.clicked(mouseX,mouseY);
  roof.clicked(mouseX,mouseY);
  window.clicked(mouseX,mouseY);
  wind.clicked(mouseX,mouseY);
  door.clicked(mouseX,mouseY);
}

void mouseReleased() {
  house.stopDragging();
  roof.stopDragging();
  window.stopDragging();
  wind.stopDragging();
  door.stopDragging();
}

