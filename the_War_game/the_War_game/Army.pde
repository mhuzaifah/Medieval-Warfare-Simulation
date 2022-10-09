class Army {
  String name;                                                // name of army
  color armyColor;                                            // colour of army
  boolean retreat;                                            // is the army retreating
  PVector base = new PVector();                               // original location
  float aggression;                                           // the army's aggression --> will affect when they retreat
  ArrayList<Soldier> soldiers = new ArrayList<Soldier>();     // list of soldiers
  int deathCount;                                             // number of dead soldiers
  boolean usedBoost;                                          // whether the army already used its magic boost
  boolean checkRetreat;                                       // check if army should retreated
  boolean defeated;                                           // is army defeated
  int archerArrowSpeed;                                       // speed of archers' arrows
  boolean alreadyCalledReinforcements;                        // each army can only call for reinforcements once
  boolean reinforcementsButtonPressed;

  // Ratios of types of soldiers
  String fiveOf;                                              // 5 of what type of soldier?
  String fourOf;                                              // 4 of what type of soldier?
  String threeOf;                                             // 3 of what type of soldier?
  String twoOf;                                               // 2 of what type of soldier?

  // Constructor
  Army( String n, color c, int ag ) {
    this.name = n;
    this.armyColor = c;
    this.aggression = ag;
    this.retreat = false;
  }

  void addSoldiers() { //Adding the default amount of soldiers to an army, user can change the ratios of each rank 
    for ( int i = 0; i < 14; i++ ) {
      if ( 0 <= i && i <= 1 )
        this.soldiers.add(new Soldier( this, twoOf ));
      else if ( 2 <= i && i <= 6 )
        this.soldiers.add(new Soldier( this, fiveOf ));
      else if ( 7 <= i && i <= 10 )
        this.soldiers.add(new Soldier( this, fourOf )); 
      else {
        this.soldiers.add(new Soldier( this, threeOf ));
      }
    }
  }

  void makeReinforcements() { //If user calls reinforcements, one soldier of each rank will spawn for that army at it's base
    this.soldiers.add(new Soldier( this, "General" ));
    this.soldiers.get( this.soldiers.size() - 1 ).Location.x = this.base.x;
    this.soldiers.get( this.soldiers.size() - 1 ).Location.y = this.base.y;

    this.soldiers.add(new Soldier( this, "Horse Man" ));
    this.soldiers.get( this.soldiers.size() - 1 ).Location.x = this.base.x;
    this.soldiers.get( this.soldiers.size() - 1 ).Location.y = this.base.y;

    this.soldiers.add(new Soldier( this, "Archer" ));
    this.soldiers.get( this.soldiers.size() - 1 ).Location.x = this.base.x;
    this.soldiers.get( this.soldiers.size() - 1 ).Location.y = this.base.y;

    this.soldiers.add(new Soldier( this, "Foot Soldier" ));
    this.soldiers.get( this.soldiers.size() - 1 ).Location.x = this.base.x;
    this.soldiers.get( this.soldiers.size() - 1 ).Location.y = this.base.y;
  }

  void formation() {  
    float b = 0.0;
    float vex = TWO_PI/25.0;
    float x = 200;
    float y = 200;

    rectMode(CENTER);
    ellipseMode(CENTER);

    // FORMATIONS FOR 2 ARMIES
    if ( numArmies == 2) {
      if ( this.name == "Red" ) {
        this.base.x = width/2;
        this.base.y = 0;
        if ( redArmyForm.indexOf("A") == 7 ) { //"Curved Arrow"
          y=100;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y+sin(b)*160.0;
            b = b + vex;
            x += 30;
          }
        } else if ( redArmyForm.indexOf("a") == 1 ) {
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y-sin(b)*160.0;
            b = b + vex;
            x += 30;
          }
        } else { // classic formation
          x = 135;
          y = 75;       
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y;
            x += 37;
          }
        }
      } else { // Blue team
        this.base.x = width/2;
        this.base.y = height;
        if ( blueArmyForm.indexOf("A") == 7 ) {   //"Curved Arrow"
          y = 700;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y-sin(b)*160.0;
            b = b + vex;
            x += 30;
          }
        } else if ( blueArmyForm.indexOf("a") == 1 ) {
          y = 500;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y+sin(b)*160.0;
            b = b + vex;
            x += 30;
          }
        } else { // classic formation
          x = 135;
          y = 725;

          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y;
            x += 37;
          }
        }
      }
    }

    // FORMATIONS FOR THREE ARMIES
    else if ( numArmies == 3 ) {
      if ( this.name == "Red" ) {
        this.base.x = 0;
        this.base.y = height/2;
        if ( redArmyForm.indexOf("A") == 7 ) {     //"Curved Arrow"
          x = 50;
          y = 50;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x+sin(b)*160.0;
            this.soldiers.get(i).Location.y = y;
            b = b + vex;
            y += 30;
          }
        } else if ( redArmyForm.indexOf("a") == 1 ) {     //"Cave"
          x = 200;
          y = 50;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x-sin(b)*160.0;
            this.soldiers.get(i).Location.y = y;
            b = b + vex;
            y += 30;
          }
        } else { // classic formation
          x = 75;
          y = 100;

          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y;
            y += 37;
          }
        }
      } else if ( this.name == "Blue" ) {
        this.base.x = width/2;
        this.base.y = height;
        if ( blueArmyForm.indexOf("A") == 7 ) {    //"Curved Arrow"
          y = 765;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y-sin(b)*160.0;
            b = b + vex;
            x += 30;
          }
        } else if ( blueArmyForm.indexOf("a") == 1 ) {     //"Cave"
          y = 620;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y+sin(b)*160.0;
            b = b + vex;
            x += 30;
          }
        } else { // classic formation
          x = 150;
          y = 750;

          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y;
            x += 37;
          }
        }
      } else { //Orange Team
        this.base.x = width;
        this.base.y = height/2;
        if ( orangeArmyForm.indexOf("A") == 7 ) {    //"Curved Arrow"
          y = 50;
          x = 750;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x-sin(b)*160.0;
            this.soldiers.get(i).Location.y = y;
            b = b + vex;
            y += 30;
          }
        } else if ( orangeArmyForm.indexOf("a") == 1 ) {     //"Cave"
          y = 50;
          x = 600;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x+sin(b)*160.0;
            this.soldiers.get(i).Location.y = y;
            b = b + vex;
            y += 30;
          }
        } else { // classic formation
          x = 725;
          y = 100;

          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y;
            y += 37;
          }
        }
      }
    }

    // FORMATIONS FOR 4 ARMIES
    else { // 4 Armies
      if ( this.name == "Red" ) {
        this.base.x = width/2;
        this.base.y = 0;
        if ( redArmyForm.indexOf("A") == 7 ) {     //"Curved Arrow"
          y = 50;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y+sin(b)*160.0;
            b = b + vex;
            x += 30;
          }
        } else if ( redArmyForm.indexOf("a") == 1 ) {     //"Cave"
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y-sin(b)*160.0;
            b = b + vex;
            x += 30;
          }
        } else { // classic formation
          x = 150;
          y = 35;

          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y;
            x += 38;
          }
        }
      } else if ( this.name == "Blue" ) {
        this.base.x = width/2;
        this.base.y = height;
        if ( blueArmyForm.indexOf("A") == 7 ) {    //"Curved Arrow"
          y = 765;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y-sin(b)*160.0;
            b = b + vex;
            x += 30;
          }
        } else if ( blueArmyForm.indexOf("a") == 1 ) {     //"Cave"
          y=600;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y+sin(b)*160.0;
            b = b + vex;
            x += 30;
          }
        } else { // classic formation
          x = 150;
          y = 765;

          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y;
            x += 37;
          }
        }
      } else if ( this.name == "Orange" ) {
        this.base.x = 0;
        this.base.y = height/2;
        if ( orangeArmyForm.indexOf("A") == 7 ) {    //"Curved Arrow"
          y = 250;
          x = 50;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x+sin(b)*160.0;
            this.soldiers.get(i).Location.y = y;
            b = b + vex;
            y += 30;
          }
        } else if ( orangeArmyForm.indexOf("a") == 1 ) {     //"Cave"
          y = 250;
          x = 200;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x-sin(b)*160.0;
            this.soldiers.get(i).Location.y = y;
            b = b + vex;
            y += 30;
          }
        } else { // classic formation
          x = 50;
          y = 175;

          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y;
            y += 37;
          }
        }
      } else { //Purple Team
        this.base.x = width;
        this.base.y = height/2;
        if ( purpleArmyForm.indexOf("A") == 7 ) {    //"Curved Arrow"
          y = 250;
          x = 750;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x-sin(b)*160.0;
            this.soldiers.get(i).Location.y = y;
            b = b + vex;
            y += 30;
          }
        } else if ( purpleArmyForm.indexOf("a") == 1 ) {     //"Cave"
          y=250;
          x=600;
          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x+sin(b)*160.0;
            this.soldiers.get(i).Location.y = y;
            b = b + vex;
            y += 30;
          }
        } else { // classic formation
          x = 750;
          y = 175;

          for ( int i = 0; i < this.soldiers.size(); i++ ) {
            this.soldiers.get(i).Location.x = x;
            this.soldiers.get(i).Location.y = y;
            y += 37;
          }
        }
      }
    }
  }

  // Magic boost!
  void magic() {

    // As long as the boost was not already used
    if ( !this.usedBoost ) {

      this.usedBoost = true;
      int die = int( random(0, 4) );

      // Sudden boost of speed
      if ( die == 1 ) {
        for ( int i=0; i< this.soldiers.size(); i++ ) {
          this.soldiers.get(i).speed *= 2;
        }
        reportUpdate ( this, "Soldiers are now travelling twice as fast as before thanks to magic potions." );
      }

      // Summon a demon :P
      else if ( die == 2 ) {

        demonSummoned = true;
        int count = int(this.soldiers.size()*.3); // 30% of the army's soldiers are sacrificed
        deathCount -= count;
        reportUpdate ( this, "Soldiers were sacrificed to summon a demon!" );

        //Soldiers sacrificed and killed
        for ( int i = 0; i<count; i++ ) {
          redArmy.soldiers.get(i).alive = false;
          blueArmy.soldiers.get(i).alive = false;
          purpleArmy.soldiers.get(i).alive = false;
          orangeArmy.soldiers.get(i).alive = false;
        }
      }

      // Magic Arrows
      else if ( die == 3 ) {
        this.archerArrowSpeed *= 3;
        reportUpdate ( this, "Arrows are now magically boosted to travel three times faster" );
      } 

      // Army didn't believe in magic
      else {
        reportUpdate ( this, "oof. No magic boost was prepared" );
      }
    } else 
    reportUpdate( this, "Magic boost already used" );
  }
}
