import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zajil_v2/di.dart';
import 'package:zajil_v2/src/features/orders/data/datasources/order_data_source.dart';
import 'package:zajil_v2/src/features/orders/data/models/order_model.dart';
import 'package:zajil_v2/src/features/orders/data/repositories/order_repo_implmenter.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  OrderRepoImpl orderRepoImpl = getIt<OrderRepoImpl>();

  OrderModel Orders = OrderModel();
  void getOrders() {
    emit(GetOrderLoading());

    orderRepoImpl.getOrders().then((value) {
      value.fold((fauiler) {
        emit(GetOrderFauiler());
      }, (data) {
        Orders = data;
        searchResults = Orders.orders;
        emit(GetOrderSuccess());
      });
    });
  }

  List<Order>? searchResults = [];
  void searchInOrdersLocally(String keyword) {
    emit(SearchInOrdersLoading());

    if (Orders.orders != null) {
      if (keyword.isEmpty) {
        searchResults = Orders.orders!;
      } else {
        searchResults = Orders.orders!
            .where((order) => order.order!.contains(keyword))
            .toList();
      }
    }
    emit(SearchInOrdersSuccess());
  }
}
