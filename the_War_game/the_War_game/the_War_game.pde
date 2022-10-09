// IMPORTANT
import g4p_controls.*;

//Global Variables
int numArmies;                                      // number of armies to be participating
int counter;                                        // a place holder
float fadeFactor = 255;                             // fading variable used when a soldier dies
int armiesLeft;                                     // number of armies that still has live soldiers
Army winner;                                        // last army standing = winner
Army weakestArmy;                                   // variable to target opposing army that would be easiest to defeat
boolean thereIsWeakestArmy;                         // variable to help find a target army that would be easiest to defeat
ArrayList<Army> armies = new ArrayList<Army>();     // includes all armies
boolean winter = false;                             // whether the user wants a winter setting or not
PImage snowBackground;                              // image for winter background
PImage grassBackground;                             // image for summer (normal) background
PImage demon;                                       // demon image for normal (not winter) setting
PImage santa;                                       // demon image for winter setting
boolean demonSummoned = false;                      // demon is not currently present (or is it?)
public boolean go = true;                           // whether the user has clicked "LETS GO"

//Creating the 4 armies
String redArmyName = "Red";
color redArmyCol = color(255, 0, 0);
int redArmyAg = 5;
String redArmyForm = "classic";

String blueArmyName = "Blue";
color blueArmyCol = color(0, 0, 255);
int blueArmyAg = 1;
String blueArmyForm = "classic";

String purpleArmyName = "Purple";
color purpleArmyCol = color(220, 0, 220);
int purpleArmyAg = 2;
String purpleArmyForm = "classic";

String orangeArmyName = "Orange";
color orangeArmyCol = color(250, 160, 122);
int orangeArmyAg = 1;
String orangeArmyForm = "classic";

Army redArmy = new Army( redArmyName, redArmyCol, redArmyAg );
Army blueArmy = new Army( blueArmyName, blueArmyCol, blueArmyAg );
Army purpleArmy = new Army( purpleArmyName, purpleArmyCol, purpleArmyAg );
Army orangeArmy = new Army( orangeArmyName, orangeArmyCol, orangeArmyAg );


void setup () {

  // noLoop();
  size(800, 800);
  createGUI();

  // Loading images
  snowBackground = loadImage("snow.jpg");
  grassBackground = loadImage("grass.jpg");
  demon = loadImage("demon.png");
  santa = loadImage("santa.png");

  weatherUpdate();
  go = false;

  // Updating user inputs
  while ( go == false ) {
    numArmies = numArmySlider.getValueI();
    reset();
  }

  //Adding the amount of armies the user wants
  if ( numArmies == 2 ) {
    armies.add(redArmy);
    armies.add(blueArmy);
  } else if ( numArmies == 3 ) {
    armies.add(redArmy);
    armies.add(blueArmy);
    armies.add(orangeArmy);
  } else {
    armies.add(redArmy);
    armies.add(blueArmy);
    armies.add(orangeArmy);
    armies.add(purpleArmy);
  }

  //Adding soldiers to the armies
  for ( int i = 0; i < armies.size(); i++ )
    armies.get(i).addSoldiers();

  //Putting armies in their formations
  if ( numArmies == 2 ) {
    redArmy.formation();
    blueArmy.formation();
  } else if ( numArmies == 3 ) {
    redArmy.formation();
    blueArmy.formation();
    orangeArmy.formation();
  } else {
    redArmy.formation();
    blueArmy.formation();
    orangeArmy.formation();
    purpleArmy.formation();
  }

  armiesLeft = numArmies;
}


void draw() {

  weatherUpdate();

  //Nested for loop responsible for the whole simulation. Do not touch :) --> important to declare next frame
  for ( int j = 0; j < armies.size(); j++) {
    for ( int i = 0; i < armies.get(j).soldiers.size(); i++ ) {
      Army a = armies.get(j);
      Soldier s = a.soldiers.get(i);
      s.drawSoldier();
      if ( s.alive == true ) {
        s.moveSoldier();
        if ( s.title.indexOf("A") == 0 ) {
          if (s.hasArrow == false ) {
            s.checkForArrow();
          } else {
            s.arrow();
          }
        }
        s.fight();
      }
      s.fade();
      s.checkAlive( i );
    }
    checkRetreat();
  }
  checkWinner();

  // Demon check
  demonSummoning();
}

// Draw demon
void demonSummoning() {

  if ( demonSummoned == true ) {
    if ( frameCount % 2 == 0 && counter < 100) {

      if ( winter == true )
        image(santa, 0, 0, 800, 800);
      else
        image(demon, 0, 0, 800, 800);
      counter++;
    } else if ( counter >= 100) {
      demonSummoned = false;
      counter = 0;
    }
  }
}

