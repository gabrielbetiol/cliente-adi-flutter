import 'package:client/models/client_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants.dart';

class HomeRepository {
  static Future<List<Client>> getClients() async {
    // static List<Client> getClients() {
    final clientes = List<Client>();

    // var url = "http://10.0.2.2:8080/api/clientes";
    var url = Constants.baseUrl + "clientes";

    // print('clientes: $clientes');

    // não está passando daqui>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    final response = await http.get(url);

    // print(response);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    List listaResponse = json.decode(response.body);

    for (Map map in listaResponse) {
      Client c = Client.fromJson(map);
      clientes.add(c);
    }
    print(clientes);
    return clientes;
  }

  static Future<Client> getClientById(int idClient) async {
    Client cliente = Client();

    var url = Constants.baseUrl + "clientes/$idClient";

    final response = await http.get(url);

    // print(response);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    var listaResponse = json.decode(response.body);

    cliente = Client.fromJson(listaResponse);

    return cliente;
  }
}
