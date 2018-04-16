//variables
import grafica.*;

int timer;
int timer2;
int timer3;
int timer4;
int index = 15;
int index2 = 0;
//for edmonton
float[] temp= new float[index];
float[] futureTemp= new float[index];
float[] minTemp= new float[index];
float[] maxTemp= new float[index];
float[] humidity= new float[index];
//for alberta
float[] temp2= new float[index]; 
float[] minTemp2= new float[index];
float[] maxTemp2= new float[index];
float[] humidity2= new float[index];
//for moscow
float[] temp3= new float[index]; 
float[] minTemp3= new float[index];
float[] maxTemp3= new float[index];
float[] humidity3= new float[index];
JSONArray[] list = new JSONArray[15];
JSONObject[] all = new JSONObject[15];
JSONObject[] main = new JSONObject[15];
boolean check = false;
boolean stop = false;

void setup(){
  fullScreen();
  background(150); 
  frameRate(1);
  textSize(26);
  text("Edmonton", width*1/10, height*1/36);
  

}
//86401000
void draw(){
  if (millis() - timer3 >= 2000) { //checks if the timer hits a specific amount of millisecond and activate the code
      check = true;
      
  }
  
  if (check == true){
   
   call(); //calls on the code and graphs
   check = false;
   timer3 = millis(); //resets the timer
 }
 
  if (index2 == 14) {  //stops the code from looping once the array storages reaches its limit, to prevent crashs
      stop = true;
     
  }
}


   
   
/* convert unix time concatonation
http://www.convert-unix-time.com/api?timestamp=1513630800&timezone=Edmonton */

/* convert unix time concatonation
http://www.convert-unix-time.com/api?
timestamp=dt_forecast
&timezone=Edmonton */