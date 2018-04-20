void jsons(final int num, final int num2, final int num3){
  JSONObject jsonCurrentEdmonton = loadJSONObject ("http://api.openweathermap.org/data/2.5/weather?id=5946768&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");
  JSONObject jsonForecastEdmonton = loadJSONObject ("http://api.openweathermap.org/data/2.5/forecast?id=5946768&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");

  JSONObject jsonCurrentAlberta = loadJSONObject ("http://api.openweathermap.org/data/2.5/weather?id=5883102&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");
  JSONObject jsonForecastAlberta = loadJSONObject ("http://api.openweathermap.org/data/2.5/forecast?id=5883102&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");

  JSONObject jsonCurrentMoscow = loadJSONObject ("http://api.openweathermap.org/data/2.5/weather?id=524901&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");
  JSONObject jsonForecastMoscow = loadJSONObject ("http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=0855aae3d6e2eecb468ab2ee7142bfb6&mode=JSON&units=metric");
  
  list[num] = jsonForecastEdmonton.getJSONArray ("list"); //unwraps [] or for list
  all[num] = list[num].getJSONObject(num2); //unwraps [] or for list
  main[num] = all[num].getJSONObject("main");
  
  
  /*temp[num3] = main[num].getFloat ("temp"); 
  minTemp[num3] = main[num].getFloat ("temp_min");
  maxTemp[num3] = main[num].getFloat ("temp_max");
  humidity[num3] = main[num].getFloat ("humidity");
  */
  futureTemp[num3] = main[num].getFloat ("temp"); 
  futureMinTemp[num3] = main[num].getFloat ("temp_min");
  futureMaxTemp[num3] = main[num].getFloat ("temp_max");
  futureHumidity[num3] = main[num].getFloat ("humidity");
}