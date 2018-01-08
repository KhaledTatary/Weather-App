//String[] words = {"aepple", "bear", "cat", "dog"};
//String[] list = split(words, ' ');


// Writes the strings to a file, each on a separate line
//saveStrings("nouns.txt", words);

ArrayList <Drawing> drawings = new ArrayList <Drawing>();
int[] x = {2};
int[] test;


int timer;

void setup() {
    size(500, 500);
    test = copying(x);
}

void draw() {
  if (millis() - timer >= 9000) {
      background(random(255));
      x[0] = x[0] + 1;
      timer = millis();
      println(x[0]);
      println(test[0]);
      
  }
  saveStrings("test.txt",str(x));
}
    