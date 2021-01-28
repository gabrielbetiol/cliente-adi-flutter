import 'package:client/constants.dart';
import 'package:client/models/order_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderRepository {
  static Future<List<Order>> getOrders() async {
    // static List<Order> getClients() {
    final orders = List<Order>();

    var url = Constants.baseUrl + "ordens-servico";

    final response = await http.get(url);

    // print(response);
    // print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List listaResponse = json.decode(response.body);

    for (Map map in listaResponse) {
      Order c = Order.fromJson(map);
      orders.add(c);
    }

    return orders;
  }

  static Future<List<Order>> getOrdersByStatus(String currentStatus) async {
    // static List<Order> getClients() {
    final orders = List<Order>();

    var url = Constants.baseUrl + "ordens-servico";

    final response = await http.get(url);

    // print(response);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    List listaResponse = json.decode(response.body);

    for (Map map in listaResponse) {
      Order c = Order.fromJson(map);
      orders.add(c);
    }

    final pedidosFilt = orders.where((i) => i.status == currentStatus).toList();

    return pedidosFilt;
  }

  static Future addOrder(String descricao, double preco, int id) async {
    var url = Constants.baseUrl + "ordens-servico";

    var header = {
      "Content-Type": "application/json",
      'Accept': 'application/json',
    };

    Map params = {"cliente": id, "descricao": descricao, "preco": preco};

    String _body = json.encode(params);
    // print("> $_body");

    var response = await http.post(url, headers: header, body: _body);

    // print(response);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      print('status 200');
    } else {
      print('erro');
    }
  }

  Future FinishOrder(orderId) async {
    var url = Constants.baseUrl + "ordens-servico/$orderId/finalizacao";

    final response = await http.put(url);

    print(response);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  }

  // Future DeleteOrder(orderId) async {
  //   var url = Constants.baseUrl + "ordens-servico/$orderId/finalizacao";

  //   final response = await http.put(url);

  //   print(response);
  //   // print('Response status: ${response.statusCode}');
  //   // print('Response body: ${response.body}');
  // }

}
