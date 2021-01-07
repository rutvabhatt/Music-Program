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
  song1.play(); //Start of audio file to start playing
} //End setup

void draw () {
} //End draw

void keyPressed() {
  if ( key == 'p' || key == 'P' ) {//Play-pause button
    if ( song1.isPlaying () ) {
      song1.pause();
    } else if (song1.position() == song1.length() ) {//.length() = end
      song1.rewind();
      song1.play();
    } else {
      song1.play();
    }
  } //End of Play-pause button
  //
  if ( key == 's' || key == 'S' ) {//Stop button
    if (song1.isPlaying() ) {
      song1.pause();
      song1.rewind();
    } else if (song1.position() == song1.length() ) {//.length() = end
      song1.rewind();
    } else {
      song1.rewind();
    }
  } //End of Stop button
  //
  if ( key == 'f' || key == 'F' ) song1.skip(1000);//Fast Forward 1 second
  if ( key == 'r' || key == 'R' ) song1.skip(-1000);//Rewind 1 second
} //End keyPressed

void mousePressed() {  
} //End keyPressed
