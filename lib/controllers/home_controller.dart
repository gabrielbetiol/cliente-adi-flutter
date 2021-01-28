import 'package:client/models/client_model.dart';
import 'package:client/repositories/home_repository.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  List<Client> dados = [];
  Client cliente = Client();
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

  Future startById(int idClient) async {
    state.value = HomeState.loading;
    try {
      cliente = await HomeRepository.getClientById(idClient);
      // print('foi');
      state.value = HomeState.sucess;
      // print('sucesso!');
    } catch (e) {
      state.value = HomeState.error;
      // print('erro!');
    }
  }
}

enum HomeState { start, loading, sucess, error }
