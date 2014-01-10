
class Draggable_Triangle{
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  
  float x,y,trisize,x1,x2,x3,y1,y2,y3;          // Location and size
 
  float offsetX, offsetY; // Mouseclick offset

  Draggable_Triangle(float tempX, float tempY, float tempSize) {
    x = tempX;
    y = tempY;
    trisize= tempSize;
    
    createPoints();
    
  
    offsetX = 0;
    offsetY = 0;
  }

  // Method to display
  void display() {
    stroke(0);
    if (dragging) fill (50);
    else if (rollover) fill(100);
    else fill(44,19,5);
    triangle(x1,y1,x2,y2,x3,y3);
  }
  
  // Is a point inside the rectangle (for click)?
  void clicked(float mx, float my) {
    if (mx > x1 && mx < x3 && my < y1 && my > y2) {
      dragging = true;
      // If so, keep track of relative location of click to corner of rectangle
    }
  }
  
  // Is a point inside the rectangle (for rollover)
  void rollover(int mx, int my) {
    if (mx > x1 && mx < x3 && my < y1 && my > y2) {
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
  void drag(float mx, float my) {
    if (dragging) {
      x = mx;
      y = my;
      createPoints();
    }
  }
  
  void createPoints(){
    x1 = x-(trisize/2);
    x2 = x;
    x3 = x+(trisize/2);
    
    y1 = y+(trisize/2);
    y2 = y-(trisize/2);
    y3 = y+(trisize/2);
  }
}
