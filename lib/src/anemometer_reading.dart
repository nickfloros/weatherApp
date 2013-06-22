part of weatherStationModel;

/**
 * single reading from anemometer
 */
class AnemometerReading {

  /**
   * when reading was made
   */
  DateTime timeStamp; 
  /**
   * The most backed (anticlockwise) wind direction reading during the 10 minute averaging period
   */
  int backed;
  /**
   * The average wind direction during the 10 minute averaging period
   */
  int avgDirection;
  /**
   * The most veered (clockwise) wind direction reading during the 10 minute averaging period
   * 
   */
  int veered;
  /**
   * the mininum wind speed in knots during the 10 min average period
   */
  double minWindSpeed;
  /**
   * the average wind speed in knots during the 10 min average period
   */  
  double avgWindSpeed;

  /**
   * the maximum wind speed in knots during the 10 min average period
   */
  double maxWindSpeed;

  static const String lineSeperator = ',';
  
  AnemometerReading() {}
  
  factory AnemometerReading.parse(String line) {
    AnemometerReading value = new AnemometerReading();
    var fields = line.split(lineSeperator);
    var dateString = fields[0].replaceAll('/','-');
    var timeString = fields[1].replaceAll('.',':');
    print('${dateString} ${timeString}');
    value.timeStamp = DateTime.parse('${dateString} ${timeString}');
    value.backed = int.parse(fields[2]);
    value.avgDirection = int.parse(fields[3]);
    value.veered = int.parse(fields[4]);
    value.minWindSpeed = double.parse(fields[5]);
    value.avgWindSpeed = double.parse(fields[6]);
    value.maxWindSpeed = double.parse(fields[7]);
    return value;
  }
}