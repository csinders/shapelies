
class Draggable_Triangle{
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PImage ourImage;
  
 float x,y,w,h;          // Location and size

 
  float offsetX, offsetY; // Mouseclick offset

  Draggable_Triangle(PImage temping, float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w =tempW;
    h = tempH;
    ourImage=temping;
    
  
    offsetX = 0;
    offsetY = 0;
  }

  // Method to display
  void display() {
    stroke(0);
    if (dragging) fill (50);
    else if (rollover) fill(100);
    else fill(44,19,5);
    //triangle(x1,y1,x2,y2,x3,y3);
    image(ourImage,x,y);
    //ellipse (x, y, 10, 10); 
    
  }
  
  void snapTo(int targetX_, int targetY_) {
    float easing = 0.5; 
    float dx = targetX_ - x; 
    float dy = targetY_ - y; 
    
    //fill(255, 0, 0); 
    //ellipse (targetX_, targetY_, 10, 10);

    if (abs(dx) < 50 && abs(dy) <50 ) {
        x+= dx* easing; 
        y+= dy* easing; 
    }
  }

  // Is a point inside the rectangle (for click)?
  void clicked(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      dragging = true;
      // If so, keep track of relative location of click to corner of rectangle
      offsetX = x-mx;
      offsetY = y-my;
    }
  }
  
  // Is a point inside the rectangle (for rollover)
  void rollover(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      rollover = true;
    } else {
      rollover = false;
    }
  }

  // Stop dragging
  void stopDragging() {
    dragging = false;
  }
  
  // Drag the rectangle
  void drag(int mx, int my) {
    if (dragging) {
      x = mx + offsetX;
      y = my + offsetY;
    }
  }

}

    
    
    //old triangle
//    void snapTo(int targetX_, int targetY_) {
//    float easing = 0.5; 
//    float dx = targetX_ - x; 
//    float dy = targetY_ - y; 
//    if (abs(dx) < 50 && abs(dy) <50 ) {
//        x+= dx* easing; 
//        y+= dy* easing; 
//        println("oh snap!");
//        
//    }
//  }
//  
//  // Is a point inside the rectangle (for click)?
//  void clicked(float mx, float my) {
//    if (mx > x1 && mx < x3 && my < y1 && my > y2) {
//      dragging = true;
//      // If so, keep track of relative location of click to corner of rectangle
//    }
//  }
//  
//  // Is a point inside the rectangle (for rollover)
//  void rollover(int mx, int my) {
//    if (mx > x1 && mx < x3 && my < y1 && my > y2) {
//      rollover = true;
//    } else {
//      rollover = false;
//    }
//  }
//
//  // Stop dragging
//  void stopDragging() {
//    dragging = false;
//  }
//  
//  // Drag the rectangle
//  void drag(float mx, float my) {
//    if (dragging) {
//      x = mx;
//      y = my;
//      createPoints();
//    }
//  }
//  
//  void createPoints(){
//    x1 = x-(trisize/2);
//    x2 = x;
//    x3 = x+(trisize/2);
//    
//    y1 = y+(trisize/2);
//    y2 = y-(trisize/2);
//    y3 = y+(trisize/2);
//  }
//}
