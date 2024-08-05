import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:zajil_v2/src/config/theme/color_manger.dart';
import 'package:zajil_v2/src/config/theme/hexcolor.dart';
import 'package:zajil_v2/src/config/utils/assets_manger.dart';
import 'package:zajil_v2/src/features/ask_order/logic/call_cubit/call_cubit_cubit.dart';

class MicButton extends StatelessWidget {
  const MicButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallCubit, CallCubitState>(
      builder: (context, state) {
        var controller = context.read<CallCubit>();
        return AvatarGlow(
          glowRadiusFactor: 0.4,
          animate: controller.isUserSpeaking,
          glowColor: ColorsManager.primaryColor,
          child: HoldTimeoutDetector(
            onTimeout: () {},
            onTimerInitiated: () async {
              await controller.startListening();
            },
            onCancel: () async {
              await controller.stopListening();
            },
            holdTimeout: const Duration(hours: 1),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: controller.isUserSpeaking
                      ? ColorsManager.primaryColor
                      : HexColor('FFFFFF'),
                  shape: BoxShape.circle),
              child: SvgPicture.asset(
                IconsManger.mic,
                height: 65,
                width: 65,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
