import 'package:client/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'pages/clientes/client_page.dart';
import 'pages/orders/orders_home.dart';
import 'pages/orders/orders_tabs.dart';
import 'pages/profile/profile_page.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Client',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      // home: OrdersTabs(),
      // routes: {
      //   AppRoutes.HOME: (ctx) => HomePage(), //ñ funciona
      //   AppRoutes.ORDERS: (ctx) => OrdersTabs(),
      //   AppRoutes.CLIENTS: (ctx) => ClientPage(),
      //   AppRoutes.SETTINGS: (ctx) => ProfilePage(),
      // },
    );
  }
}
