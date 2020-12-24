// class Order {
//   int id;
//   Cliente cliente;
//   String descricao;
//   String preco;
//   String status;
//   String dataAbertura;
//   Null dataFinalizacao;

//   Order(
//       {this.id,
//       this.cliente,
//       this.descricao,
//       this.preco,
//       this.status,
//       this.dataAbertura,
//       this.dataFinalizacao});

//   Order.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     cliente =
//         json['cliente'] != null ? new Cliente.fromJson(json['cliente']) : null;
//     descricao = json['descricao'];
//     preco = json['preco'];
//     status = json['status'];
//     dataAbertura = json['dataAbertura'];
//     dataFinalizacao = json['dataFinalizacao'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.cliente != null) {
//       data['cliente'] = this.cliente.toJson();
//     }
//     data['descricao'] = this.descricao;
//     data['preco'] = this.preco;
//     data['status'] = this.status;
//     data['dataAbertura'] = this.dataAbertura;
//     data['dataFinalizacao'] = this.dataFinalizacao;
//     return data;
//   }
// }

// class Cliente {
//   int id;
//   String nome;

//   Cliente({this.id, this.nome});

//   Cliente.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nome = json['nome'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['nome'] = this.nome;
//     return data;
//   }
// }

import 'client_model.dart';

class Order {
  int id;
  Client cliente;
  String descricao;
  String preco;
  String status;
  String dataAbertura;
  String dataFinalizacao;

  Order(
      {this.id,
      this.cliente,
      this.descricao,
      this.preco,
      this.status,
      this.dataAbertura,
      this.dataFinalizacao});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cliente =
        json['cliente'] != null ? new Client.fromJson(json['cliente']) : null;
    descricao = json['descricao'];
    preco = json['preco'];
    status = json['status'];
    dataAbertura = json['dataAbertura'];
    dataFinalizacao = json['dataFinalizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.cliente != null) {
      data['cliente'] = this.cliente.toJson();
    }
    data['descricao'] = this.descricao;
    data['preco'] = this.preco;
    data['status'] = this.status;
    data['dataAbertura'] = this.dataAbertura;
    data['dataFinalizacao'] = this.dataFinalizacao;
    return data;
  }
}
