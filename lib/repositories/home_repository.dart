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
    // print(clientes);
    clientes
        .sort((a, b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));
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

  static Future delClient(int idClient) async {
    print('idclient: $idClient');
    var url = Constants.baseUrl + "clientes/$idClient";

    final response = await http.delete(url);

    // print(response);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // var listaResponse = json.decode(response.body);

    // return cliente;
  }

  static Future addClient(String mail, String phone, String nome) async {
    var url = Constants.baseUrl + "clientes";

    var header = {
      "Content-Type": "application/json",
      'Accept': 'application/json',
    };

    Map params = {
      "nome": nome,
      "email": mail,
      "telefone": phone,
      "senha": "cli123" //é preciso setar uma senha, por isso disso
    };

    String _body = json.encode(params);
    // print("> $_body");

    var response = await http.post(url, headers: header, body: _body);

    print(response);
    // print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      print('status 201');
    } else {
      print('erro');
    }
  }

  static Future editClient(
      String mail, String phone, String nome, int idClient) async {
    var url = Constants.baseUrl + "clientes/$idClient";

    var header = {
      "Content-Type": "application/json",
      'Accept': 'application/json',
    };

    Map params = {
      "nome": nome,
      "email": mail,
      "telefone": phone,
      "senha": "cli123" //é preciso setar uma senha, por isso disso
    };

    String _body = json.encode(params);
    // print("> $_body");

    var response = await http.put(url, headers: header, body: _body);

    print(response);
    // print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      print('status 200 - alterado com sucesso!');
    } else {
      print('erro');
    }
  }
}
