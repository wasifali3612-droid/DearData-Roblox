 // Variables
String titleText = "SESSION 1: OCTOBER 22ND";
String startTimeText = "16:15"; 
float duration = 60;
float satisfaction = 7;

PImage gameImage;

void setup() {
  size(800, 600);
  background(40); 
  gameImage = loadImage("arsenal.jpg");
  strokeWeight(2);
  stroke(255); 
}

void draw() {
  background(40); 
  
  // 1. TITLE
  fill(255);
  textSize(24);
  textAlign(CENTER, TOP);
  text(titleText, width/2, 20);
  
  // 2. GAME IMAGE
  if (gameImage != null) {
    image(gameImage, 50, 80, 240, 135);
  } else {
    fill(255, 0, 0);
    text("Image not found", 50, 80);
  }
  
  // 3. START TIME (Clock Shape)
  fill(255);
  textSize(16);
  textAlign(LEFT, TOP);
  text("Start Time:", 50, 250);
  
  // Draw clock face
  fill(200); 
  stroke(255);
  ellipse(100, 330, 100, 100); 
  
  // --- CLOCK MATH FIX ---
  // In Processing, 0 is at 3 o'clock.
  // Minute hand (15 mins): Points exactly at 3 o'clock. Angle = 0.
  float minuteAngle = 0; 
  
  // Hour hand (4 o'clock): Points at 4. 
  // 3 o'clock is 0. 6 o'clock is 90 degrees.
  // 4 o'clock is 1/3 of the way between 3 and 6, so it's 30 degrees past 3.
  // 30 degrees = PI/6 radians.
  float hourAngle = PI/6; 
  
  // Draw Minute Hand (Length 40, pointing right)
  stroke(0);
  strokeWeight(4);
  float mx = 100 + 40 * cos(minuteAngle);
  float my = 330 + 40 * sin(minuteAngle);
  line(100, 330, mx, my); 
  
  // Draw Hour Hand (Length 25, pointing down-right towards 4)
  strokeWeight(6);
  float hx = 100 + 25 * cos(hourAngle);
  float hy = 330 + 25 * sin(hourAngle);
  line(100, 330, hx, hy);
  
  // Reset for text
  stroke(255);
  strokeWeight(2);
  fill(255);
  text(startTimeText, 85, 390);
  
  
  // 4. DURATION (Basic Bar Chart)
  fill(255);
  text("Duration (60 mins):", 220, 250);
  
  float durationBarWidth = map(duration, 0, 120, 0, 200);
  fill(255, 100, 100); 
  rect(220, 280, durationBarWidth, 30);
  
  
  // 5. SATISFACTION (Happy Emoji)
  fill(255);
  text("Satisfaction:", 500, 250);
  fill(255, 220, 0); 
  ellipse(550, 330, 100, 100); 
  fill(0); 
  ellipse(525, 310, 10, 20);
  ellipse(575, 310, 10, 20);
  
  noFill();
  stroke(0);
  strokeWeight(3);
  if (satisfaction > 5) {
    arc(550, 330, 60, 40, 0, PI); 
  } else {
    arc(550, 350, 60, 40, PI, TWO_PI); 
  }
  
  stroke(255);
  strokeWeight(2);
  fill(255);
  text("7/10", 530, 390);
  
  
  // 6. ACTIVITY (Gun Shape)
  fill(255);
  text("Activity: Shooter Game", 500, 450);
  fill(150); 
  rect(500, 480, 100, 20); 
  rect(510, 500, 20, 40);  
  rect(550, 500, 15, 30);  
  rect(500, 480, 10, 10);  
}
