part of weatherStationClient;

@observable
class WeatherStationClient extends WeatherStation {
  
  int _stationId;
  bool updateInProgress;
  var updatePeriod = new Duration(seconds:10);
  //@observable
  String nextUpdateString;
  //@observable
  int count=0;

  WeatherStationClient(){
    updateInProgress=false;
    nextUpdate = new DateTime.now();
  }

  factory WeatherStationClient.create(int stationId, String stationName) {
    var value = new WeatherStationClient();
    value._stationId = stationId;
    value.stationName = stationName;
    return value;
  }
  
  /** 
   * reads data from server -- 
   * this should do an http get to extract the data but 
   * for the time lets simulate the cost with a timer.
   * it adds an entry in readings ; which only timestamp is added
   */
  Future<int> read() {
    updateInProgress=true;
    Completer comp = new Completer<int>();
    var timer = new Timer(updatePeriod, (){
      readings.add(new AnemometerReading.create());
      updateInProgress=false; // indicates update is now completed
      comp.complete(readings.length);
      print('$stationName - ${readings.length}');
      nextUpdate = nextUpdate.add(updatePeriod);
      nextUpdateString = nextUpdate.toString();
      count = readings.length;
    });
    return comp.future;
  }
  
  int get readCounter =>  readings.length;
}