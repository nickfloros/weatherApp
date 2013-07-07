
import 'dart:html';
import 'dart:collection';
import 'package:web_ui/web_ui.dart';
import 'package:weatherApp/weather_station_client.dart';

class StationViewer extends WebComponent {
  @observable
  int count = 0;

  @observable
  WeatherStation station;
  
  StationViewer() {
    
  }
  
  void increment() {
    count++;
  }
}
