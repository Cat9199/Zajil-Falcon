import 'package:flutter/material.dart';

import '../widgets/call_or_chat_widget.dart';
import '../widgets/common_back_ground.dart';
import '../widgets/robot_head_and_text_widget.dart';

class AskOrderScreen extends StatelessWidget {
  const AskOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CommonBackGround(),
          const Positioned(
            top: 100,
            child: RobotHeadAndTextWidget(),
          ),
          const Positioned(bottom: 80, child: CallOrChatWidget()),
        ],
      ),
    );
  }
}
