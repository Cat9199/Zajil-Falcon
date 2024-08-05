import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:zajil_v2/app.dart';
import 'package:zajil_v2/di.dart';
import 'package:zajil_v2/src/core/api/constant_end_points.dart';
import 'package:zajil_v2/src/core/shared_prefrence/shared_prefrence.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await setupGetIt();
  runApp(Zajil(
    isFirstTime: Constants.phoneNumber == '',
  ));
}
