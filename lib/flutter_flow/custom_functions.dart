import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

String testCustomFunction(String name) {
  // Add your function code here!
  return name;
}

String ttestCustomFunction2(String place) {
  // print place name
  List<String> splitAddress = place.split(',');
  String locationAddress = splitAddress[1] + ', ' + splitAddress[0];
  String cityAndState = splitAddress[2] + ', ' + splitAddress[3];

  return (splitAddress[3] == ' GA' || splitAddress[3].length == 2)
      ? locationAddress
      : (splitAddress[3] == 'ga' ? locationAddress : cityAndState);
}
