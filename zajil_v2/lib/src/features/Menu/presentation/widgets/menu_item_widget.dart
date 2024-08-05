import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:zajil_v2/src/config/theme/color_manger.dart';
import 'package:zajil_v2/src/config/theme/hexcolor.dart';
import 'package:zajil_v2/src/config/theme/styles.dart';
import 'package:zajil_v2/src/core/helpers/spacing.dart';

class MenuItemWidget extends StatelessWidget {
  String itemName;
  String itemCategory;
  String itemPrice;
  String itemStatus;
  EdgeInsetsGeometry padding;
  MenuItemWidget({
    super.key,
    required this.itemName,
    required this.itemCategory,
    required this.itemPrice,
    required this.itemStatus,
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      color: HexColor('F7FAFF'),
      surfaceTintColor: HexColor('F7FAFF'),
      semanticContainer: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SizedBox(
        width: 180.w,
        child: Align(
          child: Padding(
            padding: padding,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Icon(
                      Icons.favorite,
                      size: 15,
                      color: ColorsManager.primaryColor,
                    ),
                  ),
                ),
                Text(
                  itemName,
                  style: font24BlackBold,
                ),
                verticalSpace(10),
                Text(
                  itemCategory,
                  style: font13DarkBlackMedium,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      itemPrice,
                      style: font16blackSemiBold,
                    ),
                    const Spacer(),
                    Text(
                      itemStatus,
                      style: font16blackSemiBold,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
