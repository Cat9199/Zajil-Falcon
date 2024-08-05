// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zajil_v2/src/config/theme/color_manger.dart';
import 'package:zajil_v2/src/config/theme/hexcolor.dart';
import 'package:zajil_v2/src/features/ask_order/logic/chat_cubit/chat_cubit_cubit.dart';
import 'package:zajil_v2/src/features/ask_order/presentation/widgets/chat_app_bar.dart';
import 'package:zajil_v2/src/features/ask_order/presentation/widgets/message_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: BlocBuilder<ChatCubit, ChatCubitState>(
          builder: (context, state) {
            var controller = context.read<ChatCubit>();

            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.separated(
                    controller: controller.scrollController,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      return BubbleSpecialThree(
                        text: controller.messages[index].message,
                        color: controller.messages[index].isSender
                            ? HexColor('372b46')
                            : HexColor('e2e2f7'),
                        tail: true,
                        isSender: controller.messages[index].isSender,
                        textStyle: controller.messages[index].isSender
                            ? const TextStyle(color: Colors.white, fontSize: 16)
                            : const TextStyle(
                                color: Colors.black, fontSize: 16),
                      );
                    },
                  ),
                ),
                CustomMessageBar(
                  onSend: (String messageTExt) {
                    controller.sendMessage(messageTExt);
                  },
                  sendButtonColor: ColorsManager.iconsColor,
                  //  messageBarColor: ColorsManager.primaryColor,
                  onTextChanged: (p0) {},
                  textFieldTextStyle:
                      const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
