part of weatherStationModel;


abstract class WeatherStation {
  
  String stationName;
  double latitute;
  double longitude;
  DateTime nextUpdate;
  DateTime lastSampled;
  
  List<AnemometerReading> readings;
  
  WeatherStation(){
    readings = new List<AnemometerReading>();
  }

  void parse(String payload) {
    var lines = payload.split('/n/r');
    
    readings.clear();
  }
  
  void read(){}
}
