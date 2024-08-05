import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:zajil_v2/src/config/theme/color_manger.dart';
import 'package:zajil_v2/src/config/theme/hexcolor.dart';
import 'package:zajil_v2/src/config/utils/common_widgets/common_gradient.dart';
import 'package:zajil_v2/src/core/api/constant_end_points.dart';
import 'package:zajil_v2/src/core/api/dio_factory.dart';
import 'package:zajil_v2/src/features/ask_order/presentation/widgets/common_back_ground.dart';
import 'package:zajil_v2/src/features/ask_order/presentation/widgets/robot_head_and_text_widget.dart';

import '../widgets/lang_drop_down_menu.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HexColor('F8FFFF'),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
          ),
          CommonBackGround(
            hightFactor: 1,
          ),
          const Positioned(top: 50, child: RobotHeadAndTextWidget()),
          const Positioned(bottom: 120, child: ContactUsForm()),
        ],
      ),
    );
  }
}

class ContactUsForm extends StatelessWidget {
  const ContactUsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          const LangDropDownMenu(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar(
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                onRatingChanged: (value) => debugPrint('$value'),
                initialRating: 3,
                maxRating: 5,
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                gradient: commonGradient(),
                borderRadius: BorderRadius.circular(10)),
            child: const Text(
              'CONTACT US',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
