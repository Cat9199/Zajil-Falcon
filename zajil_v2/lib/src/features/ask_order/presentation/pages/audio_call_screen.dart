import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:zajil_v2/src/config/theme/color_manger.dart';
import 'package:zajil_v2/src/config/theme/hexcolor.dart';
import 'package:zajil_v2/src/config/theme/styles.dart';
import 'package:zajil_v2/src/config/utils/App_strings.dart';
import 'package:zajil_v2/src/config/utils/assets_manger.dart';
import 'package:zajil_v2/src/core/helpers/extensions.dart';
import 'package:zajil_v2/src/features/ask_order/logic/call_cubit/call_cubit_cubit.dart';
import 'package:zajil_v2/src/features/ask_order/presentation/widgets/common_back_ground.dart';
import 'package:zajil_v2/src/features/ask_order/presentation/widgets/robot_head_and_text_widget.dart';

import '../widgets/cancel_button.dart';
import '../widgets/mic_button.dart';
import '../widgets/robot_head_with_bloc.dart';

class AudioCallScreen extends StatelessWidget {
  const AudioCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CommonBackGround(),
          const RobotHeadWithBloc(),
          const Positioned(
              bottom: 80,
              child: Row(
                children: [
                  CancelButton(),
                  SizedBox(
                    width: 80,
                  ),
                  MicButton(),
                ],
              ))
        ],
      ),
    );
  }
}
