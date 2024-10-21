import 'package:world_clock/utils/utils.dart';

class WorldTime {

  late String location; // Location name for the UI
  late String time; // Time in the location
  late String flag; // URL to an asset flag icon
  late String url; // Location API endpoint URL
  bool isDayTime = false; // check is the day time or not

  WorldTime({ 
    required this.location, 
    required this.flag, 
    required this.url 
  });

  Future<void> getTime() async {
    try {
      Map data = await getApi('https://worldtimeapi.org/api/timezone/$url');
    
    // get properties
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].toString();
    String hours = offset.substring(1,3);
    String minutes = offset.substring(4,6);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));

    // set time property
    isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    time = getTimeFormat(now);
    }
    catch(err) {
      print('Error in getTime: $err');
      time = 'Can not get the time data';
    }
  }
}