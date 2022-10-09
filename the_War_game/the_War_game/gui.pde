/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.
 
 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
 // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void goButtonPressed(GButton source, GEvent event) { //_CODE_:goButton:344211:
  if ( !go ) {
    goButton.setText("||");
    go = true;
    loop();
  } else {
    goButton.setText("►");
    go = false;
    noLoop();
  }
} //_CODE_:goButton:344211:

public void exitClicked(GButton source, GEvent event) { //_CODE_:exitButton:282156:

  numArmyWindow.close();
  redArmyWindow.close();
  blueArmyWindow.close();
  purpleArmyWindow.close();
  orangeArmyWindow.close();
  exit();
} //_CODE_:exitButton:282156:

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:numArmyWindow:256850:
  appc.background(209);
} //_CODE_:numArmyWindow:256850:

public void numArmySliderDragged(GSlider source, GEvent event) { //_CODE_:numArmySlider:691699:
} //_CODE_:numArmySlider:691699:

public void armyButtonClicked(GButton source, GEvent event) { //_CODE_:numArmyButton:810403:

  if ( numArmyButton.getText() != "LETS GO" ) {
    numArmyWindow.close();

    if ( numArmySlider.getValueI() == 2 ) {
      purpleArmyWindow.close();
      orangeArmyWindow.close();
    } else if ( numArmySlider.getValueI() == 3 ) {
      purpleArmyWindow.close();
    }
    loop();
    numArmies = numArmySlider.getValueI();
    go = true;
  } else {
    numArmyButton.setText("Change parameters of armies!" );
  }
} //_CODE_:numArmyButton:810403:

public void winterChecked(GCheckbox source, GEvent event) { //_CODE_:winterCheckbox:258374:
  if (!winter) 
    winter = true;
  else
    winter = false;
} //_CODE_:winterCheckbox:258374:

synchronized public void win_draw2(PApplet appc, GWinData data) { //_CODE_:redArmyWindow:769846:
  appc.background(209);
} //_CODE_:redArmyWindow:769846:

public void armyRed5DropClicked(GDropList source, GEvent event) { //_CODE_:armyRed5Drop:539765:

  redArmy.fiveOf = armyRed5Drop.getSelectedText();
} //_CODE_:armyRed5Drop:539765:

public void armyRed4DropClicked(GDropList source, GEvent event) { //_CODE_:armyRed4Drop:307773:

  redArmy.fourOf = armyRed4Drop.getSelectedText();
} //_CODE_:armyRed4Drop:307773:

public void armyRed3DropClicked(GDropList source, GEvent event) { //_CODE_:armyRed3Drop:220492:

  redArmy.threeOf = armyRed3Drop.getSelectedText();
} //_CODE_:armyRed3Drop:220492:

public void armyRed2DropClicked(GDropList source, GEvent event) { //_CODE_:armyRed2Drop:449676:

  redArmy.twoOf = armyRed2Drop.getSelectedText();
} //_CODE_:armyRed2Drop:449676:

public void armyRedFDropClicked(GDropList source, GEvent event) { //_CODE_:armyRedFDrop:632714:

  redArmyForm = armyRedFDrop.getSelectedText();
} //_CODE_:armyRedFDrop:632714:

public void armyredSpeedSliderDragged(GSlider source, GEvent event) { //_CODE_:armyredSpeedSlider:995718: 
  for ( int i=0; i< redArmy.soldiers.size(); i++ ) {
    redArmy.soldiers.get(i).speed = redArmy.soldiers.get(i).setSpeed + 0.5*armyredSpeedSlider.getValueF();
  }
} //_CODE_:armyredSpeedSlider:995718:

public void armyredAggressionSliderDragged(GSlider source, GEvent event) { //_CODE_:armyredAggressionSlider:673961:
  redArmy.aggression = armyredAggressionSlider.getValueF();
} //_CODE_:armyredAggressionSlider:673961:


public void armyredarcherArrowSpeedSliderDragged(GSlider source, GEvent event) { //_CODE_:armyredarcherArrowSpeedSlider:722547:
  redArmy.archerArrowSpeed = armyredarcherArrowSpeedSlider.getValueI();
} //_CODE_:armyredarcherArrowSpeedSlider:722547:

public void redMagicClicked(GButton source, GEvent event) { //_CODE_:redMagicButton:298925:
  redArmy.magic();
} //_CODE_:redMagicButton:298925:

public void redReinforcementButtonClicked(GButton source, GEvent event) { //_CODE_:redMagicButton:298925:

  reinforcements(redArmy);
} 

synchronized public void win_draw3(PApplet appc, GWinData data) { //_CODE_:blueArmyWindow:500953:
  appc.background(209);
} //_CODE_:blueArmyWindow:500953:

public void armyBlue5DropClicked(GDropList source, GEvent event) { //_CODE_:armyBlue5Drop:618832:

  blueArmy.fiveOf = armyBlue5Drop.getSelectedText();
} //_CODE_:armyBlue5Drop:618832:

public void armyBlue4DropClicked(GDropList source, GEvent event) { //_CODE_:armyBlue4Drop:537952:

  blueArmy.fourOf = armyBlue4Drop.getSelectedText();
} //_CODE_:armyBlue4Drop:537952:

public void armyBlue3DropClicked(GDropList source, GEvent event) { //_CODE_:armyBlue3Drop:538905:

  blueArmy.threeOf = armyBlue3Drop.getSelectedText();
} //_CODE_:armyBlue3Drop:538905:

public void armyBlue2DropClicked(GDropList source, GEvent event) { //_CODE_:armyBlue2Drop:705190:

  blueArmy.twoOf = armyBlue2Drop.getSelectedText();
} //_CODE_:armyBlue2Drop:705190:

public void armyBlueFDropClicked(GDropList source, GEvent event) { //_CODE_:armyBlueFDrop:736026:

  blueArmyForm = armyBlueFDrop.getSelectedText();
} //_CODE_:armyBlueFDrop:736026:

