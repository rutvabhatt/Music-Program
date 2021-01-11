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
AudioMetaData songMetaData1;
int loopIntNum = 1; //connects variable to buttons, increasing the loop number //loopIntNum+1, loopIntNum+=

void setup () {
  fullScreen( displayWidth & displayHeight );
  minim = new Minim(this); //load from data directory, loadFile should load from project folder
  song1 = minim.loadFile("../Music/Two Moons - Bobby Richards.mp3") ; //pass absolute path, file name, and URL
  song1.play(); //Start of audio file to start playing
  songMetaData1 = song1.getMetaData(); 
  //
  println("Start of Console"); //If line is not visible, then output to console = too long //Decrease println(s) or increase memory
  println("Click Console to Finish Starting Program"); //Windows expects you to 'click into the window'
  println("Press keybroad to test: P, etc.");
  //
  println("File Name: ",songMetaData1.fileName() );
  println("Song Length (in milliseconds); ", songMetaData1.length() );
  println("Song Length (in seconds): ", songMetaData1.length()/1000);
  println("Song Length (in minutes and seconds): ", songMetaData1. );
  println("Song Title: ", songMetaData1.title() );
  println("Author: ", songMetaData1.author() );
  println("Composer: ", songMetaData1.composer() );
  println("Orchestra: ", songMetaData1.orchestra() );
  println("Albums: ", songMetaData1.album() );
  println("Disk: ", songMetaData1.disc() );
  println("Publisher: ", songMetaData1.publisher() );
  println("Date Released: ", songMetaData1.date() );
  println("Copyright: ", songMetaData1.copyright() );
  println("Comments: ", songMetaData1.comment() );
  println("Lyrics: ", songMetaData1.lyrics() );
  println("Track: ", songMetaData1.track() );
  println("Genre: ", songMetaData1.genre() );
  println("Encoded: ", songMetaData1.encoded() );
  //
  
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
  //
  if ( key == 'l' || key == 'L' ) song1.loop(loopIntNum); //Loop button
  
} //End keyPressed

void mousePressed() {  
  
} //End keyPressed
