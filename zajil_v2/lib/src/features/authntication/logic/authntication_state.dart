part of 'authntication_cubit.dart';

abstract class AuthnticationState extends Equatable {
  const AuthnticationState();

  @override
  List<Object> get props => [];
}

class AuthnticationInitial extends AuthnticationState {}

class LoginLoading extends AuthnticationState {}

class LoginSuccess extends AuthnticationState {}

class LoginFailed extends AuthnticationState {
  final String message;
  const LoginFailed(this.message);
}

class RegisterLoading extends AuthnticationState {}

class RegisterSuccess extends AuthnticationState {}

class RegisterFailed extends AuthnticationState {
  final String message;
  const RegisterFailed(this.message);
}
