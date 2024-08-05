import 'package:flutter/material.dart';

class defaultRichText extends StatelessWidget {
  void Function()? onTap;
  String text1;
  String text2;
  defaultRichText({
    super.key,
    this.onTap,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: onTap,
          child: RichText(
            text: TextSpan(
              text: text1,
              style: const TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: text2,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
