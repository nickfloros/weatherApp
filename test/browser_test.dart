library tests;
import 'dart:core';
import 'dart:html';
import 'dart:json';
import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';

import 'package:js/js.dart' as js;
import 'package:weatherApp/weather_station_model.dart';

injectSource(code) {
  final script = new ScriptElement();
  script.type = 'text/javascript';
  script.innerHtml = code;
  document.body.nodes.add(script);
}

main() {
  useHtmlConfiguration();

  test('AnemometerReading line parse test', () {
    String testLine = '2013/06/14,13:10.00,167,180,191,6.66,10.83,14.28,600';
    var value = new AnemometerReading.parse(testLine);
    expect(value.timeStamp.hour,equals(13));
    expect(value.timeStamp.minute,equals(10));
    expect(value.backed,equals(167));
    expect(value.maxWindSpeed,equals(14.28));
  });

  test('WeatherStation : payload read ',() {
    try {
      var request = HttpRequest.getString('http://www.weather-file.com/highcliffe/data/20130614.csv').then((String payload) {
        print(payload);
        expect(payload.length>0,true);
      });
    }
    on HttpRequestProgressEvent {
      expect(true,false);
    }
    catch ( e) {
      expect(true,false);
    }
  });
}