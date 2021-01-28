import 'package:flutter/material.dart';

import 'package:client/controllers/home_controller.dart';

class ClienteDetailPage extends StatefulWidget {
  int idCliente;
  ClienteDetailPage({
    Key key,
    this.idCliente,
  }) : super(key: key);

  @override
  _ClienteDetailPageState createState() => _ClienteDetailPageState();
}

class _ClienteDetailPageState extends State<ClienteDetailPage> {
  final controller = HomeController();

  _sucess() {
    var cliente = controller.cliente;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Nome:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  cliente.nome,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  cliente.email,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Telefone',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  cliente.telefone,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _error() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          controller.startById(widget.idCliente);
        },
        child: Text("Tentar Novamente"),
      ),
    );
  }

  _loading() {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
      child: Center(
        child: CircularProgressIndicator(),
      ),
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
    controller.startById(widget.idCliente);
  }

  @override
  Widget build(BuildContext context) {
    print(controller.state);
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 33, 33, 1),
      // backgroundColor: Colors.blueGrey[50],

      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: Colors.blueAccent,
      //     ),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   // backgroundColor: Colors.blueGrey[50],
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Expanded(
      //     child: Text(
      //       // 'Ordens de Serviço',
      //       'Informações do Cliente',
      //       textAlign: TextAlign.left,
      //       style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 23,
      //         letterSpacing: 0.27,
      //         color: Colors.grey[800],
      //         fontFamily: 'Prompt',
      //       ),
      //     ),
      //   ),
      // ),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              // Container(
              //     padding: EdgeInsets.only(left: 10.0),
              //     height: MediaQuery.of(context).size.height * 0.4,
              //     decoration: new BoxDecoration(
              //       image: new DecorationImage(
              //         image: new AssetImage("assets/images/repair.jpeg"),
              //         fit: BoxFit.cover,
              //       ),
              //     )),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: EdgeInsets.all(40.0),
                width: MediaQuery.of(context).size.width,
                decoration:
                    // BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
                    BoxDecoration(color: Colors.blueAccent),
                child: Center(
                  child: topContentText(),
                ),
              ),
              Positioned(
                left: 15.0,
                top: 40.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
            ],
          ),
          AnimatedBuilder(
            animation: controller.state,
            builder: (contex, child) {
              return stateManagement(controller.state.value);
            },
          ),
        ],
      ),
    );
  }

  topContentText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40.0),
            Icon(
              Icons.info,
              color: Colors.white,
              size: 30.0,
            ),
            SizedBox(height: 20.0),
            Container(
              width: 90.0,
              child: Divider(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Informações do Cliente',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ],
    );
  }
}