public void armyblueSpeedSliderDragged(GSlider source, GEvent event) { //_CODE_:armyblueSpeedSlider:477036:
  for ( int i=0; i< blueArmy.soldiers.size(); i++ ) {
    blueArmy.soldiers.get(i).speed = blueArmy.soldiers.get(i).setSpeed + 0.5*armyblueSpeedSlider.getValueF();
  }
} //_CODE_:armyblueSpeedSlider:477036:


public void armyblueAggressionSliderDraged(GSlider source, GEvent event) { //_CODE_:armyblueAggressionSlider:497635:
  blueArmy.aggression = armyblueAggressionSlider.getValueF();
} //_CODE_:armyblueAggressionSlider:497635:

public void armybluearcherArrowSpeedSliderDragged(GSlider source, GEvent event) { //_CODE_:armybluearcherArrowSpeedSlider:486209:
  blueArmy.archerArrowSpeed = armybluearcherArrowSpeedSlider.getValueI();
} //_CODE_:armybluearcherArrowSpeedSlider:486209:

public void blueMagicClicked(GButton source, GEvent event) { //_CODE_:blueMagicButton:937628:
  blueArmy.magic();
} //_CODE_:blueMagicButton:937628:

public void blueReinforcementButtonClicked(GButton source, GEvent event) { //_CODE_:redMagicButton:298925:

  reinforcements(blueArmy);
}

synchronized public void win_draw4(PApplet appc, GWinData data) { //_CODE_:purpleArmyWindow:768896:
  appc.background(209);
} //_CODE_:purpleArmyWindow:768896:

public void armyPurple5DropClicked(GDropList source, GEvent event) { //_CODE_:armyPurple5Drop:245642:

  purpleArmy.fiveOf = armyPurple5Drop.getSelectedText();
} //_CODE_:armyPurple5Drop:245642:

public void armyPurple4DropClicked(GDropList source, GEvent event) { //_CODE_:armyPurple4Drop:724510:

  purpleArmy.fourOf = armyPurple4Drop.getSelectedText();
} //_CODE_:armyPurple4Drop:724510:

public void armyPurple3DropClicked(GDropList source, GEvent event) { //_CODE_:armyPurple3Drop:947361:

  purpleArmy.threeOf = armyPurple3Drop.getSelectedText();
} //_CODE_:armyPurple3Drop:947361:

public void armyPurple2DropClicked(GDropList source, GEvent event) { //_CODE_:armyPurple2Drop:322475:

  purpleArmy.twoOf = armyPurple2Drop.getSelectedText();
} //_CODE_:armyPurple2Drop:322475:

public void armypurpleSpeedSliderDragged(GSlider source, GEvent event) { //_CODE_:armypurpleSpeedSlider:984222:
  for ( int i=0; i< purpleArmy.soldiers.size(); i++ ) {
    purpleArmy.soldiers.get(i).speed = purpleArmy.soldiers.get(i).setSpeed + 0.5*armypurpleSpeedSlider.getValueF();
  }
} //_CODE_:armypurpleSpeedSlider:984222:

public void armyPurpleFDropClicked(GDropList source, GEvent event) { //_CODE_:armyPurpleFDrop:420482:

  purpleArmyForm = armyPurpleFDrop.getSelectedText();
} //_CODE_:armyPurpleFDrop:420482:


public void armypurpleAggressionSliderDrag(GSlider source, GEvent event) { //_CODE_:armypurpleAggressionSlider:727152:
  purpleArmy.aggression = armypurpleAggressionSlider.getValueF();
} //_CODE_:armypurpleAggressionSlider:727152:

public void armypurplearcherArrowSpeedSliderDrag(GSlider source, GEvent event) { //_CODE_:armypurplearcherArrowSpeedSlider:673079:
  purpleArmy.archerArrowSpeed = armypurplearcherArrowSpeedSlider.getValueI();
} //_CODE_:armypurplearcherArrowSpeedSlider:673079:

public void purpleMagicClicked(GButton source, GEvent event) { //_CODE_:purpleMagicButton:937627:
  purpleArmy.magic();
} //_CODE_:purpleMagicButton:937627:

public void purpleReinforcementButtonClicked(GButton source, GEvent event) { //_CODE_:redMagicButton:298925:

  reinforcements(purpleArmy);
}

synchronized public void win_draw5(PApplet appc, GWinData data) { //_CODE_:orangeArmyWindow:782556:
  appc.background(209);
} //_CODE_:orangeArmyWindow:782556:

public void armyOrange5DropClicked(GDropList source, GEvent event) { //_CODE_:armyOrange5Drop:549150:

  orangeArmy.fiveOf = armyOrange5Drop.getSelectedText();
} //_CODE_:armyOrange5Drop:549150:

public void armyOrange4DropClicked(GDropList source, GEvent event) { //_CODE_:armyOrange4Drop:858425:

  orangeArmy.fourOf = armyOrange4Drop.getSelectedText();
} //_CODE_:armyOrange4Drop:858425:

public void armyOrange3DropClicked(GDropList source, GEvent event) { //_CODE_:armyOrange3Drop:719652:

  orangeArmy.threeOf = armyOrange3Drop.getSelectedText();
} //_CODE_:armyOrange3Drop:719652:

public void armyOrange2DropClicked(GDropList source, GEvent event) { //_CODE_:armyOrange2Drop:779235:

  orangeArmy.twoOf = armyOrange2Drop.getSelectedText();
} //_CODE_:armyOrange2Drop:779235:

public void armyOrangeFDropClicked(GDropList source, GEvent event) { //_CODE_:armyOrangeFDrop:941173:

  orangeArmyForm = armyOrangeFDrop.getSelectedText();
} //_CODE_:armyOrangeFDrop:941173:

