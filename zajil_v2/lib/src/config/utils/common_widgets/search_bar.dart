import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:zajil_v2/src/config/utils/common_widgets/default_text_form_filed.dart';
import 'package:zajil_v2/src/core/helpers/extensions.dart';
import 'package:zajil_v2/src/core/routes/app_router.dart';

class SearchBarWidget extends StatelessWidget {
  bool enabled = true;
  Function(String)? onChanged;

  SearchBarWidget({
    super.key,
    this.enabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 280.w,
      child: CustomTextFormField(
          enabled: enabled,
          label: '',
          obscureText: false,
          fillColor: Colors.white,
          onChanged: onChanged,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          )),
    );
  }
}
