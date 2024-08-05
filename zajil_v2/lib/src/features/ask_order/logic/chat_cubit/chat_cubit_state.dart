part of 'chat_cubit_cubit.dart';

sealed class ChatCubitState extends Equatable {
  const ChatCubitState();

  @override
  List<Object> get props => [];
}

final class ChatCubitInitial extends ChatCubitState {}

final class ChatCubitLoading extends ChatCubitState {}

final class SendMessageSuccess extends ChatCubitState {}

final class RecieveMessageSuccess extends ChatCubitState {}

final class SendMessageLoading extends ChatCubitState {}
