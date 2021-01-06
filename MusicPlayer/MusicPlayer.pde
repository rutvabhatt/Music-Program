//Minim Library = Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;



//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer song1; //creates "playlist" variable

void setup () {
  fullScreen( displayWidth & displayHeight );
  minim = new Minim(this); //load from data directory, loadFile should load from project folder
  song1 = minim.loadFile("") ; //pass absolute path, file name, and URL
} //End setup

void draw () {
  
  
} //End draw
