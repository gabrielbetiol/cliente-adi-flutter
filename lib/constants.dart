import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Constants {
  // static const String baseUrl = 'http://10.0.2.2:8080/api/';
  static const String baseUrl =
      'https://osworks-spring-cloud-osworks-api.azuremicroservices.io/api/';
  static const Map<String, Color> statusOrder = {
    'ABERTA': Colors.yellowAccent,
    'FINALIZADA': Colors.greenAccent,
    'CANCELADA': Colors.redAccent,
  };

  // static const String logoTag = 'near.huscarl.loginsample.logo';
  // static const String titleTag = 'near.huscarl.loginsample.title';
}
