// Auto-generated from stationviewer.html.
// DO NOT EDIT.

library x_station_viewer;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'dart:html';
import 'dart:collection';
import 'package:web_ui/web_ui.dart';
import '../weather_station_client.dart';



class StationViewer extends WebComponent with Observable  {
  /** Autogenerated from the template. */

  autogenerated.ScopedCssMapper _css;

  /** This field is deprecated, use getShadowRoot instead. */
  get _root => getShadowRoot("x-station_viewer");
  static final __shadowTemplate = new autogenerated.DocumentFragment.html('''
        <div>
          <ul>
          <li></li>
          <li></li><li>
          </li><li></li><li>
          </li><li></li><li>
          </li><li></li>
          </ul>
        </div>
      ''');
  autogenerated.LIElement __e10, __e2, __e4, __e6, __e8;
  autogenerated.Template __t;

  void created_autogenerated() {
    var __root = createShadowRoot("x-station_viewer");
    setScopedCss("x-station_viewer", new autogenerated.ScopedCssMapper({"x-station_viewer":"[is=\"x-station_viewer\"]"}));
    _css = getScopedCss("x-station_viewer");
    __t = new autogenerated.Template(__root);
    __root.nodes.add(__shadowTemplate.clone(true));
    __e2 = __root.nodes[1].nodes[1].nodes[1];
    var __binding1 = __t.contentBind(() => station.stationName, false);
    __e2.nodes.addAll([new autogenerated.Text('station name :'),
        __binding1]);
    __e4 = __root.nodes[1].nodes[1].nodes[3];
    var __binding3 = __t.contentBind(() => station.nextUpdate, false);
    __e4.nodes.addAll([new autogenerated.Text('next update: '),
        __binding3]);
    __e6 = __root.nodes[1].nodes[1].nodes[5];
    var __binding5 = __t.contentBind(() => station.nextUpdateString, false);
    __e6.nodes.addAll([new autogenerated.Text('next update (string copy): '),
        __binding5]);
    __e8 = __root.nodes[1].nodes[1].nodes[7];
    var __binding7 = __t.contentBind(() => station.readings.length, false);
    __e8.nodes.addAll([new autogenerated.Text('readCounter from mode.WeatherStation: '),
        __binding7]);
    __e10 = __root.nodes[1].nodes[1].nodes[9];
    var __binding9 = __t.contentBind(() => station.count, false);
    __e10.nodes.addAll([new autogenerated.Text('read count from WeatherStationClient: '),
        __binding9]);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e2 = __e4 = __e6 = __e8 = __e10 = null;
  }

  /** Original code from the component. */

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

  WeatherStation __$station;
  WeatherStation get station {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'station');
    }
    return __$station;
  }
  set station(WeatherStation value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'station',
          __$station, value);
    }
    __$station = value;
  }
  
  StationViewer() {
    
  }
  
  void increment() {
    count++;
  }
}

//# sourceMappingURL=stationviewer.dart.map