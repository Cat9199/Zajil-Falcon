import 'package:bloc/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zajil_v2/src/core/api/app_interceptors.dart';
import 'package:zajil_v2/src/core/api/constant_end_points.dart';
import 'package:zajil_v2/src/core/api/dio_factory.dart';
import 'package:zajil_v2/src/core/bloc_observer.dart';
import 'package:zajil_v2/src/core/shared_prefrence/shared_prefrence.dart';
import 'package:zajil_v2/src/features/menu/data/datasources/menu_data_source.dart';
import 'package:zajil_v2/src/features/menu/data/repositories/menu_repo_implmenter.dart';
import 'package:zajil_v2/src/features/orders/data/datasources/order_data_source.dart';
import 'package:zajil_v2/src/features/orders/data/repositories/order_repo_implmenter.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPrefs);
  getIt.registerSingleton<PrefData>(PrefData(getIt.get<SharedPreferences>()));
  Constants.phoneNumber = await getIt<PrefData>().getPhoneNumber();

  getIt.registerSingleton<AppIntercepters>(AppIntercepters());
  await DioFactory.getDio();
}

preOrder() {
  if (!getIt.isRegistered<OrderDataSource>()) {
    getIt.registerSingleton<OrderDataSource>(OrderDataSource());
    getIt.registerSingleton<OrderRepoImpl>(OrderRepoImpl(getIt.get()));
  }
}

preMenu() {
  if (!getIt.isRegistered<MenuDataSource>()) {
    getIt.registerSingleton<MenuDataSource>(MenuDataSource());
    getIt.registerSingleton<MenuRepoImpl>(MenuRepoImpl(getIt.get()));
  }
}
