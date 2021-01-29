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

    print('Comments>>>>>> $comments');
    return comments;
  }
}
