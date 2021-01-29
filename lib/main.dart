import 'package:client/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

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
      home: _introScreen(),
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

Widget _introScreen() {
  return Scaffold(
    body: Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 2,
          gradientBackground: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.grey[900], Colors.black],
          ),
          navigateAfterSeconds: HomePage(),
          loaderColor: Colors.transparent,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo3.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                child: Text(
                  // 'Ordens de Serviço',
                  'SmartOS',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    letterSpacing: 0.32,
                    // color: Colors.grey[800],
                    color: Colors.white,
                    fontFamily: 'Prompt',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
