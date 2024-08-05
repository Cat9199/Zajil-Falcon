part of 'menu_cubit.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuInitial extends MenuState {}

class GetMenuLoading extends MenuState {}

class GetMenuSuccess extends MenuState {}

class GetMenuFauiler extends MenuState {}

class SearchInMenuLoading extends MenuState {}

class SearchInMenuSuccess extends MenuState {}
