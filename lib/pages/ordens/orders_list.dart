// import 'dart:convert';
import 'package:client/constants.dart';
import 'package:client/controllers/order_controller.dart';
// import 'package:client/models/order_model.dart';
// import 'package:client/repositories/order_repository.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'new_order_page.dart';
import 'order_detail_page.dart';

class OrdersList extends StatefulWidget {
  final String status;
  final OrderController controller;

  const OrdersList({Key key, this.status = 'Em Andamento', this.controller})
      : super(key: key);
  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList>
    with AutomaticKeepAliveClientMixin {
  final controller = OrderController();

  _sucess() {
    return RefreshIndicator(
      onRefresh: () {
        return controller.start(widget.status);
      },
      child: ListView.builder(
        itemCount: controller.dados.length,
        itemBuilder: (context, index) {
          var ordem = controller.dados[index];

          var corStatus = Constants.statusOrder.entries
              .firstWhere((element) => element.key == ordem.status);

          String dataAberturaFormatada = _dataFormatada(ordem.dataAbertura);
          String dataFinalizacaoFormatada =
              _dataFormatada(ordem.dataFinalizacao);

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            height: 130,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.white, width: 2.0),
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 3.0,
                  offset: new Offset(0.0, 3.0),
                ),
              ],
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: corStatus.value,
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    // child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Text(
                    //       ordem.descricao,
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, fontSize: 20),
                    //     ),
                    //     Text(dataAberturaFormatada),
                    //     Text('cliente: ${ordem.cliente.nome}'),
                    //     Text(ordem.preco),
                    //     Text(dataFinalizacaoFormatada),
                    //     Text(ordem.status),
                    //   ],
                    // ),
                    child: ListTile(
                      title: Text(
                        ordem.descricao,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      subtitle: Text(dataAberturaFormatada),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailPage(ordem);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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

  _error() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          controller.start(widget.status);
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

  stateManagement(OrderState state) {
    switch (state) {
      case OrderState.start:
        return _start();
      case OrderState.loading:
        return _loading();
      case OrderState.error:
        return _error();
      case OrderState.sucess:
        return _sucess();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start(widget.status);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.state,
      builder: (contex, child) {
        return stateManagement(controller.state.value);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
