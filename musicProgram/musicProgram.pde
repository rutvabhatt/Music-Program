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

void setup () {
  fullScreen ( displayWidth & displayHeight);
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
}


void mousePressed () {
  
}
