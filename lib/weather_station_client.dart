library weatherStationClient;

import 'dart:html';
import 'dart:async';

import 'package:web_ui/web_ui.dart';

import 'weather_station_model.dart';
export 'weather_station_model.dart';

part 'src/client/weather_station_client.dart';

class WeatherStations {
  
  static WeatherStations _instance;
  
  factory WeatherStations.getInstance() {
    if (_instance == null)
      _instance = new WeatherStations._internal();
    return _instance;
  }
  
  List<WeatherStationClient> stations;
  Timer _readerThread;
  Duration _timerDuration;
  
  bool readThreadActive;
  
  WeatherStations._internal() { 
    stations = new List<WeatherStationClient>();
    // create two stations
    stations.add(new WeatherStationClient.create(1,'station 1'));
    stations.add(new WeatherStationClient.create(2,'station 2'));
    _startReaderThreads();
  }
  
  void _startReaderThreads() {
    _readData(); // first read 
    _timerDuration = new Duration(seconds:30);
    _readerThread = new Timer.periodic(_timerDuration, (timer) {
      _readData();
    });
  }
  
  void _readData() {
    for (var item in stations) {
      print('reading ${item.stationName}');
      if (!item.updateInProgress) // this should be replaced with use of future
        item.read();
    }    
  }
  void stopReader() {
    if (_readerThread!=null)
      _readerThread.cancel();
  }
 
  
}