// Function to call for new soldiers to join the battle
void reinforcements( Army a ) {

  if ( a.alreadyCalledReinforcements == false ) {
    if ( a.soldiers.size() < 10 && a.retreat == false ) {
      a.makeReinforcements();
      a.alreadyCalledReinforcements = true;
      reportUpdate( a, "Reinforcements are coming!" );
    }
    else if ( a.retreat == true )
      reportUpdate( a, "Why bother sending for reinforcements when you are running away?" );
    else
      reportUpdate( a, "No need for reinforcements" );
  }
}

// Check if army should retreat
void checkRetreat() {

  int numSoldiers = 14;
  for ( int j = 0; j < armies.size(); j++) {
    if ( armies.get(j).soldiers.size() < numSoldiers ) {
      weakestArmy = armies.get(j);
      numSoldiers = armies.get(j).soldiers.size();
      thereIsWeakestArmy = true;
    }
  }  

  if ( thereIsWeakestArmy == true ) {
    if ( weakestArmy.aggression == 4 ) {
      if ( weakestArmy.deathCount > 12 )
        weakestArmy.retreat = true;
    } else if ( weakestArmy.aggression == 3 ) {
      if ( weakestArmy.deathCount > 11 )
        weakestArmy.retreat = true;
    } else if ( weakestArmy.aggression == 2 ) {
      if ( weakestArmy.deathCount > 9 )
        weakestArmy.retreat = true;
    } else {
      if ( weakestArmy.deathCount > 7 )
        weakestArmy.retreat = true;
    }
  }
}

// Check which army is defeated, and if there is a winning army
void checkWinner() {

  for ( int j = 0; j < armies.size(); j++) {
    Army army = armies.get(j);
    if ( army.soldiers.size() == 0 ) {
      armiesLeft--;
      armies.remove(j);
      army.defeated = true;
    }
  }

  if ( armiesLeft == 1 ) {
    winner = armies.get(0);
    noLoop();
    textSize(50);
    fill(winner.armyColor);
    textAlign(CENTER);
    text(winner.name + " Army has won!", 400, 400);
  }
}

// Before stimulation runs, change the background to match the user's input for weather
void weatherUpdate() {

  if ( winter == true )
    image(snowBackground, 0, 0);
  else {
    image(grassBackground, 0, 0);
  }
}

// Updating the report textfield for windows
void reportUpdate( Army army, String message ) {
  if ( army.name == "Red" ) {
    redText.setText( message );
  } else if ( army.name == "Blue" ) {
    blueText.setText( message );
  } else if ( army.name == "Purple" ) {
    purpleText.setText( message );
  } else {
    orangeText.setText( message );
  }
}

// Updating program variables to match user inputs
void reset() {

  redArmy.fiveOf = armyRed5Drop.getSelectedText();
  redArmy.fourOf = armyRed4Drop.getSelectedText();
  redArmy.threeOf = armyRed3Drop.getSelectedText();
  redArmy.twoOf = armyRed2Drop.getSelectedText();
  redArmyForm = armyRedFDrop.getSelectedText();
  redArmy.aggression = armyredAggressionSlider.getValueF();
  redArmy.archerArrowSpeed = armyredarcherArrowSpeedSlider.getValueI();

  blueArmy.fiveOf = armyBlue5Drop.getSelectedText();
  blueArmy.fourOf = armyBlue4Drop.getSelectedText();
  blueArmy.threeOf = armyBlue3Drop.getSelectedText();
  blueArmy.twoOf = armyBlue2Drop.getSelectedText();
  blueArmyForm = armyBlueFDrop.getSelectedText();
  blueArmy.aggression = armyblueAggressionSlider.getValueF();
  blueArmy.archerArrowSpeed = armybluearcherArrowSpeedSlider.getValueI();

  orangeArmy.fiveOf = armyOrange5Drop.getSelectedText();
  orangeArmy.fourOf = armyOrange4Drop.getSelectedText();
  orangeArmy.threeOf = armyOrange3Drop.getSelectedText();
  orangeArmy.twoOf = armyOrange2Drop.getSelectedText();
  orangeArmyForm = armyOrangeFDrop.getSelectedText();
  orangeArmy.aggression = armyorangeAggressionSlider.getValueF();
  orangeArmy.archerArrowSpeed = armyorangearcherArrowSpeedSlider.getValueI();

  purpleArmy.fiveOf = armyPurple5Drop.getSelectedText();
  purpleArmy.fourOf = armyPurple4Drop.getSelectedText();
  purpleArmy.threeOf = armyPurple3Drop.getSelectedText();
  purpleArmy.twoOf = armyPurple2Drop.getSelectedText();
  purpleArmyForm = armyPurpleFDrop.getSelectedText();
  purpleArmy.aggression = armypurpleAggressionSlider.getValueF();
  purpleArmy.archerArrowSpeed = armypurplearcherArrowSpeedSlider.getValueI();
}
