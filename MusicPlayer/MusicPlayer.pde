//Minim Library = Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer song1; //creates "playlist" variable holding extentions such as MP3

void setup () {
  fullScreen( displayWidth & displayHeight );
  minim = new Minim(this); //load from data directory, loadFile should load from project folder
  song1 = minim.loadFile("../Music/Two Moons - Bobby Richards.mp3") ; //pass absolute path, file name, and URL
  song1.play();
} //End setup

void draw () {
  
  
} //End draw
