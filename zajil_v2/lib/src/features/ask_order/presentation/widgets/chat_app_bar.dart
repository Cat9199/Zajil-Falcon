import 'package:flutter/material.dart';
import 'package:zajil_v2/src/config/theme/color_manger.dart';
import 'package:zajil_v2/src/config/utils/app_strings.dart';
import 'package:zajil_v2/src/config/utils/assets_manger.dart';
import 'package:zajil_v2/src/core/helpers/extensions.dart';

import '../../../../config/utils/common_widgets/common_gradient.dart';

AppBar chatAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: ColorsManager.primaryColor,
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        context.back();
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
        size: 20,
      ),
    ),
    flexibleSpace: Container(
        decoration: BoxDecoration(
      gradient: commonGradient(),
    )),
    title: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          // backgroundImage: AssetImage(
          //   AssetsManger.logo,
          // ),
          radius: 20,
          child: ClipOval(
            child: Image.asset(
              AssetsManger.logo,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        const Text(
          AppStrings.ZAJIL,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    ),
    shadowColor: Colors.black,
    elevation: 5,
    actions: [
      IconButton(
          onPressed: () {
            //     GO.toNamed(Routes.callRoute);
          },
          icon: Icon(
            Icons.more_vert,
            size: 30,
            color: ColorsManager.iconsColor,
          )),
    ],
  );
}
