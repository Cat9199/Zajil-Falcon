import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zajil_v2/src/config/theme/color_manger.dart';

class MenuShimerLoading extends StatelessWidget {
  const MenuShimerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, indexItems) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Shimmer.fromColors(
                baseColor: ColorsManager.lightGray,
                highlightColor: Colors.white,
                child: Card(
                  color: ColorsManager.lightGray,
                  semanticContainer: true,
                  surfaceTintColor: ColorsManager.lightGray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 10,
                  child: const SizedBox(
                    width: 180,
                    height: 230,
                  ),
                ),
              ));
        },
      ),
    );
  }
}
