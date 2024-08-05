import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zajil_v2/src/config/theme/color_manger.dart';

class OrderShimmerLoading extends StatelessWidget {
  const OrderShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
              baseColor: ColorsManager.lightGray,
              highlightColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Card(
                  color: ColorsManager.lightGray,
                  surfaceTintColor: ColorsManager.lightGray,
                  elevation: 10,
                  child: SizedBox(
                    width: 400.w,
                    height: 100.h,
                  ),
                ),
              ));
        },
      ),
    );
  }
}
