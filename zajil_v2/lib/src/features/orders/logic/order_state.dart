part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class GetOrderLoading extends OrderState {}

class GetOrderSuccess extends OrderState {}

class GetOrderFauiler extends OrderState {}

class SearchInOrdersLoading extends OrderState {}

class SearchInOrdersSuccess extends OrderState {}

class SearchInOrdersFauiler extends OrderState {}
