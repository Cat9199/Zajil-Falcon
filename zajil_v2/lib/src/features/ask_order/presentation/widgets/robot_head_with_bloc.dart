import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zajil_v2/src/config/theme/styles.dart';
import 'package:zajil_v2/src/config/utils/App_strings.dart';
import 'package:zajil_v2/src/config/utils/assets_manger.dart';
import 'package:zajil_v2/src/features/ask_order/logic/call_cubit/call_cubit_cubit.dart';

class RobotHeadWithBloc extends StatelessWidget {
  const RobotHeadWithBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      child: BlocBuilder<CallCubit, CallCubitState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              AvatarGlow(
                  glowRadiusFactor: 0.3,
                  animate: context.read<CallCubit>().isAISpeaking,
                  glowColor: Colors.white,
                  startDelay: Duration.zero,
                  child: Image.asset(AssetsManger.robotHead,
                      width: 150, height: 130)),
              Text(
                AppStrings.ZAJIL,
                style: font24BlackBold.copyWith(
                  fontSize: 52.sp,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
