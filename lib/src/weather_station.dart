part of weatherStationModel;


class WeatherStation {
  
  String stationName;
  double latitute;
  double longitude;

  List<AnemometerReading> readings;
  
  WeatherStation(){
    readings = new List<AnemometerReading>();
  }

  void parse(String payload) {
    var lines = payload.split('/n/r');
    
    readings.clear();
  }
}
