import 'package:client/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'client_detail_page.dart';

import "../../string_extension.dart";
import 'new_client_page.dart';

class ClientPage extends StatefulWidget {
  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  final controller = HomeController();

  _sucess() {
    return RefreshIndicator(
      onRefresh: () {
        return controller.start();
      },
      child: ListView.builder(
        itemCount: controller.dados.length,
        itemBuilder: (context, index) {
          var cliente = controller.dados[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            // height: 120,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.white, width: 2.0),
              color: Colors.grey[800],
              // color: Colors.blueAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.grey[900],
                  blurRadius: 3.0,
                  offset: new Offset(0.0, 3.0),
                ),
              ],
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ClienteDetailPage(idCliente: cliente.id);
                          },
                        ),
                      );
                    },
                    leading: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    ),
                    title: Text(
                      cliente.nome.capitalize(),
                      style: TextStyle(
                        // fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      cliente.telefone,
                      style: TextStyle(
                        // fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blueAccent,
                      // size: 30,
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }

  _error() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          controller.start();
        },
        child: Text("Tentar Novamente"),
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container(child: Text("teste"));
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.sucess:
        return _sucess();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // here the desired height
        child: AppBar(
          // actions: [
          //   IconButton(
          //     icon: Icon(
          //       Icons.refresh_outlined,
          //       color: Colors.yellow,
          //     ),
          //     onPressed: () {
          //       controller.start();
          //     },
          //   )
          // ],
          // backgroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(18, 18, 18, 1),
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 23, left: 8, right: 8, bottom: 8),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    // 'Ordens de Serviço',
                    'Clientes',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      letterSpacing: 0.27,
                      color: Colors.white,
                      fontFamily: 'Prompt',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return NewClientPage();
                        },
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.add,
                    size: 30,
                    // color: Colors.grey[300],
                    color: Colors.greenAccent,
                  ),
                ),
                // Container(
                //   width: 40,
                //   height: 40,
                //   child: CircleAvatar(
                //     radius: 10,
                //     backgroundImage: NetworkImage('https://picsum.photos/200'),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (contex, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
