import 'package:client/models/order_model.dart';
import 'package:client/repositories/order_repository.dart';
import 'package:flutter/widgets.dart';

class OrderController {
  List<Order> dados = [];
  final repository = OrderRepository();
  final state = ValueNotifier<OrderState>(OrderState.start);

  Future start(String currentStatus) async {
    state.value = OrderState.loading;
    try {
      // dados = await OrderRepository.getOrders();
      dados = await OrderRepository.getOrdersByStatus(currentStatus);
      state.value = OrderState.sucess;
    } catch (e) {
      state.value = OrderState.error;
    }
  }

  // Future add(TodoItem item) async {
  //   await repository.add(item);
  // }
}

enum OrderState { start, loading, sucess, error }
