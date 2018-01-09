void call() {
  JSONObject jsonCurrentEdmonton = loadJSONObject ("http://api.openweathermap.org/data/2.5/weather?id=5946768&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");
  JSONObject jsonForecastEdmonton = loadJSONObject ("http://api.openweathermap.org/data/2.5/forecast?id=5946768&APPID=21995a8a612e093a8a76892078dcf714&mode=JSON&units=metric");

  JSONObject jsonCurrentAlberta = loadJSONObject ("http://api.openweathermap.org/data/2.5/weather?id=5883102&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");
  JSONObject jsonForecastAlberta = loadJSONObject ("http://api.openweathermap.org/data/2.5/forecast?id=5883102&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");

  JSONObject jsonCurrentMoscow = loadJSONObject ("http://api.openweathermap.org/data/2.5/weather?id=524901&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");
  JSONObject jsonForecastMoscow = loadJSONObject ("http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");


  JSONArray list = jsonForecastEdmonton.getJSONArray ("list"); //unwraps [] or for list
  JSONObject all = list.getJSONObject(0); //unwraps [] or for list
  JSONObject main = all.getJSONObject("main");

  float[] temp = {main.getFloat ("temp")}; //loads variable value of dt 
  float[] test;
  

  test = copying(temp);
  //saveStrings();
  
  
  int dt_forecast = all.getInt ("dt"); //loads variable value of dt 

  String currentTime = "http://www.convert-unix-time.com/api?timestamp=" + dt_forecast + "&timezone=Edmonton";
  JSONObject localTimeJSONObject = loadJSONObject (currentTime);
  String humanDt = localTimeJSONObject.getString ("localDate");
  
  if (millis() - timer >= 3600000) {
      println(humanDt);
      println(temp[0]);
      println(test[0]);
      timer = millis();
  }
  int nPoints = 30;
  GPointsArray points = new GPointsArray(nPoints);
  
  if (millis() - timer2 >= 3600000) {
     points.add(1, temp[0]);
     timer2 = millis();
     
     
  }
  
  
  // Create a new plot and set its position on the screen
  GPlot plot = new GPlot(this);
    plot.setPos(25, 14);
  
  // Set the plot title and the axis labels
  plot.setPoints(points);
  plot.getXAxis().setAxisLabelText("Time (14 days)");
  plot.getYAxis().setAxisLabelText("Temp (C)");
  plot.setTitleText("Temprature difference for 14 days");

  // Draw it!
  plot.defaultDraw();
  
  //end of graph
  //println(test);
}