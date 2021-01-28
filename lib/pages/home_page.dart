import 'package:client/pages/clientes/client_page.dart';
import 'package:client/pages/orders/orders_home.dart';
import 'package:flutter/material.dart';

import 'orders/orders_tabs.dart';
import 'profile/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  //
  int _currentIndex = 0;

  final List<Widget> _children = [
    // OrderPage(),
    OrdersTabs(),
    ClientPage(),
    // ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        height: 60,
        color: Color.fromRGBO(18, 18, 18, 1),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          // type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          selectedLabelStyle: TextStyle(fontSize: 15),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.handyman),
              // icon: Icon(Icons.home_repair_service),
              label: 'Ordens',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: 'Clientes',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.settings),
            //   label: 'Configurações',
            //   // activeIcon: Icon(Icons.mail_outline),
            // ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
