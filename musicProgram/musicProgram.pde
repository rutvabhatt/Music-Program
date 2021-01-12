import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer soundEffect;
int numberOfSong = 3;
int numberOfSoundEffects = 1;
int rectX, rectY, rectWidth, rectHeight, outside;
float boxX, boxY, boxWidth, boxHeight;
color buttonColor, black = #000000, red = #D83737, white = #FFFFFF;
Boolean draw = false;

void setup () {
  fullScreen ( displayWidth & displayHeight);
  population();
  minim = new Minim(this);
  //songs
  song1 = minim.loadFile("../Music/Vishnu - Patrick Patrikios.mp3"); 
  song1.play();
  song2 = minim.loadFile("../Music/Dangerous Toys - SefChol.mp3"); 
  song2.play();
  song3 = minim.loadFile("../Music/Know Myself - Patrick Patrikios.mp3"); 
  song3.play();
  //sound effect
  soundEffect = minim.loadFile("../Music/Wood Plank Flicks.mp3");
}

void draw () {
  background(black);
  //quitButton
  println(mouseX, mouseY); 
  if (mouseX>rectX && mouseX<rectX+rectWidth && mouseY>rectY && mouseY<rectY+rectHeight) { 
    buttonColor = red;
  } else { 
    buttonColor = white;
  }
}


void mousePressed () {
  
}
