import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:client/controllers/order_controller.dart';
import 'package:flutter/material.dart';

import 'new_order_page.dart';
import 'orders_list.dart';

class OrdersTabs extends StatelessWidget {
  final controller = OrderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return NewOrderPage();
              },
            ),
          );
        },
      ),
      // backgroundColor: Colors.white,
      backgroundColor: Colors.blueGrey[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child: AppBar(
          // backgroundColor: Colors.white,
          backgroundColor: Colors.blueGrey[50],
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 23, left: 8, right: 8, bottom: 8),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    // 'Ordens de Serviço',
                    'Ordens de Serviço',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      letterSpacing: 0.27,
                      color: Colors.grey[800],
                      fontFamily: 'Prompt',
                    ),
                  ),
                ),
                // Icon(
                //   Icons.notifications_outlined,
                //   size: 30,
                //   color: Colors.blueGrey[100],
                // ),
                // SizedBox(width: 10),
                // Container(
                //   width: 40,
                //   height: 40,
                //   child: CircleAvatar(
                //     radius: 10,
                //     backgroundImage: NetworkImage('https://picsum.photos/200'),
                //   ),
                // ),
                // IconButton(
                //   icon: Icon(
                //     Icons.refresh_outlined,
                //     color: Colors.blueGrey,
                //   ),
                //   onPressed: () {
                //     controller.start();
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                backgroundColor: Colors.blueAccent,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                buttonMargin: EdgeInsets.only(left: 15),
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.warning,
                      color: Colors.yellowAccent,
                    ),
                    text: "Abertas",
                  ),
                  Tab(
                    icon: Icon(Icons.done, color: Colors.greenAccent),
                    text: "Fechadas",
                  ),
                  Tab(
                    icon: Icon(Icons.dangerous, color: Colors.red),
                    text: 'Canceladas',
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    OrdersList(status: 'ABERTA', controller: controller),
                    OrdersList(status: 'FINALIZADA', controller: controller),
                    OrdersList(status: 'CANCELADA', controller: controller),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
