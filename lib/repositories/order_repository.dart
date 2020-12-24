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

    print(response);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List listaResponse = json.decode(response.body);

    for (Map map in listaResponse) {
      Order c = Order.fromJson(map);
      orders.add(c);
    }

    // orders.add(Client(
    //     nome: 'erstóstenes', email: 'era@gmail.com', telefone: '365478945'));
    // orders.add(
    //     Client(nome: 'jânio', email: 'jan@gmail.com', telefone: '364333945'));
    // orders.add(Client(
    //     nome: 'péricles', email: 'per@gmail.com', telefone: '000478945'));
    // orders.add(Client(
    //     nome: 'pitágoras', email: 'pit@gmail.com', telefone: '10999945'));
    // orders.add(Client(
    //     nome: 'manolo', email: 'manolo@gmail.com', telefone: '20999945'));
    // orders.add(
    //     Client(nome: 'jezabel', email: 'jez@gmail.com', telefone: '301111145'));
    // orders.add(
    //     Client(nome: 'natal', email: 'nat@gmail.com', telefone: '111119995'));

    print('orders>>>>>> $orders');
    return orders;
  }
}