public void armyorangeSpeedSliderDragged(GSlider source, GEvent event) { //_CODE_:armyorangeSpeedSlider:796048:
  for ( int i=0; i< orangeArmy.soldiers.size(); i++ ) {
    orangeArmy.soldiers.get(i).speed = orangeArmy.soldiers.get(i).setSpeed + 0.5*armyorangeSpeedSlider.getValueF();
  }
} //_CODE_:armyorangeSpeedSlider:796048:

public void armyorangeAggressionSliderDrag(GSlider source, GEvent event) { //_CODE_:armyorangeAggressionSlider:273708:
  orangeArmy.aggression = armyorangeAggressionSlider.getValueF();
} //_CODE_:armyorangeAggressionSlider:273708:

public void armyorangearcherArrowSpeedSliderDrag(GSlider source, GEvent event) { //_CODE_:armyorangearcherArrowSpeedSlider:784252:
  orangeArmy.archerArrowSpeed = armyorangearcherArrowSpeedSlider.getValueI();
} //_CODE_:armyorangearcherArrowSpeedSlider:784252:

public void orangeMagicClicked(GButton source, GEvent event) { //_CODE_:orangeMagicButton:453305:
  orangeArmy.magic();
} //_CODE_:orangeMagicButton:453305:

public void orangeReinforcementButtonClicked(GButton source, GEvent event) { //_CODE_:redMagicButton:298925:

  reinforcements(orangeArmy);
}


// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI() {
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Battle Field");
  goButton = new GButton(this, 720, 10, 30, 30);
  goButton.setText("||");
  goButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  goButton.addEventHandler(this, "goButtonPressed");
  exitButton = new GButton(this, 760, 10, 30, 30);
  exitButton.setText("X");
  exitButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  exitButton.addEventHandler(this, "exitClicked");
  numArmyWindow = GWindow.getWindow(this, "Welcome to WAR GAME", 600, 300, 240, 250, JAVA2D);
  numArmyWindow.noLoop();
  numArmyWindow.setActionOnClose(G4P.CLOSE_WINDOW);
  numArmyWindow.addDrawHandler(this, "win_draw1");
  numArmyLabel = new GLabel(numArmyWindow, 20, 60, 200, 20);
  numArmyLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  numArmyLabel.setText("How many armies would you like?");
  numArmyLabel.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  numArmyLabel.setOpaque(false);
  titleLabel = new GLabel(numArmyWindow, 20, 20, 200, 20);
  titleLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  titleLabel.setText(">> Are you ready to play WAR? <<");
  titleLabel.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  titleLabel.setOpaque(true);
  numArmySlider = new GSlider(numArmyWindow, 70, 90, 100, 40, 10.0);
  numArmySlider.setShowValue(true);
  numArmySlider.setShowLimits(true);
  numArmySlider.setLimits(2, 2, 4);
  numArmySlider.setNbrTicks(3);
  numArmySlider.setNumberFormat(G4P.INTEGER, 0);
  numArmySlider.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  numArmySlider.setOpaque(false);
  numArmySlider.addEventHandler(this, "numArmySliderDragged");
  numArmyButton = new GButton(numArmyWindow, 20, 200, 200, 30);
  numArmyButton.setText("LETS GO");
  numArmyButton.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  numArmyButton.addEventHandler(this, "armyButtonClicked");
  winterCheckbox = new GCheckbox(numArmyWindow, 60, 140, 120, 40);
  winterCheckbox.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  winterCheckbox.setText(" ❆ Winter Theme ❆");
  winterCheckbox.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  winterCheckbox.setOpaque(true);
  winterCheckbox.addEventHandler(this, "winterChecked");
  redArmyWindow = GWindow.getWindow(this, "Red Army Controls", 80, 50, 240, 650, JAVA2D);
  redArmyWindow.noLoop();
  redArmyWindow.setActionOnClose(G4P.CLOSE_WINDOW);
  redArmyWindow.addDrawHandler(this, "win_draw2");
  redintroLabel = new GLabel(redArmyWindow, 5, 22, 230, 30);
  redintroLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  redintroLabel.setText("Change the following characteristics for each army, then press go.");
  redintroLabel.setLocalColorScheme(GCScheme.RED_SCHEME);
  redintroLabel.setOpaque(false);
  armyRedLabel = new GLabel(redArmyWindow, 20, 70, 200, 20);
  armyRedLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyRedLabel.setText("The RED Army ⋌༼ •̀ ⌂ •́ ༽⋋");
  armyRedLabel.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyRedLabel.setOpaque(false);
  armyredLabel = new GLabel(redArmyWindow, 20, 100, 200, 20);
  armyredLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyredLabel.setText("In this army, there will be...");
  armyredLabel.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyredLabel.setOpaque(false);
  armyRedNum5 = new GLabel(redArmyWindow, 50, 120, 30, 20);
  armyRedNum5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyRedNum5.setText("5");
  armyRedNum5.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyRedNum5.setOpaque(false);
  armyRed5Drop = new GDropList(redArmyWindow, 90, 120, 90, 100, 4, 10);
  armyRed5Drop.setItems(loadStrings("list_539765"), 0);
  armyRed5Drop.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyRed5Drop.addEventHandler(this, "armyRed5DropClicked");
  armyRedNum2 = new GLabel(redArmyWindow, 50, 180, 30, 20);
  armyRedNum2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyRedNum2.setText("2");
  armyRedNum2.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyRedNum2.setOpaque(false);
  armyRedNum3 = new GLabel(redArmyWindow, 50, 160, 30, 20);
  armyRedNum3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyRedNum3.setText("3");
  armyRedNum3.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyRedNum3.setOpaque(false);
  armyRedNum4 = new GLabel(redArmyWindow, 50, 140, 30, 20);
  armyRedNum4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyRedNum4.setText("4");
  armyRedNum4.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyRedNum4.setOpaque(false);
  armyRed4Drop = new GDropList(redArmyWindow, 90, 140, 90, 100, 4, 10);
  armyRed4Drop.setItems(loadStrings("list_307773"), 1);
  armyRed4Drop.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyRed4Drop.addEventHandler(this, "armyRed4DropClicked");
  armyRed3Drop = new GDropList(redArmyWindow, 90, 160, 90, 100, 4, 10);
  armyRed3Drop.setItems(loadStrings("list_220492"), 2);
  armyRed3Drop.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyRed3Drop.addEventHandler(this, "armyRed3DropClicked");
  armyRed2Drop = new GDropList(redArmyWindow, 90, 180, 90, 100, 4, 10);
  armyRed2Drop.setItems(loadStrings("list_449676"), 3);
  armyRed2Drop.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyRed2Drop.addEventHandler(this, "armyRed2DropClicked");
  armyredMLabel1 = new GLabel(redArmyWindow, 20, 210, 200, 20);
  armyredMLabel1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyredMLabel1.setText("Military Formation");
  armyredMLabel1.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyredMLabel1.setOpaque(false);
  armyRedFDrop = new GDropList(redArmyWindow, 20, 230, 200, 80, 3, 10);
  armyRedFDrop.setItems(loadStrings("list_632714"), 0);
  armyRedFDrop.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyRedFDrop.addEventHandler(this, "armyRedFDropClicked");
  armyredSLabel = new GLabel(redArmyWindow, 20, 260, 200, 20);
  armyredSLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyredSLabel.setText("Speed");
  armyredSLabel.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyredSLabel.setOpaque(false);
  armyredSpeedSlider = new GSlider(redArmyWindow, 20, 280, 200, 40, 10.0);
  armyredSpeedSlider.setShowValue(true);
  armyredSpeedSlider.setShowLimits(true);
  armyredSpeedSlider.setLimits(1.0, 1.0, 5.0);
  armyredSpeedSlider.setNumberFormat(G4P.DECIMAL, 0);
  armyredSpeedSlider.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyredSpeedSlider.setOpaque(false);
  armyredSpeedSlider.addEventHandler(this, "armyredSpeedSliderDragged");
  armyredALabel = new GLabel(redArmyWindow, 20, 330, 200, 20);
  armyredALabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyredALabel.setText("Aggression Level");
  armyredALabel.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyredALabel.setOpaque(false);
  armyredAggressionSlider = new GSlider(redArmyWindow, 20, 350, 200, 40, 10.0);
  armyredAggressionSlider.setShowValue(true);
  armyredAggressionSlider.setShowLimits(true);
  armyredAggressionSlider.setLimits(3.0, 1.0, 5.0);
  armyredAggressionSlider.setNumberFormat(G4P.DECIMAL, 0);
  armyredAggressionSlider.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyredAggressionSlider.setOpaque(false);
  armyredAggressionSlider.addEventHandler(this, "armyredAggressionSliderDragged");
  armyredELabel = new GLabel(redArmyWindow, 20, 400, 200, 20);
  armyredELabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyredELabel.setText("Arrow Speed");
  armyredELabel.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyredELabel.setOpaque(false);
  armyredarcherArrowSpeedSlider = new GSlider(redArmyWindow, 20, 420, 200, 40, 10.0);
  armyredarcherArrowSpeedSlider.setShowValue(true);
  armyredarcherArrowSpeedSlider.setShowLimits(true);
  armyredarcherArrowSpeedSlider.setLimits(1.0, 1.0, 5.0);
  armyredarcherArrowSpeedSlider.setNumberFormat(G4P.DECIMAL, 2);
  armyredarcherArrowSpeedSlider.setLocalColorScheme(GCScheme.RED_SCHEME);
  armyredarcherArrowSpeedSlider.setOpaque(false);
  armyredarcherArrowSpeedSlider.addEventHandler(this, "armyredarcherArrowSpeedSliderDragged");
  redMagicButton = new GButton(redArmyWindow, 20, 470, 200, 30);
  redMagicButton.setText("❇ MAGIC BOOST ❇");
  redMagicButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  redMagicButton.addEventHandler(this, "redMagicClicked");
  redReinforcementButton = new GButton(redArmyWindow, 20, 510, 200, 30);
  redReinforcementButton.setText("> REINFORCEMENT <");
  redReinforcementButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  redReinforcementButton.addEventHandler(this, "redReinforcementButtonClicked");
  redText = new GLabel(redArmyWindow, 20, 560, 200, 70);
  redText.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  redText.setText("report updates...");
  redText.setLocalColorScheme(GCScheme.RED_SCHEME);
  redText.setOpaque(true);
  blueArmyWindow = GWindow.getWindow(this, "Blue Army Controls", 1120, 50, 240, 650, JAVA2D);
  blueArmyWindow.noLoop();
  blueArmyWindow.setActionOnClose(G4P.CLOSE_WINDOW);
  blueArmyWindow.addDrawHandler(this, "win_draw3");
  blueintroLabel = new GLabel(blueArmyWindow, 5, 20, 230, 30);
  blueintroLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  blueintroLabel.setText("Change the following characteristics for each army, then press go.");
  blueintroLabel.setOpaque(false);
  armyBlueLabel = new GLabel(blueArmyWindow, 20, 70, 200, 20);
  armyBlueLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyBlueLabel.setText("The BLUE Army ᕙ(~•̀︿•́~)ᕗ");
  armyBlueLabel.setOpaque(false);
  armyblueLabel = new GLabel(blueArmyWindow, 20, 100, 200, 20);
  armyblueLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyblueLabel.setText("In this army, there will be...");
  armyblueLabel.setOpaque(false);
  armyBlueNum5 = new GLabel(blueArmyWindow, 50, 120, 30, 20);
  armyBlueNum5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyBlueNum5.setText("5");
  armyBlueNum5.setOpaque(false);
  armyBlueNum4 = new GLabel(blueArmyWindow, 50, 140, 30, 20);
  armyBlueNum4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyBlueNum4.setText("4");
  armyBlueNum4.setOpaque(false);
  armyBlueNum3 = new GLabel(blueArmyWindow, 50, 160, 30, 20);
  armyBlueNum3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyBlueNum3.setText("3");
  armyBlueNum3.setOpaque(false);
  armyBlueNum2 = new GLabel(blueArmyWindow, 50, 180, 30, 20);
  armyBlueNum2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyBlueNum2.setText("2");
  armyBlueNum2.setOpaque(false);
  armyBlue5Drop = new GDropList(blueArmyWindow, 90, 120, 90, 100, 4, 10);
  armyBlue5Drop.setItems(loadStrings("list_618832"), 0);
  armyBlue5Drop.addEventHandler(this, "armyBlue5DropClicked");
  armyBlue4Drop = new GDropList(blueArmyWindow, 90, 140, 90, 100, 4, 10);
  armyBlue4Drop.setItems(loadStrings("list_537952"), 1);
  armyBlue4Drop.addEventHandler(this, "armyBlue4DropClicked");
  armyBlue3Drop = new GDropList(blueArmyWindow, 90, 160, 90, 100, 4, 10);
  armyBlue3Drop.setItems(loadStrings("list_538905"), 2);
  armyBlue3Drop.addEventHandler(this, "armyBlue3DropClicked");
  armyBlue2Drop = new GDropList(blueArmyWindow, 90, 180, 90, 100, 4, 10);
  armyBlue2Drop.setItems(loadStrings("list_705190"), 3);
  armyBlue2Drop.addEventHandler(this, "armyBlue2DropClicked");
  armyblueMLabel = new GLabel(blueArmyWindow, 20, 210, 200, 20);
  armyblueMLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyblueMLabel.setText("Military Formation");
  armyblueMLabel.setOpaque(false);
  armyBlueFDrop = new GDropList(blueArmyWindow, 20, 230, 200, 80, 3, 10);
  armyBlueFDrop.setItems(loadStrings("list_736026"), 0);
  armyBlueFDrop.addEventHandler(this, "armyBlueFDropClicked");
  armyblueSLabel = new GLabel(blueArmyWindow, 20, 260, 200, 20);
  armyblueSLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyblueSLabel.setText("Speed");
  armyblueSLabel.setOpaque(false);
  armyblueSpeedSlider = new GSlider(blueArmyWindow, 20, 280, 200, 40, 10.0);
  armyblueSpeedSlider.setShowValue(true);
  armyblueSpeedSlider.setShowLimits(true);
  armyblueSpeedSlider.setLimits(1.0, 1.0, 5.0);
  armyblueSpeedSlider.setNumberFormat(G4P.DECIMAL, 2);
  armyblueSpeedSlider.setOpaque(false);
  armyblueSpeedSlider.addEventHandler(this, "armyblueSpeedSliderDragged");
  armyblueALabel = new GLabel(blueArmyWindow, 20, 330, 200, 20);
  armyblueALabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyblueALabel.setText("Aggression Level");
  armyblueALabel.setOpaque(false);
  armyblueAggressionSlider = new GSlider(blueArmyWindow, 20, 350, 200, 40, 10.0);
  armyblueAggressionSlider.setShowValue(true);
  armyblueAggressionSlider.setShowLimits(true);
  armyblueAggressionSlider.setLimits(3.0, 1.0, 5.0);
  armyblueAggressionSlider.setNumberFormat(G4P.DECIMAL, 2);
  armyblueAggressionSlider.setOpaque(false);
  armyblueAggressionSlider.addEventHandler(this, "armyblueAggressionSliderDraged");
  armybELabel = new GLabel(blueArmyWindow, 20, 400, 200, 20);
  armybELabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armybELabel.setText("Arrow Speed");
  armybELabel.setOpaque(false);
  armybluearcherArrowSpeedSlider = new GSlider(blueArmyWindow, 20, 420, 200, 40, 10.0);
  armybluearcherArrowSpeedSlider.setShowValue(true);
  armybluearcherArrowSpeedSlider.setShowLimits(true);
  armybluearcherArrowSpeedSlider.setLimits(1.0, 1.0, 5.0);
  armybluearcherArrowSpeedSlider.setNumberFormat(G4P.DECIMAL, 2);
  armybluearcherArrowSpeedSlider.setOpaque(false);
  armybluearcherArrowSpeedSlider.addEventHandler(this, "armybluearcherArrowSpeedSliderDragged");
  blueMagicButton = new GButton(blueArmyWindow, 20, 470, 200, 30);
  blueMagicButton.setText("❇ MAGIC BOOST ❇");
  blueMagicButton.addEventHandler(this, "blueMagicClicked");
  blueReinforcementButton = new GButton(blueArmyWindow, 20, 510, 200, 30);
  blueReinforcementButton.setText("> REINFORCEMENT <");
  blueReinforcementButton.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  blueReinforcementButton.addEventHandler(this, "blueReinforcementButtonClicked");
  blueText = new GLabel(blueArmyWindow, 20, 560, 200, 70);
  blueText.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  blueText.setText("report updates...");
  blueText.setOpaque(true);
  purpleArmyWindow = GWindow.getWindow(this, "Purple Army Controls", 0, 180, 240, 650, JAVA2D);
  purpleArmyWindow.noLoop();
  purpleArmyWindow.setActionOnClose(G4P.CLOSE_WINDOW);
  purpleArmyWindow.addDrawHandler(this, "win_draw4");
  purpleintroLabel = new GLabel(purpleArmyWindow, 5, 20, 230, 30);
  purpleintroLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  purpleintroLabel.setText("Change the following characteristics for each army, then press go.");
  purpleintroLabel.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  purpleintroLabel.setOpaque(false);
  armyPurpleLabel = new GLabel(purpleArmyWindow, 20, 70, 200, 20);
  armyPurpleLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyPurpleLabel.setText("The PURPLE Army ୧( ಠ Д ಠ )୨");
  armyPurpleLabel.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armyPurpleLabel.setOpaque(false);
  armypurpleLabel = new GLabel(purpleArmyWindow, 20, 100, 200, 20);
  armypurpleLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armypurpleLabel.setText("In this army, there will be...");
  armypurpleLabel.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armypurpleLabel.setOpaque(false);
  armyPurpleNum5 = new GLabel(purpleArmyWindow, 50, 120, 30, 20);
  armyPurpleNum5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyPurpleNum5.setText("5");
  armyPurpleNum5.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armyPurpleNum5.setOpaque(false);
  armyPurpleNum4 = new GLabel(purpleArmyWindow, 50, 140, 30, 20);
  armyPurpleNum4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyPurpleNum4.setText("4");
  armyPurpleNum4.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armyPurpleNum4.setOpaque(false);
  armyPurpleNum3 = new GLabel(purpleArmyWindow, 50, 160, 30, 20);
  armyPurpleNum3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyPurpleNum3.setText("3");
  armyPurpleNum3.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armyPurpleNum3.setOpaque(false);
  armyPurpleNum2 = new GLabel(purpleArmyWindow, 50, 180, 30, 20);
  armyPurpleNum2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyPurpleNum2.setText("2");
  armyPurpleNum2.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armyPurpleNum2.setOpaque(false);
  armyPurple5Drop = new GDropList(purpleArmyWindow, 90, 120, 90, 100, 4, 10);
  armyPurple5Drop.setItems(loadStrings("list_245642"), 0);
  armyPurple5Drop.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armyPurple5Drop.addEventHandler(this, "armyPurple5DropClicked");
  armyPurple4Drop = new GDropList(purpleArmyWindow, 90, 140, 90, 100, 4, 10);
  armyPurple4Drop.setItems(loadStrings("list_724510"), 1);
  armyPurple4Drop.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armyPurple4Drop.addEventHandler(this, "armyPurple4DropClicked");
  armyPurple3Drop = new GDropList(purpleArmyWindow, 90, 160, 90, 100, 4, 10);
  armyPurple3Drop.setItems(loadStrings("list_947361"), 2);
  armyPurple3Drop.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armyPurple3Drop.addEventHandler(this, "armyPurple3DropClicked");
  armyPurple2Drop = new GDropList(purpleArmyWindow, 90, 180, 90, 100, 4, 10);
  armyPurple2Drop.setItems(loadStrings("list_322475"), 3);
  armyPurple2Drop.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armyPurple2Drop.addEventHandler(this, "armyPurple2DropClicked");
  armypurpleMLabel = new GLabel(purpleArmyWindow, 20, 210, 200, 20);
  armypurpleMLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armypurpleMLabel.setText("MIlitary Formation");
  armypurpleMLabel.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armypurpleMLabel.setOpaque(false);
  armypurpleSpeedSlider = new GSlider(purpleArmyWindow, 20, 280, 200, 40, 10.0);
  armypurpleSpeedSlider.setShowValue(true);
  armypurpleSpeedSlider.setShowLimits(true);
  armypurpleSpeedSlider.setLimits(1.0, 1.0, 5.0);
  armypurpleSpeedSlider.setNumberFormat(G4P.DECIMAL, 2);
  armypurpleSpeedSlider.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armypurpleSpeedSlider.setOpaque(false);
  armypurpleSpeedSlider.addEventHandler(this, "armypurpleSpeedSliderDragged");
  armyPurpleFDrop = new GDropList(purpleArmyWindow, 20, 230, 200, 80, 3, 10);
  armyPurpleFDrop.setItems(loadStrings("list_420482"), 0);
  armyPurpleFDrop.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armyPurpleFDrop.addEventHandler(this, "armyPurpleFDropClicked");
  armypurpleSLabel = new GLabel(purpleArmyWindow, 20, 260, 200, 20);
  armypurpleSLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armypurpleSLabel.setText("Speed");
  armypurpleSLabel.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armypurpleSLabel.setOpaque(false);
  armypurpleALabel = new GLabel(purpleArmyWindow, 20, 330, 200, 20);
  armypurpleALabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armypurpleALabel.setText("Aggression Level");
  armypurpleALabel.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armypurpleALabel.setOpaque(false);
  armypurpleAggressionSlider = new GSlider(purpleArmyWindow, 20, 350, 200, 40, 10.0);
  armypurpleAggressionSlider.setShowValue(true);
  armypurpleAggressionSlider.setShowLimits(true);
  armypurpleAggressionSlider.setLimits(3.0, 1.0, 5.0);
  armypurpleAggressionSlider.setNumberFormat(G4P.DECIMAL, 2);
  armypurpleAggressionSlider.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armypurpleAggressionSlider.setOpaque(false);
  armypurpleAggressionSlider.addEventHandler(this, "armypurpleAggressionSliderDrag");
  armypELabel = new GLabel(purpleArmyWindow, 20, 400, 200, 20);
  armypELabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armypELabel.setText("Arrow Speed");
  armypELabel.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armypELabel.setOpaque(false);
  armypurplearcherArrowSpeedSlider = new GSlider(purpleArmyWindow, 20, 420, 200, 40, 10.0);
  armypurplearcherArrowSpeedSlider.setShowValue(true);
  armypurplearcherArrowSpeedSlider.setShowLimits(true);
  armypurplearcherArrowSpeedSlider.setLimits(1.0, 1.0, 5.0);
  armypurplearcherArrowSpeedSlider.setNumberFormat(G4P.DECIMAL, 2);
  armypurplearcherArrowSpeedSlider.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  armypurplearcherArrowSpeedSlider.setOpaque(false);
  armypurplearcherArrowSpeedSlider.addEventHandler(this, "armypurplearcherArrowSpeedSliderDrag");
  purpleMagicButton = new GButton(purpleArmyWindow, 20, 470, 200, 30);
  purpleMagicButton.setText("❇ MAGIC BOOST ❇");
  purpleMagicButton.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  purpleMagicButton.addEventHandler(this, "purpleMagicClicked");
  purpleReinforcementButton = new GButton(purpleArmyWindow, 20, 510, 200, 30);
  purpleReinforcementButton.setText("> REINFORCEMENT <");
  purpleReinforcementButton.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  purpleReinforcementButton.addEventHandler(this, "purpleReinforcementButtonClicked");
  purpleText = new GLabel(purpleArmyWindow, 20, 560, 200, 70);
  purpleText.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  purpleText.setText("report updates...");
  purpleText.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  purpleText.setOpaque(true);
  orangeArmyWindow = GWindow.getWindow(this, "orangeArmy Controls", 1200, 180, 240, 650, JAVA2D);
  orangeArmyWindow.noLoop();
  orangeArmyWindow.setActionOnClose(G4P.CLOSE_WINDOW);
  orangeArmyWindow.addDrawHandler(this, "win_draw5");
  orangeintroLabel = new GLabel(orangeArmyWindow, 5, 22, 230, 30);
  orangeintroLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  orangeintroLabel.setText("Change the following characteristics for each army, then press go.");
  orangeintroLabel.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  orangeintroLabel.setOpaque(false);
  armyOrangeLabel = new GLabel(orangeArmyWindow, 20, 70, 200, 20);
  armyOrangeLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyOrangeLabel.setText("The ORANGE Army ლ( •̀ ᴥ •́   )");
  armyOrangeLabel.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyOrangeLabel.setOpaque(false);
  armyorangeLabel = new GLabel(orangeArmyWindow, 20, 100, 200, 20);
  armyorangeLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyorangeLabel.setText("In this army, there will be...");
  armyorangeLabel.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyorangeLabel.setOpaque(false);
  armyOrangeNum2 = new GLabel(orangeArmyWindow, 50, 180, 30, 20);
  armyOrangeNum2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyOrangeNum2.setText("2");
  armyOrangeNum2.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyOrangeNum2.setOpaque(false);
  armyOrangeNum3 = new GLabel(orangeArmyWindow, 50, 160, 30, 20);
  armyOrangeNum3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyOrangeNum3.setText("3");
  armyOrangeNum3.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyOrangeNum3.setOpaque(false);
  armyOrangeNum4 = new GLabel(orangeArmyWindow, 50, 140, 30, 20);
  armyOrangeNum4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyOrangeNum4.setText("4");
  armyOrangeNum4.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyOrangeNum4.setOpaque(false);
  armyOrangeNum5 = new GLabel(orangeArmyWindow, 50, 120, 30, 20);
  armyOrangeNum5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyOrangeNum5.setText("5");
  armyOrangeNum5.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyOrangeNum5.setOpaque(false);
  armyorangeMLabel = new GLabel(orangeArmyWindow, 20, 210, 200, 20);
  armyorangeMLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyorangeMLabel.setText("Miltary Formation");
  armyorangeMLabel.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyorangeMLabel.setOpaque(false);
  armyOrange5Drop = new GDropList(orangeArmyWindow, 90, 120, 90, 100, 4, 10);
  armyOrange5Drop.setItems(loadStrings("list_549150"), 0);
  armyOrange5Drop.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyOrange5Drop.addEventHandler(this, "armyOrange5DropClicked");
  armyOrange4Drop = new GDropList(orangeArmyWindow, 90, 140, 90, 100, 4, 10);
  armyOrange4Drop.setItems(loadStrings("list_858425"), 1);
  armyOrange4Drop.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyOrange4Drop.addEventHandler(this, "armyOrange4DropClicked");
  armyOrange3Drop = new GDropList(orangeArmyWindow, 90, 160, 90, 100, 4, 10);
  armyOrange3Drop.setItems(loadStrings("list_719652"), 2);
  armyOrange3Drop.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyOrange3Drop.addEventHandler(this, "armyOrange3DropClicked");
  armyOrange2Drop = new GDropList(orangeArmyWindow, 90, 180, 90, 100, 4, 10);
  armyOrange2Drop.setItems(loadStrings("list_779235"), 3);
  armyOrange2Drop.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyOrange2Drop.addEventHandler(this, "armyOrange2DropClicked");
  armyOrangeFDrop = new GDropList(orangeArmyWindow, 20, 230, 200, 80, 3, 10);
  armyOrangeFDrop.setItems(loadStrings("list_941173"), 0);
  armyOrangeFDrop.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyOrangeFDrop.addEventHandler(this, "armyOrangeFDropClicked");
  armyorangeSLabel = new GLabel(orangeArmyWindow, 20, 260, 200, 20);
  armyorangeSLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyorangeSLabel.setText("Speed");
  armyorangeSLabel.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyorangeSLabel.setOpaque(false);
  armyorangeSpeedSlider = new GSlider(orangeArmyWindow, 20, 280, 200, 40, 10.0);
  armyorangeSpeedSlider.setShowValue(true);
  armyorangeSpeedSlider.setShowLimits(true);
  armyorangeSpeedSlider.setLimits(1.0, 1.0, 5.0);
  armyorangeSpeedSlider.setNumberFormat(G4P.DECIMAL, 2);
  armyorangeSpeedSlider.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyorangeSpeedSlider.setOpaque(false);
  armyorangeSpeedSlider.addEventHandler(this, "armyorangeSpeedSliderDragged");
  armyorangeALabel = new GLabel(orangeArmyWindow, 20, 330, 200, 20);
  armyorangeALabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyorangeALabel.setText("Aggression Level");
  armyorangeALabel.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyorangeALabel.setOpaque(false);
  armyorangeAggressionSlider = new GSlider(orangeArmyWindow, 20, 350, 200, 40, 10.0);
  armyorangeAggressionSlider.setShowValue(true);
  armyorangeAggressionSlider.setShowLimits(true);
  armyorangeAggressionSlider.setLimits(3.0, 3.0, 5.0);
  armyorangeAggressionSlider.setNumberFormat(G4P.DECIMAL, 2);
  armyorangeAggressionSlider.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyorangeAggressionSlider.setOpaque(false);
  armyorangeAggressionSlider.addEventHandler(this, "armyorangeAggressionSliderDrag");
  armyoELabel = new GLabel(orangeArmyWindow, 20, 400, 200, 20); //470
  armyoELabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  armyoELabel.setText("Arrow Speed");
  armyoELabel.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyoELabel.setOpaque(false);
  armyorangearcherArrowSpeedSlider = new GSlider(orangeArmyWindow, 20, 420, 200, 40, 10.0);
  armyorangearcherArrowSpeedSlider.setShowValue(true);
  armyorangearcherArrowSpeedSlider.setLimits(1.0, 1.0, 5.0);
  armyorangearcherArrowSpeedSlider.setNumberFormat(G4P.DECIMAL, 2);
  armyorangearcherArrowSpeedSlider.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  armyorangearcherArrowSpeedSlider.setOpaque(false);
  armyorangearcherArrowSpeedSlider.addEventHandler(this, "armyorangearcherArrowSpeedSliderDrag");
  orangeMagicButton = new GButton(orangeArmyWindow, 20, 470, 200, 30); //540
  orangeMagicButton.setText("❇ MAGIC BOOST ❇");
  orangeMagicButton.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  orangeMagicButton.addEventHandler(this, "orangeMagicClicked");
  orangeReinforcementButton = new GButton(orangeArmyWindow, 20, 510, 200, 30);
  orangeReinforcementButton.setText("> REREINFORCEMENT <");
  orangeReinforcementButton.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  orangeReinforcementButton.addEventHandler(this, "orangeReinforcementButtonClicked");
  orangeText = new GLabel(orangeArmyWindow, 20, 560, 200, 70);
  orangeText.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  orangeText.setText("report updates...");
  orangeText.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  orangeText.setOpaque(true);
  numArmyWindow.loop();
  redArmyWindow.loop();
  blueArmyWindow.loop();
  purpleArmyWindow.loop();
  orangeArmyWindow.loop();
}

