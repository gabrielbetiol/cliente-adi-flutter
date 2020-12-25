import 'package:client/models/comment_model.dart';
import 'package:client/repositories/comment_repository.dart';
import 'package:flutter/widgets.dart';

class CommentController {
  List<Comment> dados = [];
  final repository = CommentRepository();
  final state = ValueNotifier<CommentState>(CommentState.start);

  Future start() async {
    state.value = CommentState.loading;
    try {
      dados = await CommentRepository.getComments();
      state.value = CommentState.sucess;
    } catch (e) {
      state.value = CommentState.error;
    }
  }
}

enum CommentState { start, loading, sucess, error }
