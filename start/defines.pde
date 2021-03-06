
void call() {
  JSONObject jsonCurrentEdmonton = loadJSONObject ("http://api.openweathermap.org/data/2.5/weather?id=5946768&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");
  JSONObject jsonForecastEdmonton = loadJSONObject ("http://api.openweathermap.org/data/2.5/forecast?id=5946768&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");

  JSONObject jsonCurrentAlberta = loadJSONObject ("http://api.openweathermap.org/data/2.5/weather?id=5883102&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");
  JSONObject jsonForecastAlberta = loadJSONObject ("http://api.openweathermap.org/data/2.5/forecast?id=5883102&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");

  JSONObject jsonCurrentMoscow = loadJSONObject ("http://api.openweathermap.org/data/2.5/weather?id=524901&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");
  JSONObject jsonForecastMoscow = loadJSONObject ("http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");

  

  
  //for Edmonton forecast
  JSONArray list = jsonForecastEdmonton.getJSONArray ("list"); //unwraps [] or for list
  JSONObject all = list.getJSONObject(0); //unwraps [] or for list
  JSONObject main = all.getJSONObject("main");
  //For Alberta forecast
  JSONArray list2 = jsonForecastAlberta.getJSONArray ("list"); //unwraps [] or for list
  JSONObject all2 = list2.getJSONObject(0); //unwraps [] or for list
  JSONObject main2 = all2.getJSONObject("main");
  //For Moscow forecast
  JSONArray list3 = jsonForecastMoscow.getJSONArray ("list"); //unwraps [] or for list
  JSONObject all3 = list3.getJSONObject(0); //unwraps [] or for list
  JSONObject main3 = all3.getJSONObject("main");
  
  

  int dt_forecast = all.getInt ("dt"); //loads variable value of dt 

  String currentTime = "http://www.convert-unix-time.com/api?timestamp=" + dt_forecast + "&timezone=Edmonton";
  JSONObject localTimeJSONObject = loadJSONObject (currentTime);
  String humanDt = localTimeJSONObject.getString ("localDate");

    if (millis() - timer4 >= 1000) { //adds more arries every time the timer hits a certain time
      index2 = index2 +1;
      timer4 = millis();
  }
  //86400000
  temp[index2] = main.getFloat ("temp"); 
  minTemp[index2] = main.getFloat ("temp_min");
  maxTemp[index2] = main.getFloat ("temp_max");
  humidity[index2] = main.getFloat ("humidity");
  
  temp2[index2] = main2.getFloat ("temp");
  minTemp2[index2] = main2.getFloat ("temp_min");
  maxTemp2[index2] = main2.getFloat ("temp_max");
  humidity2[index2] = main2.getFloat ("humidity");
  
  temp3[index2] = main3.getFloat ("temp");
  minTemp3[index2] = main3.getFloat ("temp_min");
  maxTemp3[index2] = main3.getFloat ("temp_max");
  humidity3[index2] = main3.getFloat ("humidity");
  //saves the arraies to text file incase
  saveStrings("edmonton/temprature.txt", str(temp));
  saveStrings("edmonton/minimunTemprature.txt", str(minTemp));
  saveStrings("edmonton/maximumTemprature.txt", str(maxTemp));
  saveStrings("edmonton/humidity.txt", str(humidity));
  
  saveStrings("alberta/temprature.txt", str(temp2));
  saveStrings("alberta/minimunTemprature.txt", str(minTemp2));
  saveStrings("alberta/maximumTemprature.txt", str(maxTemp2));
  saveStrings("alberta/humidity.txt", str(humidity2));
  
  saveStrings("moscow/temprature.txt", str(temp3));
  saveStrings("moscow/minimunTemprature.txt", str(minTemp3));
  saveStrings("moscow/maximumTemprature.txt", str(maxTemp3));
  saveStrings("moscow/humidity.txt", str(humidity3));


  println(humanDt);
  println(temp[index2]);
  println(minTemp[index2]);
  println(maxTemp[index2]);
  println(humidity[index2]);
  println("Temprature" + "\n");
  println(temp);
  println("Max Temprature" + "\n");
  println(maxTemp);
  println("Min Temprature" + "\n");
  println(minTemp);
  println("Humidity" + "\n");
  println(humidity);

      
  // Under here is just graphing from the grafic library (be warned it is way too long)    
      
      
  int nPoints = 30;
  GPointsArray points = new GPointsArray(nPoints);
  
  
  // Create a new plot and set its position on the screen
  GPlot plot = new GPlot(this);
    plot.setPos(width*1/64, int(height*2/43));
    plot.setDim(width*1/5,height/4.7);
    points.add(1,temp[1]);
    points.add(2,temp[2]);
    points.add(3,temp[3]);
    points.add(4,temp[4]);
    points.add(5,temp[5]);
    points.add(6,temp[6]);
    points.add(7,temp[7]);
    points.add(8,temp[8]);
    points.add(9,temp[9]);
    points.add(10,temp[10]);
    points.add(11,temp[11]);
    points.add(12,temp[12]);
    points.add(13,temp[13]);
    points.add(14,temp[14]);
    
  // Set the plot title and the axis labels
  plot.setPoints(points);
  plot.getXAxis().setAxisLabelText("Time (14 days from the start of the program)");
  plot.getYAxis().setAxisLabelText("Temprature (C)");
  plot.setTitleText("Temprature difference for 14 days");

  // Draw it!
  plot.defaultDraw();
  
  //end of graph


  GPointsArray points2 = new GPointsArray(nPoints);
  
  
  // Create a new plot and set its position on the screen
  GPlot plot2 = new GPlot(this);
    plot2.setPos(width*1/64, int(height*2/43*7 +10));
    plot2.setDim(width*1/5,height/4.7);
    points2.add(1,maxTemp[1]);
    points2.add(2,maxTemp[2]);
    points2.add(3,maxTemp[3]);
    points2.add(4,maxTemp[4]);
    points2.add(5,maxTemp[5]);
    points2.add(6,maxTemp[6]);
    points2.add(7,maxTemp[7]);
    points2.add(8,maxTemp[8]);
    points2.add(9,maxTemp[9]);
    points2.add(10,maxTemp[10]);
    points2.add(11,maxTemp[11]);
    points2.add(12,maxTemp[12]);
    points2.add(13,maxTemp[13]);
    points2.add(14,maxTemp[14]);
    
    
  // Set the plot title and the axis labels
  plot2.setPoints(points2);
  plot2.getXAxis().setAxisLabelText("Time (14 days from the start of the program)");
  plot2.getYAxis().setAxisLabelText("Maximum Temprature (C)");
  plot2.setTitleText("Temprature difference for 14 days");

  // Draw it!
  plot2.defaultDraw();
  
  //end of graph
  
  GPointsArray points3 = new GPointsArray(nPoints);
  
  // Create a new plot and set its position on the screen
  GPlot plot3 = new GPlot(this);
    plot3.setPos(width*1/64, int(height*2/43*13 +10*2));
    plot3.setDim(width*1/5,height/4.7);
    points3.add(1,minTemp[1]);
    points3.add(2,minTemp[2]);
    points3.add(3,minTemp[3]);
    points2.add(4,minTemp[4]);
    points3.add(5,minTemp[5]);
    points3.add(6,minTemp[6]);
    points3.add(7,minTemp[7]);
    points3.add(8,minTemp[8]);
    points3.add(9,minTemp[9]);
    points3.add(10,minTemp[10]);
    points3.add(11,minTemp[11]);
    points3.add(12,minTemp[12]);
    points3.add(13,minTemp[13]);
    points3.add(14,minTemp[14]);
    
    
  // Set the plot title and the axis labels
  plot3.setPoints(points3);
  plot3.getXAxis().setAxisLabelText("Time (14 days from the start of the program)");
  plot3.getYAxis().setAxisLabelText("Minimum Temprature (C)");
  plot3.setTitleText("Temprature difference for 14 days");

  // Draw it!
  plot3.defaultDraw();
  //end of graph
  
  GPointsArray points4 = new GPointsArray(nPoints);
  
  
  // Create a new plot and set its position on the screen
  GPlot plot4 = new GPlot(this);
    plot4.setPos(width*1/3.6, int(height*2/43));
    plot4.setDim(width*1/5,height/4.7);
    points4.add(1,humidity[1]);
    points4.add(2,humidity[2]);
    points4.add(3,humidity[3]);
    points4.add(4,humidity[4]);
    points4.add(5,humidity[5]);
    points4.add(6,humidity[6]);
    points4.add(7,humidity[7]);
    points4.add(8,humidity[8]);
    points4.add(9,humidity[9]);
    points4.add(10,humidity[10]);
    points4.add(11,humidity[11]);
    points4.add(12,humidity[12]);
    points4.add(13,humidity[13]);
    points4.add(14,humidity[14]);
    
    
  // Set the plot title and the axis labels
  plot4.setPoints(points4);
  plot4.getXAxis().setAxisLabelText("Time (14 days from the start of the program)");
  plot4.getYAxis().setAxisLabelText("Humidity");
  plot4.setTitleText("Temprature difference for 14 days");

  // Draw it!
  plot4.defaultDraw();
  /*
  GPointsArray points5 = new GPointsArray(nPoints);
  
  
  // Create a new plot and set its position on the screen
  GPlot plot5 = new GPlot(this);
    plot5.setPos(width*1/3.8, int(height*2/43*7 + 70));
    plot5.setDim(width*1/5,height/4.7);
    points5.add(1,temp2[1]);
    points5.add(2,temp2[2]);
    points5.add(3,temp2[3]);
    points5.add(4,temp2[4]);
    points5.add(5,temp2[5]);
    points5.add(6,temp2[6]);
    points5.add(7,temp2[7]);
    points5.add(8,temp2[8]);
    points5.add(9,temp2[9]);
    points5.add(10,temp2[10]);
    points5.add(11,temp2[11]);
    points5.add(12,temp2[12]);
    points5.add(13,temp2[13]);
    points5.add(14,temp2[14]);
    
    
  // Set the plot title and the axis labels
  plot5.setPoints(points5);
  plot5.getXAxis().setAxisLabelText("Time (14 days from the start of the program)");
  plot5.getYAxis().setAxisLabelText("Temprature (C)");
  plot5.setTitleText("Temprature difference for 14 days");

  // Draw it!
  plot5.defaultDraw();
  //end og graph
  
   GPointsArray points6 = new GPointsArray(nPoints);
  
  
  // Create a new plot and set its position on the screen
  GPlot plot6 = new GPlot(this);
    plot6.setPos(width*1/3.8, int(height*2/43*14 + 30));
    plot6.setDim(width*1/5,height/4.7);
    points6.add(1,maxTemp2[1]);
    points6.add(2,maxTemp2[2]);
    points6.add(3,maxTemp2[3]);
    points6.add(4,maxTemp2[4]);
    points6.add(5,maxTemp2[5]);
    points6.add(6,maxTemp2[6]);
    points6.add(7,maxTemp2[7]);
    points6.add(8,maxTemp2[8]);
    points6.add(9,maxTemp2[9]);
    points6.add(10,maxTemp2[10]);
    points6.add(11,maxTemp2[11]);
    points6.add(12,maxTemp2[12]);
    points6.add(13,maxTemp2[13]);
    points6.add(14,maxTemp2[14]);
    
    
  // Set the plot title and the axis labels
  plot6.setPoints(points6);
  plot6.getXAxis().setAxisLabelText("Time (14 days from the start of the program)");
  plot6.getYAxis().setAxisLabelText("Maximum Temprature (C)");
  plot6.setTitleText("Temprature difference for 14 days");

  // Draw it!
  plot6.defaultDraw();
  //end of graph
  
  GPointsArray points7 = new GPointsArray(nPoints);
  
  
  // Create a new plot and set its position on the screen
  GPlot plot7 = new GPlot(this);
    plot7.setPos(width*1/2, int(height*2/43));
    plot7.setDim(width*1/5,height/4.7);
    points7.add(1,minTemp2[1]);
    points7.add(2,minTemp2[2]);
    points7.add(3,minTemp2[3]);
    points7.add(4,minTemp2[4]);
    points7.add(5,minTemp2[5]);
    points7.add(6,minTemp2[6]);
    points7.add(7,minTemp2[7]);
    points7.add(8,minTemp2[8]);
    points7.add(9,minTemp2[9]);
    points7.add(10,minTemp2[10]);
    points7.add(11,minTemp2[11]);
    points7.add(12,minTemp2[12]);
    points7.add(13,minTemp2[13]);
    points7.add(14,minTemp2[14]);
    
    
  // Set the plot title and the axis labels
  plot7.setPoints(points7);
  plot7.getXAxis().setAxisLabelText("Time (14 days from the start of the program)");
  plot7.getYAxis().setAxisLabelText("Minimum Temprature (C)");
  plot7.setTitleText("Temprature difference for 14 days");

  // Draw it!
  plot7.defaultDraw();
  //end of graph

  GPointsArray points8 = new GPointsArray(nPoints);
  
  
  // Create a new plot and set its position on the screen
  GPlot plot8 = new GPlot(this);
    plot8.setPos(width*1/2, int(height*2/43*7 + 10));
    plot8.setDim(width*1/5,height/4.7);
    points8.add(1,humidity2[1]);
    points8.add(2,humidity2[2]);
    points8.add(3,humidity2[3]);
    points8.add(4,humidity2[4]);
    points8.add(5,humidity2[5]);
    points8.add(6,humidity2[6]);
    points8.add(7,humidity2[7]);
    points8.add(8,humidity2[8]);
    points8.add(9,humidity2[9]);
    points8.add(10,humidity2[10]);
    points8.add(11,humidity2[11]);
    points8.add(12,humidity2[12]);
    points8.add(13,humidity2[13]);
    points8.add(14,humidity2[14]);
    
    
  // Set the plot title and the axis labels
  plot8.setPoints(points8);
  plot8.getXAxis().setAxisLabelText("Time (14 days from the start of the program)");
  plot8.getYAxis().setAxisLabelText("Humidity");
  plot8.setTitleText("Temprature difference for 14 days");

  // Draw it!
  plot8.defaultDraw();
  //end of graph
  
  GPointsArray points9 = new GPointsArray(nPoints);
  
  
  // Create a new plot and set its position on the screen
  GPlot plot9 = new GPlot(this);
    plot9.setPos(width*1/2, int(height*2/43*14 + 30));
    plot9.setDim(width*1/5,height/4.7);
    points9.add(1,temp3[1]);
    points9.add(2,temp3[2]);
    points9.add(3,temp3[3]);
    points9.add(4,temp3[4]);
    points9.add(5,temp3[5]);
    points9.add(6,temp3[6]);
    points9.add(7,temp3[7]);
    points9.add(8,temp3[8]);
    points9.add(9,temp3[9]);
    points9.add(10,temp3[10]);
    points9.add(11,temp3[11]);
    points9.add(12,temp3[12]);
    points9.add(13,temp3[13]);
    points9.add(14,temp3[14]);
    
    
  // Set the plot title and the axis labels
  plot9.setPoints(points9);
  plot9.getXAxis().setAxisLabelText("Time (14 days from the start of the program)");
  plot9.getYAxis().setAxisLabelText("Temprature (C)");
  plot9.setTitleText("Temprature difference for 14 days");

  // Draw it!
  plot9.defaultDraw();
  //end of graph
  
  GPointsArray points10 = new GPointsArray(nPoints);
  
  // Create a new plot and set its position on the screen
  GPlot plot10 = new GPlot(this);
    plot10.setPos(width*1/1.35, int(height*2/43));
    plot10.setDim(width*1/5,height/4.7);
    points10.add(1,maxTemp3[1]);
    points10.add(2,maxTemp3[2]);
    points10.add(3,maxTemp3[3]);
    points10.add(4,maxTemp3[4]);
    points10.add(5,maxTemp3[5]);
    points10.add(6,maxTemp3[6]);
    points10.add(7,maxTemp3[7]);
    points10.add(8,maxTemp3[8]);
    points10.add(9,maxTemp3[9]);
    points10.add(10,maxTemp3[10]);
    points10.add(11,maxTemp3[11]);
    points10.add(12,maxTemp3[12]);
    points10.add(13,maxTemp3[13]);
    points10.add(14,maxTemp3[14]);
    
    
  // Set the plot title and the axis labels
  plot10.setPoints(points10);
  plot10.getXAxis().setAxisLabelText("Time (14 days from the start of the program)");
  plot10.getYAxis().setAxisLabelText("Maximum Temprature (C)");
  plot10.setTitleText("Temprature difference for 14 days");

  // Draw it!
  plot10.defaultDraw();
  //end of graph
  
  GPointsArray points11 = new GPointsArray(nPoints);
  
  // Create a new plot and set its position on the screen
  GPlot plot11 = new GPlot(this);
    plot11.setPos(width*1/1.35, int(height*2/43*7 + 10));
    plot11.setDim(width*1/5,height/4.7);
    points11.add(1,minTemp3[1]);
    points11.add(2,minTemp3[2]);
    points11.add(3,minTemp3[3]);
    points11.add(4,minTemp3[4]);
    points11.add(5,minTemp3[5]);
    points11.add(6,minTemp3[6]);
    points11.add(7,minTemp3[7]);
    points11.add(8,minTemp3[8]);
    points11.add(9,minTemp3[9]);
    points11.add(10,minTemp3[10]);
    points11.add(11,minTemp3[11]);
    points11.add(12,minTemp3[12]);
    points11.add(13,minTemp3[13]);
    points11.add(14,minTemp3[14]);
    
    
  // Set the plot title and the axis labels
  plot11.setPoints(points11);
  plot11.getXAxis().setAxisLabelText("Time (14 days from the start of the program)");
  plot11.getYAxis().setAxisLabelText("Minimum Temprature (C)");
  plot11.setTitleText("Temprature difference for 14 days");

  // Draw it!
  plot11.defaultDraw();
  
  //end of graph
    GPointsArray points12 = new GPointsArray(nPoints);
  
  // Create a new plot and set its position on the screen
  GPlot plot12 = new GPlot(this);
    plot12.setPos(width*1/1.35, int(height*2/43*14 + 30));
    plot12.setDim(width*1/5,height/4.7);
    points12.add(1,humidity[1]);
    points12.add(2,humidity[2]);
    points12.add(3,humidity[3]);
    points12.add(4,humidity[4]);
    points12.add(5,humidity[5]);
    points12.add(6,humidity[6]);
    points12.add(7,humidity[7]);
    points12.add(8,humidity[8]);
    points12.add(9,humidity[9]);
    points12.add(10,humidity[10]);
    points12.add(11,humidity[11]);
    points12.add(12,humidity[12]);
    points12.add(13,humidity[13]);
    points12.add(14,humidity[14]);
    
    
  // Set the plot title and the axis labels
  plot12.setPoints(points12);
  plot12.getXAxis().setAxisLabelText("Time (14 days from the start of the program)");
  plot12.getYAxis().setAxisLabelText("Minimum Temprature (C)");
  plot12.setTitleText("Temprature difference for 14 days");

  // Draw it!
  plot12.defaultDraw();
  //end of graph
  */
}