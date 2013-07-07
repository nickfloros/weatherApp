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
  
  /**
   * create an empty instance sets only timeStamp to now
   */
  factory AnemometerReading.create() {
    AnemometerReading value = new AnemometerReading();
    value.timeStamp = new DateTime.now();
    return value;
  }
  
  /**
   * create instance from a comma seperated line of the followining format
   * date,time,back_twd,avg_twd,veer_twd,min_tws,avg_tws,max_tws,sampleSize
   * e.g.
   * 2013/03/03,00:00.00,035,054,065,4.97,7.58,9.30,600
   */
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