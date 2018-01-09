//String[] words = {"aepple", "bear", "cat", "dog"};
//String[] list = split(words, ' ');


// Writes the strings to a file, each on a separate line
//saveStrings("nouns.txt", words);

boolean check = false;
int timer3;

void draw(){

if (millis() - timer3 >= 3000) {
      check = true;
      
  }
  
if (check == true){
   println("test");
   check = false;
   timer3 = millis();
 }
}