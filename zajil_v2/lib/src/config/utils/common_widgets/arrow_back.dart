import 'package:flutter/material.dart';
import 'package:zajil_v2/src/core/helpers/extensions.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ));
  }
}
