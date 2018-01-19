//variables
import grafica.*;

int timer;
int timer2;
int timer3;
boolean check = false;

void setup(){
  size(500, 350);
  background(150); 
  frameRate(1);
}

void draw(){
  if (millis() - timer3 >= 3590000) {
      check = true;
      
  }
  
  if (check == true){
   call();
   check = false;
   timer3 = millis();
 }

  //values = new JSONArray();
  
   //main.setFloat("temp", temp);
   //values.setJSONObject(0, main);
  
   
  //saveJSONArray(values, "data/new.json");
    
  // Prepare the points for the plot
 
}


   
   
/* convert unix time concatonation
http://www.convert-unix-time.com/api?timestamp=1513630800&timezone=Edmonton */

/* convert unix time concatonation
http://www.convert-unix-time.com/api?
timestamp=dt_forecast
&timezone=Edmonton */