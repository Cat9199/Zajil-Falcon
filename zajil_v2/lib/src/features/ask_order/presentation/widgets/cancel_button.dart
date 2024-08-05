import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zajil_v2/src/config/theme/hexcolor.dart';
import 'package:zajil_v2/src/config/utils/assets_manger.dart';
import 'package:zajil_v2/src/core/helpers/extensions.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.back();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration:
            BoxDecoration(color: HexColor('FFFFFF'), shape: BoxShape.circle),
        child: SvgPicture.asset(
          IconsManger.call_end,
          height: 65,
          width: 65,
          color: Colors.red,
        ),
      ),
    );
  }
}
