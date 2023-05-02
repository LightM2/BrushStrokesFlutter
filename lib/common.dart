import 'package:intl/intl.dart';

String currentTime() {
  var now = new DateTime.now();
  var formatter = new DateFormat('dd.MM H:mm');
  String currentTime = formatter.format(now);
  return currentTime;
}
