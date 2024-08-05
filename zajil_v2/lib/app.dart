import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:zajil_v2/src/config/theme/themes.dart';
import 'package:zajil_v2/src/core/routes/app_router.dart';

class Zajil extends StatelessWidget {
  bool isFirstTime;
  Zajil({
    super.key,
    required this.isFirstTime,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp(
        theme: AppTheme.lightTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: isFirstTime ? Routes.login : Routes.layout,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
