PFont titleFont;
String buttonText = "X";
String buttonText2 = "F";
String buttonText3 = "R";
color purple = #6511AA;
////
//[LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
////
void textSetup () {
  titleFont = createFont ("CooperBlack", 48);
} //End of textSetup

void textDrawPre () {
  fill(purple);
  textAlign(CENTER, CENTER);
  textFont(titleFont, 55);
} //End textDrawPre

//quitButton
void textDraw() {
  textDrawPre();
  text(rectX, rectY, rectWidth, rectHeight);
  fill(255);
}

//forwardButton
void textDraw2() {
  textDrawPre();
  text(buttonText2, forwardX, forwardY, forwardWidth, forwardHeight);
  fill(255);
}

//reverseButton
void textDraw3() {
  textDrawPre();
  text(buttonText3, reverseX, reverseY, reverseWidth, reverseHeight);
  fill(255);
}
