library tests;

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

 
  test('Anemometer line parse test', () {
    var testLine = '2013/06/14,13:10.00,167,180,191,6.66,10.83,14.28,600';
    var value = new AnemometerReading.parse(testLine);
    expect(value.timeStamp.hour,equals(13));
    expect(value.timeStamp.minute,equals(10));
    expect(value.backed,equals(167));
    expect(value.maxWindSpeed,equals(14.28));
  });

}