part of weatherStationModel;

class AnemometerReading {
  
  DateTime timeStamp;
  int backed;
  int avgWindDirection;
  int veered;
  
  double minWindSpeed;
  double avgWindSpeed;
  double maxWindSpeed;
  
  AnemometerReading() {}
  
  factory AnemometerReading.parse(String line) {
    AnemometerReading value = new AnemometerReading();
    
    return value;
  }
}