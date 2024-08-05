import 'package:flutter/material.dart';
import 'package:zajil_v2/src/config/theme/color_manger.dart';

class DefultButton extends StatelessWidget {
  void Function()? onPressed;
  String text;
  Color? color;
  Color? textColor;
  Color? borderColor;
  DefultButton({
    super.key,
    this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: InkWell(
            onTap: onPressed,
            child: Container(
              height: 56,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: color ?? ColorsManager.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                  border: borderColor != null
                      ? Border.all(color: borderColor!)
                      : null),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
