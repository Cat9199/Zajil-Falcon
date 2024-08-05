import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zajil_v2/src/config/utils/assets_manger.dart';
import 'package:zajil_v2/src/core/helpers/extensions.dart';
import 'package:zajil_v2/src/core/helpers/spacing.dart';
import 'package:zajil_v2/src/core/routes/app_router.dart';

class CallOrChatWidget extends StatelessWidget {
  const CallOrChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.goTo(Routes.audioCall);
          },
          child: Container(
            height: 75,
            width: 75,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              IconsManger.call,
              height: 60,
              width: 60,
            ),
          ),
        ),
        horizontalSpace(80),
        InkWell(
          onTap: () {
            context.goTo(Routes.chat);
          },
          child: SvgPicture.asset(
            IconsManger.chat,
            height: 65.h,
            width: 65.w,
          ),
        ),
      ],
    );
  }
}
