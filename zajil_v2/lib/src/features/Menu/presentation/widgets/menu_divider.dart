import 'package:flutter/material.dart';

import 'package:zajil_v2/src/config/theme/styles.dart';
import 'package:zajil_v2/src/config/utils/app_strings.dart';

class MenuDivider extends StatelessWidget {
  String title;
  void Function()? onTap;
  MenuDivider({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: font32BlackBold,
        ),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: Text(
            AppStrings.ViewAll,
            style: font24BlackRegular,
          ),
        )
      ],
    );
  }
}
