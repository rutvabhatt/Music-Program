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
int numberOfSongs = 3;
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; //creates "playlist" variable holding extentions such as MP3
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs]  ;
int numberOfSoundEffects = 1;
int loopIntNum = 1;
int currentSong = numberOfSongs - numberOfSongs; 
int rectX, rectY, rectWidth, rectHeight, outside;
float boxX, boxY, boxWidth, boxHeight;
float boxX2, boxY2, boxWidth2, boxHeight2;
float playPauseX, playPauseY, playPauseDiameter;
float stopX, stopY, stopDiameter;
float forwardX, forwardY, forwardWidth, forwardHeight;
float reverseX, reverseY, reverseWidth, reverseHeight;
float backX, backY, backWidth, backHeight;
color buttonColor, black = #000000, red = #D83737, white = #FFFFFF;
Boolean draw = false;

void setup () {
  fullScreen ( displayWidth & displayHeight);
  population();
  textSetup();
  minim = new Minim(this);
  //songs
  song[currentSong] = minim.loadFile("../Music/Main/Two Moons - Bobby Richards.mp3") ; 
  song[currentSong+=1] = minim.loadFile("../Music/Main/Dangerous Toys - SefChol.mp3") ;
  song[currentSong+=1] = minim.loadFile("../Music/Main/Know Myself - Patrick Patrikios.mp3") ;

  currentSong = numberOfSongs - numberOfSongs;
  for (int i=currentSong; i<numberOfSongs; i++) {
    songMetaData[i] = song[i].getMetaData();
  }
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
  }
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
ellipse(playPauseX, playPauseY, playPauseDiameter, playPauseDiameter);
ellipse(stopX, stopY, stopDiameter, stopDiameter);
rect(forwardX, forwardY, forwardWidth, forwardHeight);
rect(reverseX, reverseY, reverseWidth, reverseHeight);
rect(rectX, rectY, rectWidth, rectHeight, outside);
rect(boxX, boxY, boxWidth, boxHeight);
}
//
//
void mousePressed () {
  //quitButton
  
  //playPauseButton
  if (mouseX>playPauseX && mouseX<playPauseX+playPauseDiameter && mouseY>playPauseY && mouseY<playPauseY+playPauseDiameter) {
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
  if (mouseX>stopX && mouseX<stopX+stopDiameter && mouseY>stopY && mouseY<stopY+stopDiameter) {
    if (song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
    } else if (song[currentSong].position() == song[currentSong].length() ) {//.length() = end
      song[currentSong].rewind();
    } else {
      song[currentSong].rewind();
    }
  } //End of stop button
  //
  if (mouseX>forwardX && mouseX<forwardX+forwardWidth && mouseY>forwardY && mouseY<forwardY+forwardHeight) {
    song[currentSong].skip(10000); //Forward 10 seconds
  } //
  //
  if (mouseX>reverseX && mouseX<reverseX+reverseWidth && mouseY>reverseY && mouseY<reverseY+reverseHeight) {
    song[currentSong].skip(-10000); //Reverse 10 seconds
  }
  }
  
