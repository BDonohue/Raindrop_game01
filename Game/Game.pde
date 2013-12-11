//Project by Brandon Donohue

ArrayList<Raindrop> Rain = new ArrayList<Raindrop>();
int input, score;
Levels level = new Levels();
Catcher catcher = new Catcher();

void setup() {
  size(500, 500);
}

void draw() {
  if (level.level(level.score) == 0) {
    //reset raindrops inbetween levels
    Rain = new ArrayList<Raindrop>();
    //makes the background beautiful
    cursor(ARROW);
    background(80, 220, 230); 
    rainbow(750, 255, 0, 0);
    rainbow(725, 255, 128, 0);
    rainbow(700, 255, 255, 0);
    rainbow(675, 0, 255, 0);
    rainbow(650, 0, 0, 255);
    rainbow(625, 200, 0, 255);
    rainbow(600, 80, 220, 230);
    //keep the score updated
    fill(0);
    level.scorebox();
    //adds points to proceed to next level
    if (level.strt()) {
      input = input + 25; 
      level.scoreupdate(input);
    }
  }

  else {   
    //even more beautiful plain background
    noCursor();
    background(0);
    //as the levels proceed, the rain comes faster 
    if (frameCount%150 == 0 && level.level(level.score) == 1) {
      Rain.add(new Raindrop());
      lightning();
    }
    else if (frameCount%140 == 0 && level.level(level.score) == 2) {
      Rain.add(new Raindrop());
      lightning();
    }
    else if (frameCount%130 == 0 && level.level(level.score) == 3) {
      Rain.add(new Raindrop());
      lightning();
    } 
    else if (frameCount%120 == 0 && level.level(level.score) == 4) {
      Rain.add(new Raindrop());
      lightning();
    } 
    else if (frameCount%110 == 0 && level.level(level.score) == 5) {
      Rain.add(new Raindrop());
      lightning();
    } 
    else if (frameCount%100 == 0 && level.level(level.score) == 6) {
      Rain.add(new Raindrop());
      lightning();
    } 
    //making it rain
    for (int i = Rain.size()-1; i >= 0; i--) {
      Raindrop rain = Rain.get(i);
      rain.update();
      input = rain.test();
      level.scoreupdate(input);
    }
    //adding in the catcher
    catcher.display(mouseX);
    //scorebox
    fill(255);
    level.scorebox();
  }
}

//clean up making a rainbow for interval screen
void rainbow(int x, int a, int b, int c) {
  fill(a, b, c);
  noStroke();
  ellipse(width/2, height-50, x, x);
}

void lightning() {
  fill(210, 100, 0);
  noStroke();
  quad(255, 0, 255, 270, 225, 310, 210, 0);
  triangle(255, 190, 285, 150, 255, 500);
}

