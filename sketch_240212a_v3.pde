/* I chosed these colors from the adobe color palette, the name of the color theme is Cyberpunk Artworks.  
*/
int colorRed;
int colorPink;
int colorBlue;
int colorDarkBlue;
int colorGreen;
int colorWhite;

int numCols = 16;
int numRows = 9;
int cellWidth;
int cellHeight;

String fullName = "radoslav mitkov"; // My name
String studentNumber = "20075146"; // My student number
String upperFullName = fullName.toUpperCase();

void setup() {
  size(1280, 720);
  cellWidth = width / numCols;
  cellHeight = height / numRows;
  adobeColors(); 
  fullName = fullName.toUpperCase();
  generateArt();
  

}

void adobeColors() {
  colorWhite = color(255);   // White not in the adobe palette only used for Text
  colorRed = color(#BF0A2B); // Red
  colorPink = color(#D91E85);   // Pink
  colorBlue = color(#465EA6);    // Blue
  colorDarkBlue = color(#3624A6);// Dark Blue
  colorGreen = color(#122611);    // Dark Green
  /*
The colors I used are from the Adobe color palette generator and the name is Cyberpunk Artworks
*/
}

void draw() {
  frameRate(60);
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    saveDrawingToFile();
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    generateArt();
  }
}

void generateArt() {
  background(colorGreen); // Dark Green background
  
  // Drawing regular Mondrian-style art with outlined shapes
  int y = 0;
  while (y < numRows) { // Using a while loop for rows
    for (int x = 0; x < numCols; x++) { // Using a for loop for columns
      int randomShape = int(random(4));
      int randomColorIndex = int(random(3));
      
      strokeWeight(2); // Thicker stroke for outlines
      
      // Set fill color
      int fillColor;
      if (randomColorIndex == 0) {
        fillColor = colorDarkBlue;
      } else if (randomColorIndex == 1) {
        fillColor = colorPink;
      } else {
        fillColor = colorBlue;
      }
      
      if (randomShape == 0) { // Draw larger rectangles
        fill(fillColor);
        rect(x * cellWidth, y * cellHeight, cellWidth * 2, cellHeight * 2);
        x++; // Skip next column to avoid overlapping shapes
      } else if (randomShape == 1) { // Draw smaller rectangles
        fill(fillColor);
        rect(x * cellWidth, y * cellHeight, cellWidth, cellHeight);
      } else if (randomShape == 2) { // Draw circles
        fill(fillColor);
        ellipse(x * cellWidth + cellWidth / 2, y * cellHeight + cellHeight / 2, cellWidth, cellHeight);
      } else { // Draw squares
        fill(fillColor);
        rect(x * cellWidth, y * cellHeight, cellWidth, cellHeight);
      }
    }
    y++;
  }
  
  // Drawing text
  fill(255); // White text color
  textSize(30);// The size of the text
  textAlign(CENTER, CENTER); // To be align on center
  text(fullName, width/2, 20); // Display my name
  text(studentNumber, width/2, height - 20); // Display my student number
  
}

void saveDrawingToFile() {
  String filePath = System.getProperty("user.home") + "/Desktop/myart.png"; // Save on desktop
  saveFrame(filePath);
}
