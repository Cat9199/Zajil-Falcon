import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zajil_v2/src/config/theme/styles.dart';
import 'package:zajil_v2/src/config/utils/app_strings.dart';
import 'package:zajil_v2/src/config/utils/assets_manger.dart';

class RobotHeadAndTextWidget extends StatelessWidget {
  const RobotHeadAndTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(AssetsManger.robotHead, width: 150, height: 130),
        Text(
          AppStrings.ZAJIL,
          style: font24BlackBold.copyWith(
            fontSize: 52.sp,
          ),
        ),
      ],
    );
  }
}