// Variable declarations 
// autogenerated do not edit
GButton goButton; 
GButton exitButton; 
GWindow numArmyWindow;
GLabel numArmyLabel; 
GLabel titleLabel; 
GSlider numArmySlider; 
GButton numArmyButton; 
GCheckbox winterCheckbox; 
GWindow redArmyWindow;
GLabel redintroLabel; 
GLabel armyRedLabel; 
GLabel armyredLabel; 
GLabel armyRedNum5; 
GDropList armyRed5Drop; 
GLabel armyRedNum2; 
GLabel armyRedNum3; 
GLabel armyRedNum4; 
GDropList armyRed4Drop; 
GDropList armyRed3Drop; 
GDropList armyRed2Drop; 
GLabel armyredMLabel1; 
GDropList armyRedFDrop; 
GLabel armyredSLabel; 
GSlider armyredSpeedSlider; 
GLabel armyredALabel; 
GSlider armyredAggressionSlider; 
GLabel armyredELabel; 
GSlider armyredarcherArrowSpeedSlider; 
GButton redMagicButton; 
GButton redReinforcementButton; 
GLabel redText; 
GWindow blueArmyWindow;
GLabel blueintroLabel; 
GLabel armyBlueLabel; 
GLabel armyblueLabel; 
GLabel armyBlueNum5; 
GLabel armyBlueNum4; 
GLabel armyBlueNum3; 
GLabel armyBlueNum2; 
GDropList armyBlue5Drop; 
GDropList armyBlue4Drop; 
GDropList armyBlue3Drop; 
GDropList armyBlue2Drop; 
GLabel armyblueMLabel; 
GDropList armyBlueFDrop; 
GLabel armyblueSLabel; 
GSlider armyblueSpeedSlider; 
GLabel armyblueALabel; 
GSlider armyblueAggressionSlider; 
GLabel armybELabel; 
GSlider armybluearcherArrowSpeedSlider; 
GButton blueMagicButton; 
GButton blueReinforcementButton; 
GLabel blueText; 
GWindow purpleArmyWindow;
GLabel purpleintroLabel; 
GLabel armyPurpleLabel; 
GLabel armypurpleLabel; 
GLabel armyPurpleNum5; 
GLabel armyPurpleNum4; 
GLabel armyPurpleNum3; 
GLabel armyPurpleNum2; 
GDropList armyPurple5Drop; 
GDropList armyPurple4Drop; 
GDropList armyPurple3Drop; 
GDropList armyPurple2Drop; 
GLabel armypurpleMLabel; 
GSlider armypurpleSpeedSlider; 
GDropList armyPurpleFDrop; 
GLabel armypurpleSLabel; 
GLabel armypurpleALabel; 
GSlider armypurpleAggressionSlider; 
GLabel armypELabel; 
GSlider armypurplearcherArrowSpeedSlider; 
GButton purpleMagicButton; 
GButton purpleReinforcementButton; 
GLabel purpleText; 
GWindow orangeArmyWindow;
GLabel orangeintroLabel; 
GLabel armyOrangeLabel; 
GLabel armyorangeLabel; 
GLabel armyOrangeNum2; 
GLabel armyOrangeNum3; 
GLabel armyOrangeNum4; 
GLabel armyOrangeNum5; 
GLabel armyorangeMLabel; 
GDropList armyOrange5Drop; 
GDropList armyOrange4Drop; 
GDropList armyOrange3Drop; 
GDropList armyOrange2Drop; 
GDropList armyOrangeFDrop; 
GLabel armyorangeSLabel; 
GSlider armyorangeSpeedSlider; 
GLabel armyorangeALabel; 
GSlider armyorangeAggressionSlider; 
GLabel armyoELabel; 
GSlider armyorangearcherArrowSpeedSlider; 
GButton orangeMagicButton; 
GButton orangeReinforcementButton; 
GLabel orangeText; 
