import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 50.0;

  const GradientAppBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF46C4FF),
              Color(0xFF2FF2DC),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.5, 0.0),
            tileMode: TileMode.clamp),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20.0.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
