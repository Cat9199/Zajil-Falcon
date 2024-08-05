import 'package:flutter/material.dart';

class CommonBackGround extends StatelessWidget {
  double hightFactor;
  BorderRadiusGeometry? borderRadius;
  CommonBackGround({
    super.key,
    this.hightFactor = 1,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * hightFactor,
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: const LinearGradient(
              colors: [
                Color(0xFF2FF2DC),
                Color(0xFF46C4FF),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)),
    );
  }
}
