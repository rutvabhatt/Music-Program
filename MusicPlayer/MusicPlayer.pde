//Minim Library = Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//Global Variables
Minim minim; //creates object to access all functions
int numberOfSongs = 3;
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; //creates "playlist" variable holding extentions such as MP3
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs]  ;
int loopIntNum = 1; //connects variable to buttons, increasing the loop number //loopIntNum+1, loopIntNum+=
int currentSong = numberOfSongs - numberOfSongs; //formula based on previous variable 

void setup () {
  fullScreen( displayWidth & displayHeight );
  minim = new Minim(this); //load from data directory, loadFile should load from project folder
  //Array variables based on operators to describe 0, 1, 2
  //Formula Pattern: repeating formuals easier to program
  song[currentSong] = minim.loadFile("../Music/Main/Two Moons - Bobby Richards.mp3") ; //pass absolute path, file name, and URL
  song[currentSong+=1] = minim.loadFile("../Music/Main/Dangerous Toys - SefChol.mp3") ;
  song[currentSong+=1] = minim.loadFile("../Music/Main/Know Myself - Patrick Patrikios.mp3") ;
  //Use pattern FOR loop
  //
  currentSong = numberOfSongs - numberOfSongs;
  for (int i=currentSong; i<numberOfSongs; i++) {
    songMetaData[i] = song[i].getMetaData();
  } //End FOR loop, loading Meta Data
  //
  println("Start of Console"); //If line is not visible, then output to console = too long //Decrease println(s) or increase memory
  println("Click Console to Finish Starting Program"); //Windows expects you to 'click into the window'
  println("Press keybroad to test: P, etc.");
  //
  for (int i=currentSong; i<numberOfSongs; i++) {
    println("File Name: ", songMetaData[i].fileName() );
    println("Song Length (in milliseconds); ", songMetaData[i].length() );
    println("Song Length (in seconds): ", songMetaData[i].length()/1000);
    println("Song Length (in minutes and seconds): ", songMetaData[i].length()/1000/60, "minutes", (songMetaData[i].length()/1000)-(songMetaData[i].length()/1000/60*60), "seconds");
    println("Song Title: ", songMetaData[i].title() );
    println("Author: ", songMetaData[i].author() );
    println("Composer: ", songMetaData[i].composer() );
    println("Orchestra: ", songMetaData[i].orchestra() );
    println("Albums: ", songMetaData[i].album() );
    println("Disk: ", songMetaData[i].disc() );
    println("Publisher: ", songMetaData[i].publisher() );
    println("Date Released: ", songMetaData[i].date() );
    println("Copyright: ", songMetaData[i].copyright() );
    println("Comments: ", songMetaData[i].comment() );
    println("Lyrics: ", songMetaData[i].lyrics() );
    println("Track: ", songMetaData[i].track() );
    println("Genre: ", songMetaData[i].genre() );
    println("Encoded: ", songMetaData[i].encoded() );
    //
  }//End Console Output
  //
} //End setup

void draw () {
} //End draw

void keyPressed() {
  if ( key == 'p' || key == 'P' ) {//Play-pause button
    if ( song[currentSong].isPlaying () ) {
      song[currentSong].pause();
    } else if (song[currentSong].position() == song[currentSong].length() ) {//.length() = end
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }
  } //End of Play-pause button
  //
  if ( key == 's' || key == 'S' ) {//Stop button
    if (song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
    } else if (song[currentSong].position() == song[currentSong].length() ) {//.length() = end
      song[currentSong].rewind();
    } else {
      song[currentSong].rewind();
    }
  } //End of Stop button
  //
  if ( key == 'f' || key == 'F' ) song[currentSong].skip(1000);//Fast Forward 1 second
  if ( key == 'r' || key == 'R' ) song[currentSong].skip(-1000);//Rewind 1 second
  //
  if ( key == 'l' || key == 'L' ) song[currentSong].loop(loopIntNum); //Loop button
  //
  //Next Button
  if ( key == 'n' || key == 'N' ) {
    if (song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs-1) {
        currentSong = numberOfSongs - numberOfSongs;
      } else {
        currentSong++;
      }
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if (currentSong == numberOfSongs-1) {
        currentSong = numberOfSongs - numberOfSongs;
      } else {
        currentSong++;
      }
    }
  } //End Next button
  //
  //Previous Button ("Backwards")
  if ( key == 'b' || key == 'B' ) {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs) {
        currentSong = numberOfSongs-1;
      } else {
        currentSong--;
      }
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if (currentSong == numberOfSongs - numberOfSongs) {
        currentSong = numberOfSongs-1;
      } else {
        currentSong--;
      }
    }
  } //End Previous Button
} //End keyPressed

void mousePressed() {
} //End keyPressed
