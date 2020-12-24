import 'dart:convert';
// import 'dart:html';

import 'package:client/models/client_model.dart';
import 'package:client/models/order_model.dart';
import 'package:client/repositories/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   _getClients().then((map) {
  //     listaResponse = map;
  //     print('client status >>>>>>>>>>>');
  //     print(listaResponse.length);
  //   });
  // }

  // List<Order> _order;

  // Future<List<Order>> _getOrder() async {
  //   try {
  //     List<Order> listOrder = List();
  //     final response = await http.get('http://localhost:8080/api/ordens-servico');
  //     if (response.statusCode == 200) {
  //       var decodeJson = jsonDecode(response.body);
  //       decodeJson.forEach((item) => listOrder.add(Order.fromJson(item)));
  //       return listOrder;
  //     } else {
  //       print("Erro ao carregar lista 1");
  //       return null;
  //     }
  //   } catch (e) {
  //     print("Erro ao carregar lista 2");
  //     return null;
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _getOrder().then((map) {
  //     _order = map;
  //     print('order status >>>>>>>>>>>');
  //     print(_order.length);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  // 'Ordens de Serviço',
                  'Work Orders',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                    letterSpacing: 0.27,
                    color: Colors.grey[800],
                    fontFamily: 'Prompt',
                  ),
                ),
              ),
              Icon(
                Icons.notifications_outlined,
                size: 30,
                color: Colors.blueGrey[100],
              ),
              SizedBox(width: 10),
              Container(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage('https://picsum.photos/200'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: _body(),
      ),
    );
  }

//   _body() {
//     List<Client> clientes = ClientesApi.getClients();
//     print(clientes);
//     return _listView(clientes);
//   }

//   _listView(clientes) {
//     return ListView.builder(
//       itemCount: clientes.length,
//       itemBuilder: (context, index) {
//         Client c = clientes[index];
//         return Card(
//           child: Column(
//             children: [
//               Text(c.nome),
//               Text(c.email),
//               Text(c.telefone),
//               ButtonBar(
//                 children: [
//                   FlatButton(
//                     onPressed: () {},
//                     child: Text("detalhes"),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

  _body() {
    Future<List<Client>> clientes = ClientesApi.getClients();
    return FutureBuilder(
      future: clientes,
      builder: (context, snapshot) {
        List<Client> clientes = snapshot.data;
        print(clientes);
        return _listView(clientes);
        // return Center(child: Text("Body"));
      },
    );
  }

  _listView(clientes) {
    return ListView.builder(
      itemCount: clientes.length,
      itemBuilder: (context, index) {
        Client c = clientes[index];
        return Card(
          child: Column(
            children: [
              Text(c.nome),
              Text(c.email),
              Text(c.telefone),
              ButtonBar(
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Text("detalhes"),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
