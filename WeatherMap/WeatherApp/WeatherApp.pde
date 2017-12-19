//variables


JSONObject jsonCurrentEdmonton = loadJSONObject ("http://api.openweathermap.org/data/2.5/weather?id=5946768&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");
JSONObject jsonForecastEdmonton = loadJSONObject ("http://api.openweathermap.org/data/2.5/forecast?id=5946768&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");

JSONObject jsonCurrentAlberta = loadJSONObject ("http://api.openweathermap.org/data/2.5/weather?id=5883102&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");
JSONObject jsonForecastAlberta = loadJSONObject ("http://api.openweathermap.org/data/2.5/forecast?id=5883102&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");

JSONObject jsonCurrentMoscow = loadJSONObject ("http://api.openweathermap.org/data/2.5/weather?id=524901&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");
JSONObject jsonForecastMoscow = loadJSONObject ("http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");



JSONArray list = jsonForecastEdmonton.getJSONArray ("list"); //unwraps [] or for list
JSONObject all = list.getJSONObject(0); //unwraps [] or for list
JSONObject main = all.getJSONObject("main");

float temp = main.getFloat ("temp"); //loads variable value of dt 
int dt_forecast = all.getInt ("dt"); //loads variable value of dt 

String currentTime = "http://www.convert-unix-time.com/api?timestamp=" + dt_forecast + "&timezone=Edmonton";
JSONObject localTimeJSONObject = loadJSONObject (currentTime);
String humanDt = localTimeJSONObject.getString ("localDate");

println(humanDt);
println(temp);



/* convert unix time concatonation
http://www.convert-unix-time.com/api?timestamp=1513630800&timezone=Edmonton */

/* convert unix time concatonation
http://www.convert-unix-time.com/api?
timestamp=dt_forecast
&timezone=Edmonton */

//void setup() {}

//void draw() {}