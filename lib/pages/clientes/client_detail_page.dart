import 'package:flutter/material.dart';

import 'package:client/controllers/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import 'new_client_page.dart';
import "../../string_extension.dart";

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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Id',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  // Text(
                  //   'Id ' + widget.idCliente.toString(),
                  //   style: TextStyle(
                  //     // fontWeight: FontWeight.bold,
                  //     fontSize: 16,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  Text(
                    cliente.id.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nome',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  // Text(
                  //   'Id ' + widget.idCliente.toString(),
                  //   style: TextStyle(
                  //     // fontWeight: FontWeight.bold,
                  //     fontSize: 16,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  Text(
                    cliente.nome.capitalize(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Text(
              //     cliente.nome.capitalize(),
              //     style: TextStyle(
              //       fontSize: 18,
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    cliente.email,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Text(
              //     cliente.email,
              //     style: TextStyle(
              //       fontSize: 18,
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Telefone',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    cliente.telefone,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Text(
              //     cliente.telefone,
              //     style: TextStyle(
              //       fontSize: 18,
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 25,
              ),
              // Text(
              //   'Mussum Ipsum, cacilds vidis litro abertis. Copo furadis é disculpa de bebadis, arcu quam euismod magna. Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose',
              //   style: TextStyle(
              //     // fontWeight: FontWeight.bold,
              //     fontSize: 16,
              //     color: Colors.white,
              //   ),
              // ),
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
      bottomSheet: Container(
        color: Color.fromRGBO(33, 33, 33, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: true,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 70,
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return NewClientPage(
                                title: "Editar",
                                client: controller.cliente,
                              );
                            },
                          ),
                        );
                      },
                      // color: Color.fromRGBO(33, 33, 33, 1),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(
                            Icons.edit,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: false,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 70,
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        showAlertDialogDelete(context, widget.idCliente);
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: true,
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[600],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // width: 180,
                    height: 50,
                    child: FlatButton(
                      onPressed: () async {
                        String url = "tel:+55 ${controller.cliente.telefone}";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          print('Could not launch $url');
                        }
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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

  showAlertDialogDelete(BuildContext context, int clientId) {
    final repository = HomeController();
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Deletar"),
      onPressed: () {
        // mensagem.wasRead = true;
        repository.deleteClient(clientId);
        Navigator.pop(context);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(
        children: [
          Icon(
            Icons.dangerous,
            color: Colors.redAccent,
          ),
          SizedBox(
            width: 5,
          ),
          Text('Deseja deletar cadastro?'),
        ],
      ),
      content: Text('Ao confirmar a operação não pode ser desfeita!'),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
