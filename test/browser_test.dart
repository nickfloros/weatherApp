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
    var line='2013/06/14,00:10.00,243,249,255,13.97,16.71,19.92,600';
    AnemometerReading value = new AnemometerReading.parse(line);
    expect(value.backed, equals(243));
  });

}