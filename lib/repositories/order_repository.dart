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

  Future FinishOrder(orderId) async {
    var url = Constants.baseUrl + "ordens-servico/$orderId/finalizacao";

    final response = await http.put(url);

    // print(response);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  }
}
