import 'package:client/controllers/order_controller.dart';
import 'package:client/models/order_model.dart';
import 'package:client/pages/clientes/client_detail_page.dart';
import 'package:client/repositories/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import "../../string_extension.dart";

class DetailPage extends StatelessWidget {
  final Order ordem;
  final String status;

  DetailPage({this.ordem, this.status});

  // final controller = OrderController();

  @override
  Widget build(BuildContext context) {
    String dataAberturaFormatada = _dataFormatada(ordem.dataAbertura);
    String dataFinalizacaoFormatada = _dataFormatada(ordem.dataFinalizacao);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey[50],
//         iconTheme: IconThemeData(color: Colors.grey),
//         elevation: 0,
//       ),
//       body: Container(

//       ),
//     );
//   }
// }

    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 33, 33, 1),
      body: Column(
        // shrinkWrap: true,
        children: [
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0),
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/images/repair.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: EdgeInsets.all(40.0),
                width: MediaQuery.of(context).size.width,
                decoration:
                    // BoxDecoration(color: Colors.deepPurple),
                    BoxDecoration(color: Colors.blue[900].withOpacity(0.95)),
                child: Center(
                  child: topContentText(ordem.id, dataAberturaFormatada,
                      dataFinalizacaoFormatada),
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
          // Positioned(
          //   top: MediaQuery.of(context).size.height * 0.42,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     padding: EdgeInsets.all(40.0),
          //     child: Center(
          //       child: Column(
          //         children: [

          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(40.0),
              children: <Widget>[
                Text(
                  "Cliente:",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                ListTile(
                  tileColor: Colors.grey[800],
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ClienteDetailPage(idCliente: ordem.cliente.id);
                        },
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                  // O CÓDIGO ABAIXO FOI USADO PARA DEIXAR A PRIMEIRA LETRA MAIÚSCULA
                  title: Text(
                    ordem.cliente.nome.capitalize(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  // title: Text(ordem.cliente.nome[0].toUpperCase() +
                  //     ordem.cliente.nome.substring(1)),
                  // subtitle: Text(
                  //   ordem.cliente.id.toString(),
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  trailing: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Descrição:",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      ordem.descricao.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      // textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Valor:",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "R\$ " + ordem.preco,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Status:",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          ordem.status,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 60.0,
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
              ],
            ),
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
                      onPressed: () {},
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
                        showAlertDialogDelete(context, ordem.id);
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
                visible: status == 'ABERTA',
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[600],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // width: 180,
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        showAlertDialog(context, ordem.id);
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.done,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Finalizar'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                textAlign: TextAlign.center,
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

  String _dataFormatada(String dataEntr) {
    if (dataEntr != null) {
      DateTime dateAbertura = DateTime.parse(dataEntr);
      DateFormat dateFormat = DateFormat("dd/MM/yyyy");
      String formattedDate = dateFormat.format(dateAbertura);
      return formattedDate;
    }
    return '--';
    // Convertendo a string de data pra DateTime e alterando o formato de exibição
  }

  showAlertDialog(BuildContext context, int orderId) {
    final repository = OrderRepository();
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Sim"),
      onPressed: () {
        // mensagem.wasRead = true;
        repository.FinishOrder(ordem.id);
        Navigator.pop(context);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Deseja finalizar o serviço?'),
      content: Text(
          'Ao confirmar o serviço será finalizado e não pode mais voltar ao status atual'),
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

  showAlertDialogDelete(BuildContext context, int orderId) {
    final repository = OrderRepository();
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
        // repository.DeleteOrder(ordem.id);
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
          Text('Deseja deletar a O.S.?'),
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

  topContentText(
      int id, String dataAberturaFormatada, String dataFinalizacaoFormatada) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 40.0),
        Icon(
          Icons.home_repair_service,
          color: Colors.white,
          size: 30.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Ordem de Serviço nº $id',
          style: TextStyle(color: Colors.white, fontSize: 25.0),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 20.0),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: <Widget>[
        //     // Expanded(flex: 1, child: levelIndicator),
        //     Expanded(
        //         flex: 6,
        //         child: Padding(
        //             padding: EdgeInsets.only(left: 5.0),
        //             child: Text(
        //               'Nº $id',
        //               style: TextStyle(color: Colors.white),
        //             ))),
        //     // Expanded(flex: 1, child: coursePrice)
        //   ],
        // ),
        Row(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Icon(
                  //   Icons.event,
                  //   color: Colors.white,
                  // ),
                  // SizedBox(
                  //   width: 8.0,
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "data abertura",
                        style: TextStyle(
                            fontSize: 15, color: Colors.white.withOpacity(0.7)),
                      ),
                      Text(
                        dataAberturaFormatada,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: Colors.white,
              width: 20,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Icon(
                  //   Icons.event_available,
                  //   color: Colors.white,
                  // ),
                  // SizedBox(
                  //   width: 8.0,
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "data finalização",
                        style: TextStyle(
                            fontSize: 15, color: Colors.white.withOpacity(0.7)),
                      ),
                      Text(
                        dataFinalizacaoFormatada,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
