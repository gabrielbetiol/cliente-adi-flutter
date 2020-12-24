import 'package:client/models/client_model.dart';
import 'package:client/repositories/home_repository.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  List<Client> dados = [];
  final repository = HomeRepository();
  final state = ValueNotifier<HomeState>(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;
    try {
      dados = await HomeRepository.getClients();
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, sucess, error }
