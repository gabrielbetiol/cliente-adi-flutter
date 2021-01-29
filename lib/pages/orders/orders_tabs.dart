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
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Criar'),
        backgroundColor: Colors.blueAccent,
        icon: Icon(Icons.add),
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
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      // backgroundColor: Colors.blueGrey[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Color.fromRGBO(18, 18, 18, 1),
          // backgroundColor: Colors.blueGrey[50],
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
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
                      // color: Colors.grey[800],
                      color: Colors.white,
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
                //     backgroundImage: AssetImage('assets/images/face.jpeg'),
                //   ),
                // ),
                // IconButton(
                //   icon: Icon(
                //     Icons.refresh_outlined,
                //     color: Colors.grey[300],
                //   ),
                //   onPressed: () {
                //     controller.start('ABERTA');
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
                contentPadding: EdgeInsets.symmetric(horizontal: 5),
                buttonMargin: EdgeInsets.only(left: 10),
                // unselectedBackgroundColor: Colors.grey[300],
                unselectedBorderColor: Colors.grey[800],
                unselectedBackgroundColor: Colors.grey[800],
                unselectedLabelStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.warning,
                      color: Colors.yellowAccent,
                    ),
                    text: "Abertas".toUpperCase(),
                  ),
                  Tab(
                    icon: Icon(Icons.done, color: Colors.greenAccent),
                    text: "Concluídas".toUpperCase(),
                  ),
                  Tab(
                    icon: Icon(Icons.dangerous, color: Colors.redAccent),
                    text: 'Canceladas'.toUpperCase(),
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
