part of weatherStationClient;

@observable
class WeatherStationClient extends WeatherStation with Observable  {
  
  int __$_stationId;
  int get _stationId {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, '_stationId');
    }
    return __$_stationId;
  }
  set _stationId(int value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, '_stationId',
          __$_stationId, value);
    }
    __$_stationId = value;
  }
  bool __$updateInProgress;
  bool get updateInProgress {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'updateInProgress');
    }
    return __$updateInProgress;
  }
  set updateInProgress(bool value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'updateInProgress',
          __$updateInProgress, value);
    }
    __$updateInProgress = value;
  }
  dynamic __$updatePeriod = new Duration(seconds:10);
  dynamic get updatePeriod {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'updatePeriod');
    }
    return __$updatePeriod;
  }
  set updatePeriod(dynamic value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'updatePeriod',
          __$updatePeriod, value);
    }
    __$updatePeriod = value;
  }
  //@observable
  String __$nextUpdateString;
  String get nextUpdateString {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'nextUpdateString');
    }
    return __$nextUpdateString;
  }
  set nextUpdateString(String value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'nextUpdateString',
          __$nextUpdateString, value);
    }
    __$nextUpdateString = value;
  }
  //@observable
  int __$count = 0;
  int get count {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'count');
    }
    return __$count;
  }
  set count(int value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'count',
          __$count, value);
    }
    __$count = value;
  }

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
//# sourceMappingURL=weather_station_client.dart.map