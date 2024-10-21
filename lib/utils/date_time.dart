import 'package:intl/intl.dart';

String getTimeFormat (DateTime dateTime) {

  return DateFormat.jm().format(dateTime);
}