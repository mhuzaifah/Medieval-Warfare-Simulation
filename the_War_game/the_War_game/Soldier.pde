class Soldier {
  PVector Location = new PVector();    // soldier location
  Army army;                           // which army they belong to
  String title;                        // are they footsoldier, horsemen, archer or general
  color uniform;                       // colour based on army
  boolean alive;                       // are they killed or not (yet) :P
  float speed;                         // how fast they are moving
  float setSpeed;                      // initial speed --> can change from gui/user input
  int numHits;                         // how many times they were hit (important to decide when they are killed)   
  float size;                          // different soldiers have different sizes
  Soldier target;                      // targetted soldier the current soldier is moving towards
  PVector arrowTarget;                 // arrows final location
  int targetNum;                       // number of targets
  int targetArmy;                      // number of armies to defeat
  boolean hasTarget;                   // soldier has something to do (found target)
  boolean hasArrow;                    // does archer have arrow? (archer can't continuously send arrows)
  PVector arrowLoc;                    // location of arrow
  float fade = 1;                      // important to cause fading animation when soldier dies
  float x = 0.025;                     // used to draw components
  boolean doneFading;                  // when soldier's corpse have competely decomposed into nothingness 
  int framesSinceLastShot;             // used to declare when the archer has another arrow
  boolean hasShot;

  // Constructor
  Soldier( Army a, String t ) {
    this.army = a;
    this.title = t;
    this.alive = true;
    this.uniform = this.army.armyColor;
    this.doneFading = false;
    this.framesSinceLastShot = 0;

    //Setting a soldiers speed depending on their rank
    if ( this.title.indexOf("F") == 0)
      this.speed = 0.175;

    else if ( this.title.indexOf("H") == 0)
      this.speed = 0.35;

    else if ( this.title.indexOf("A") == 0 )
      this.speed = 0.15;

    else {
      this.speed = 0.225;
    }
  }

  // drawing soldier on screen
  void drawSoldier() {
    fill( this.uniform );
    if ( this.title.indexOf("F") == 0) {
      circle(this.Location.x, this.Location.y, 15 );
      this.size = 15;
    } else if ( this.title.indexOf("H") == 0) {
      rect(this.Location.x, this.Location.y, 10, 15);
      this.size = 15;
    } else if ( this.title.indexOf("A") == 0 ) {
      triangle(this.Location.x, this.Location.y, this.Location.x + 7.5, this.Location.y - 15, this.Location.x + 15, this.Location.y);
      this.size = 15;
    } else if ( this.title.indexOf("G") == 0 ) {
      square( this.Location.x, this.Location.y, 25 );
      this.size = 15;
    }
  }

  void fade() { //Makes a soldier fade away when they die
    if ( this.alive == false ) {
      fadeFactor = map(fade, 0, 1, 0, 255);
      if ( this.army.name == "Red")
        this.uniform = color(255, 0, 0, fadeFactor);
      else if ( this.army.name == "Blue" )
        this.uniform = color(0, 0, 255, fadeFactor);
      else if ( this.army.name == "Orange" )
        this.uniform = color(250, 160, 122, fadeFactor);
      else if ( this.army.name == "Purple" )
        this.uniform = color(220, 0, 220, fadeFactor);

      if ( fadeFactor > 55 )
        fade -= x;
      else {
        this.doneFading = true;
      }
    }
  }

  // Check if soldier is dead or not
  void checkAlive( int i ) {
    if ( this.alive == false && this.doneFading == true) {
      this.army.soldiers.remove(i);
      this.army.deathCount++;
    }
  }

  // declare who would get hit or die during show downs
  void fight() {
    Soldier enemy = this.target;
    float pc = 0;
    
    if ( this.army.retreat == false ) {
    float distTarget = getDist( this.Location.x, this.Location.y, enemy.Location.x, enemy.Location.y );
    

    if ( distTarget < ((this.size/2) + (enemy.size/2)) ) { //Checking if a soldier and its target are in contact
      pc = random(0, 1);
      if ( this.title.indexOf("G") == 0 ) { //The probabilites of either the soldier or its target winning when they encounter, probabilities change depending on ranks 
        if ( enemy.title.indexOf("G") == 0 ) {
          if (pc < 0.5) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        } else if ( enemy.title.indexOf("H") == 0 ) {
          if (pc < 0.80) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        } else if ( enemy.title.indexOf("A") == 0 ) {
          if (pc < 0.97) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        } else {
          if (pc < 0.90) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        }
      } else if ( this.title.indexOf("H") == 0 ) {
        if ( enemy.title.indexOf("G") == 0 ) {
          if (pc < 0.20) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        } else if ( enemy.title.indexOf("H") == 0 ) {
          if (pc < 0.50) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        } else if ( enemy.title.indexOf("A") == 0 ) {
          if (pc < 0.95) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        } else {
          if (pc < 0.75) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        }
      } else if ( this.title.indexOf("H") == 0 ) {
        if ( enemy.title.indexOf("G") == 0 ) {
          if (pc < 0.03) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        } else if ( enemy.title.indexOf("H") == 0 ) {
          if (pc < 0.05) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        } else if ( enemy.title.indexOf("A") == 0 ) {
          if (pc < 0.50) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        } else {
          if (pc < 0.15) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        }
      } else { // if title is foot soldier
        if ( enemy.title.indexOf("G") == 0 ) {
          if (pc < 0.10) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        } else if ( enemy.title.indexOf("H") == 0 ) {
          if (pc < 0.25) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        } else if ( enemy.title.indexOf("A") == 0 ) {
          if (pc < 0.85) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        } else {
          pc = random(0, 1);
          if (pc < 0.50) {
            enemy.alive = false;
          } else {
            this.alive = false;
          }
        }
      }
    }
    }
  }

  void moveSoldier() { //Moving the soldier towards its target or to its army's base if retreating
    if ( this.army.retreat == true ) {
      float theta = atan2(this.army.base.y - this.Location.y, this.army.base.x - this.Location.x);
      float newX = cos(theta) * this.speed + this.Location.x;
      float newY = sin(theta) * this.speed + this.Location.y;
      this.Location.set(newX, newY);

      float distFromBase = getDist( this.Location.x, this.Location.y, this.army.base.x, this.army.base.y );

      if ( distFromBase < 2 )
        this.alive = false;
    } else {
      findClosestEnemy();
      if ( this.target.alive == true ) {
        Soldier enemy = this.target;
        float theta = atan2(enemy.Location.y - this.Location.y, enemy.Location.x - this.Location.x);
        float newX = cos(theta) * this.speed + this.Location.x;
        float newY = sin(theta) * this.speed + this.Location.y;
        this.Location.set(newX, newY);
      } else {
        this.Location.set( this.Location.x, this.Location.y );
      }
    }
  }

  void checkForArrow() { //Checks if archer can shoot arrow
    Soldier enemy = this.target;
    float distTarget = getDist( this.Location.x, this.Location.y, enemy.Location.x, enemy.Location.y );

    if ( this.framesSinceLastShot % 225 == 0 ) {
      if ( distTarget < 500 ) {
        float initialTargetX = enemy.Location.x;
        float initialTargetY = enemy.Location.y;
        this.hasArrow = true;      
        arrowLoc = new PVector( this.Location.x, this.Location.y );
        arrowTarget = new PVector( initialTargetX, initialTargetY );
      }
    } else {
      this.framesSinceLastShot += 1;
    }
  }

  void arrow() { //Makes archer shoot an arrow at their target
    Soldier enemy = this.target;
    int arrowSpeed = this.army.archerArrowSpeed;
    this.speed = 0;
    this.framesSinceLastShot += 1;
    fill(255);
    triangle(arrowLoc.x, arrowLoc.y, arrowLoc.x + 5, arrowLoc.y - 10, arrowLoc.x + 10, arrowLoc.y);
    float theta = atan2(arrowTarget.y - arrowLoc.y, arrowTarget.x - arrowLoc.x);
    float newX = cos(theta) * arrowSpeed + arrowLoc.x;
    float newY = sin(theta) * arrowSpeed + arrowLoc.y;
    arrowLoc.set(newX, newY);

    float dist1 = getDist( arrowLoc.x, arrowLoc.y, arrowTarget.x, arrowTarget.y );
    float dist2 = getDist( arrowLoc.x, arrowLoc.y, enemy.Location.x, enemy.Location.y );
    if ( dist1 < ((enemy.size/2) + 5) ) {
      if ( dist2 < ((enemy.size/2) + 5) ) {
        this.hasArrow = false;
        this.speed = 0.15;
        float pc = random(0, 1);
        if ( enemy.title == "commander" ) { //Different proabilities of an archer's target surviving or dying when hit by their arrow
          if ( pc < 0.10 )
            enemy.alive = false;
        } else if ( enemy.title == "horse man" ) { 
          if ( pc < 0.15 )
            enemy.alive = false;
        } else { //If enemy is a foot soldier or archer
          if ( pc < 0.20 )
            enemy.alive = false;
        }
      } else {
        this.hasArrow = false;
        this.speed = 0.15;
      }
    }
  }

  // declare soldier's final destination (an enemy)
  void findClosestEnemy() { 
    float dist = sqrt(pow((width), 2) + pow((height), 2));

    for ( int j = 0; j < armies.size(); j++) {
      for ( int i = 0; i < armies.get(j).soldiers.size(); i++) {
        Army a = armies.get(j);
        Soldier e = a.soldiers.get(i);
        ;
        if ( a != this.army ) {
          if ( e.alive == true ) {
            float targetDist = getDist( this.Location.x, this.Location.y, e.Location.x, e.Location.y );
            if ( targetDist < dist ) {
              dist = targetDist;
              this.target = e;
            }
          }
        }
      }
    }
  }

  float getDist( float sX, float sY, float eX, float eY ) {
    float dist = sqrt(pow((eX - sX), 2) + pow((eY-sY), 2));
    return dist;
  }
}
