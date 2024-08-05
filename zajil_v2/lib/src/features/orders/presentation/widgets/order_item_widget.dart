import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:zajil_v2/src/config/theme/color_manger.dart';
import 'package:zajil_v2/src/config/theme/hexcolor.dart';
import 'package:zajil_v2/src/config/theme/styles.dart';
import 'package:zajil_v2/src/core/helpers/spacing.dart';

class OrderItemWidget extends StatelessWidget {
  String orderName;
  String orderStatus;
  String orderPrice;
  String orderLocation;
  OrderItemWidget({
    super.key,
    required this.orderName,
    required this.orderStatus,
    required this.orderPrice,
    required this.orderLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Card(
        elevation: 15,
        color: HexColor('F7FAFF'),
        child: SizedBox(
          width: 400.w,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 150.w,
                        child: Text(orderName, style: font16WhiteMedium)),
                    // Row(
                    //   children: [
                    //     Text('pizza', style: font24BlackRegular),
                    //     horizontalSpace(10),
                    //     Text('X2', style: font24BlackRegular),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text('Burger', style: font24BlackRegular),
                    //     horizontalSpace(10),
                    //     Text('X2', style: font24BlackRegular),
                    //   ],
                    // ),

                    verticalSpace(5),
                    SizedBox(
                        width: 150.w,
                        child:
                            Text(orderLocation, style: font13DarkBlackMedium)),
                    Text('$orderPrice ', style: font24BlackRegular),
                  ],
                ),
                const Spacer(),
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(orderStatus, style: font32BlackBold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
