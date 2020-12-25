import 'package:client/constants.dart';
import 'package:client/models/comment_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CommentRepository {
  static Future<List<Comment>> getComments() async {
    // static List<Comment> getClients() {
    final comments = List<Comment>();

    var url = Constants.baseUrl + "1/comentarios";

    final response = await http.get(url);

    print(response);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List listaResponse = json.decode(response.body);

    for (Map map in listaResponse) {
      Comment c = Comment.fromJson(map);
      comments.add(c);
    }

    // Comments.add(Client(
    //     nome: 'erstóstenes', email: 'era@gmail.com', telefone: '365478945'));
    // Comments.add(
    //     Client(nome: 'jânio', email: 'jan@gmail.com', telefone: '364333945'));
    // Comments.add(Client(
    //     nome: 'péricles', email: 'per@gmail.com', telefone: '000478945'));
    // Comments.add(Client(
    //     nome: 'pitágoras', email: 'pit@gmail.com', telefone: '10999945'));
    // Comments.add(Client(
    //     nome: 'manolo', email: 'manolo@gmail.com', telefone: '20999945'));
    // Comments.add(
    //     Client(nome: 'jezabel', email: 'jez@gmail.com', telefone: '301111145'));
    // Comments.add(
    //     Client(nome: 'natal', email: 'nat@gmail.com', telefone: '111119995'));

    print('Comments>>>>>> $comments');
    return comments;
  }
}
