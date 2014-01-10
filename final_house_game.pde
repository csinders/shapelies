

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioSnippet applause;
AudioPlayer instructions;


PImage img;
PImage ourImage;
PImage myImage;
PImage anImage;
PImage finalImage;

DraggableHouse house;
Draggable_Triangle roof;
DraggableWindows window;
DraggableWind wind;
DraggableDoor door;


int theta; 

PFont font;

boolean onStartPage = true; 

boolean sunWasClicked = false;

void setup() {
  size(800,800);
  smooth();
 
 
  // instantiate a Minim object
  minim = new Minim(this);
  // load a file, default sample buffer size is 1024
  applause = minim.loadSnippet("32865__oniwe__smallaudienceclapsyahoo.wav");
  instructions = minim.loadFile("instructions.wav");
  instructions.play();
  
  
 
  
  font = loadFont("SansSerif-48.vlw");
  textFont(font, 48);

  //house = new DraggableHouse(120,120,120,120);
  // roof= new Draggable_Triangle(width/2,height/2,120);
   //window = new DraggableWindows(20,20,20,20);
  // wind = new DraggableWind(600,400,20,20);
  // door = new DraggableDoor( 100,100,20,40);
   
   img=loadImage("house.png");
    house= new DraggableHouse (img, 300,600,img.width, img.height);
    
    ourImage= loadImage("roof.png");
    roof= new Draggable_Triangle (ourImage, 450,80,ourImage.width, ourImage.height);
    
    myImage=loadImage("window.png");
    window = new DraggableWindows (myImage, 400,150,myImage.width, myImage.height); 
    
    anImage=loadImage("window1.png");
   wind= new DraggableWind (anImage, 300,200, anImage.width, anImage.height);  
  
  finalImage=loadImage("door.png");
 door= new DraggableDoor (finalImage,500,700,finalImage.width,finalImage.height); 
 
}

void draw() {
 
  if (onStartPage){
    instructions.play();
    noFill();
    background(255);
   
   stroke(0);
   strokeWeight(5);
   rect(width/2 - 80, height/2 - 40, 160, 80);
   fill(0);   
   text("START", width/2 - 75, height/2 + 15);  
 }
  else {
  
  //background
  noStroke();
   background(163,214,237);
    fill(118,211,111);
  ellipse(500,620,800,300);//1
  ellipse(600,650,750,400);//2
  ellipse(100,650,825,400);
  noFill();
  stroke(5);
  line(400,400,400,520);//sq
  line(400,520,520,520);//sq
  line(520,520,520,400);//sq
  line(400,400,460,280);//tri
  line(520,400,460,280);//tri
  
 
 noStroke();

  
  //clouds
   noFill();
 // fill(255,0,0);

  
  //The sun
   fill(245,232,111);
   ellipse(165,165,200,200);
   
   fill(0);
   ellipse(116,129,10,10);
   ellipse(206,129,10,10);
   stroke(0);
   strokeWeight(8);
   arc(186, 199,8,8, 0, HALF_PI);
   
   strokeWeight(0);
   noStroke();
   
   
 
  
   
     fill(206,233,240);
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
   
   ellipse(335, 135,55,55);//second cluster of clouds
   ellipse(325,145,30,30);
   ellipse(315,155,40,40);
   
   ellipse(555,205,55,55);//third
   ellipse(535,215,30,30);
   ellipse(545,225,40,40);
   
   ellipse(745,85,55,55);//fourth
   ellipse(725,95,30,30);
   ellipse(735,105,40,40);
   
 
   
   //draw in the lines
//   noFill();
//   fill(155,0);
//   rect(120,120,120,120)
//   triangle(width/2,height/2,120);
 
 
 
   
// d.rollover(mouseX,mouseY);
  house.drag(mouseX,mouseY);
  house.display();
  
  fill (255,0, 0); 
  
  int targetX, targetY; 
  targetX = width/2; 
  targetY = height/2; 
  
 // ellipse (targetX, targetY, 20, 20);
  
  house.snapTo(targetX, targetY); 
  roof.snapTo(399,281); 
  

  
  
  
  roof.drag(mouseX,mouseY);
  roof.display();
  window.drag(mouseX,mouseY);
  window.display();
  wind.drag(mouseX,mouseY);
  wind.display();
  door.drag(mouseX,mouseY);
  door.display();
  
  if (sunWasClicked){
    fill(0);
    //text("That was great!", width/3, height/4);
    //noFill();

    applause.rewind();
    applause.play();
    sunWasClicked = false;
  }
  
  } 
}

void mousePressed() {

  println (mouseX + " " + mouseY); 
  
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
  
    if (mouseX > 66 && mouseX < 265 && mouseY > 165 && mouseY < 265) {
    sunWasClicked = true;
  }
}

void mouseClicked() {
  
       if (mouseX > width/2 - 80 && mouseX < width/2 + 80 && mouseY > height/2 - 40 && mouseY < height/2 + 40){
     onStartPage = false;
   }
     //ellipse(165,165,200,200);
}

void stop(){
  instructions.close();
  applause.close();
  minim.stop();
  
  super.stop();
}

