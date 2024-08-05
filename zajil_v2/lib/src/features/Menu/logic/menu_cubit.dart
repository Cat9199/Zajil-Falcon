import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zajil_v2/di.dart';
import 'package:zajil_v2/src/features/Menu/data/datasources/menu_data_source.dart';
import 'package:zajil_v2/src/features/menu/data/models/product_model.dart';
import 'package:zajil_v2/src/features/menu/data/repositories/menu_repo_implmenter.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());
  MenuRepoImpl menuRepoImpl = getIt<MenuRepoImpl>();
  MenuModel menu = MenuModel();
  Map<String, int> catrgories = {};
  void getMenu() {
    emit(GetMenuLoading());

    catrgories.clear();
    menuRepoImpl.getMenu().then((value) {
      value.fold((fauiler) {
        emit(GetMenuFauiler());
      }, (data) {
        menu = data;
        menu.products?.forEach((element) {
          //check if category is already in the map
          if (catrgories.keys.contains(element.category)) {
            //adding +1 to the category value

            catrgories.update(element.category ?? '', (value) => value + 1);
          } else {
            //adding new category to the map

            catrgories.addAll({element.category ?? '': 1});
          }
        });
        log(catrgories.toString());
        emit(GetMenuSuccess());
      });
    });
  }

  List<Product> searchResults = [];
  void searchInMenuLocally(String keyword) {
    emit(SearchInMenuLoading());
    if (menu.products != null) {
      if (keyword.isEmpty) {
        searchResults = [];
      } else {
        searchResults = menu.products!
            .where((product) => product.name!.contains(keyword))
            .toList();
      }
    }
    emit(SearchInMenuSuccess());
  }

  List<Product> getProductsByCategory(String category) {
    List<Product> result = [];
    if (menu.products != null) {
      result = menu.products!
          .where((product) => product.category == category)
          .toList();
    }
    return result;
  }
}
