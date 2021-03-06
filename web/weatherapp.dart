import 'dart:html';
import 'package:js/js.dart' as js;
import 'dart:async';
import 'package:google_maps/google_maps.dart' as gMap;

import 'package:web_ui/web_ui.dart';
import 'package:weatherApp/weather_station_client.dart';

// initial value for click-counter
int startingCount = 5;

/**
 * Learn about the Web UI package by visiting
 * http://www.dartlang.org/articles/dart-web-components/.
 */

WeatherStations weatherStations;
var dragSourceEl;
void main() {
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;
  
  weatherStations = new WeatherStations.getInstance();
  weatherStations.stations;
  
  final mapOptions = new gMap.MapOptions()
  ..zoom = 14
  ..center = new gMap.LatLng(50.724321, -1.741471)
  ..mapTypeId = gMap.MapTypeId.ROADMAP
  
  ;
  var lymington = new gMap.LatLng(50.740067, -1.506770);
  var highCliff=new gMap.LatLng(50.724321, -1.741471);
  final map = new gMap.GMap(query("#map_canvas"), mapOptions);
   var bound = new gMap.LatLngBounds();
   
   /*
   var scrollPanel=query('#fooPanel');
   
   scrollPanel.onTouchStart.listen((TouchEvent event) {
     print('onTouchStart');
   });
   scrollPanel.onTouchMove.listen((TouchEvent event) {
     print('onTouchMove ${event.touches[0].screen.x}, ${event.touches[0].screen.y}');
   });
   
   scrollPanel.onTouchMove.listen((TouchEvent event) {
     int x = event.touches[0].screen.x;
     int y = event.touches[1].screen.y;
     print('onTouchMove ${x}, ${y}');     
   });   
   
   scrollPanel.onDragStart.listen((event) {
     print('onDragStart');
   });
   */
}


void handleTouch(Event e) {
  print('received event');
}

void _onTouchStart(var event){
 print(event.$dom_clientX);
}

void _onTouchMove(var event){
}
