class DraggableHouse{
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PImage img;
  
  float x,y,w,h;          // Location and size
 
  float offsetX, offsetY; // Mouseclick offset

  DraggableHouse(PImage temping, float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    img=temping; 
  
    offsetX = 0;
    offsetY = 0;
  }

  // Method to display
  void display() {
    stroke(0);
    if (dragging) fill (50);
    else if (rollover) fill(100);
    else fill(255,0,0);
    image(img,x,y);
  // rectMode (CENTER); 
   // rect(x,y,w,h);
   // fill (255, 0,0); 
   // ellipse (x,y, 10, 10); 
  }
  
  void snapTo(int targetX_, int targetY_) {
    float easing = 0.5; 
    float dx = targetX_ - x; 
    float dy = targetY_ - y; 

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

