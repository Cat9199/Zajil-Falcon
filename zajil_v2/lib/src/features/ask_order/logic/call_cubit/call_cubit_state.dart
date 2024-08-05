part of 'call_cubit_cubit.dart';

sealed class CallCubitState extends Equatable {
  const CallCubitState();

  @override
  List<Object> get props => [];
}

final class CallCubitInitial extends CallCubitState {}

final class UserSpeaking extends CallCubitState {}

final class StopListening extends CallCubitState {}

final class AISpeaking extends CallCubitState {}

final class AIStoped extends CallCubitState {}

final class CallEnded extends CallCubitState {}
