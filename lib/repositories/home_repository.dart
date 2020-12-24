import 'package:client/models/client_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeRepository {
  static Future<List<Client>> getClients() async {
    // static List<Client> getClients() {
    final clientes = List<Client>();

    var url = "http://10.0.2.2:8080/api/clientes";

    print('clientes: $clientes');

    // não está passando daqui>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    final response = await http.get(url);

    print(response);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List listaResponse = json.decode(response.body);

    for (Map map in listaResponse) {
      Client c = Client.fromJson(map);
      clientes.add(c);
    }

    // clientes.add(Client(
    //     nome: 'erstóstenes', email: 'era@gmail.com', telefone: '365478945'));
    // clientes.add(
    //     Client(nome: 'jânio', email: 'jan@gmail.com', telefone: '364333945'));
    // clientes.add(Client(
    //     nome: 'péricles', email: 'per@gmail.com', telefone: '000478945'));
    // clientes.add(Client(
    //     nome: 'pitágoras', email: 'pit@gmail.com', telefone: '10999945'));
    // clientes.add(Client(
    //     nome: 'manolo', email: 'manolo@gmail.com', telefone: '20999945'));
    // clientes.add(
    //     Client(nome: 'jezabel', email: 'jez@gmail.com', telefone: '301111145'));
    // clientes.add(
    //     Client(nome: 'natal', email: 'nat@gmail.com', telefone: '111119995'));

    print(clientes);
    return clientes;
  }
}
