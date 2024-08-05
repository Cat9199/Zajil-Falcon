import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zajil_v2/src/config/theme/styles.dart';
import 'package:zajil_v2/src/config/utils/app_strings.dart';
import 'package:zajil_v2/src/config/utils/common_widgets/common_gradient.dart';
import 'package:zajil_v2/src/config/utils/common_widgets/default_button.dart';
import 'package:zajil_v2/src/config/utils/common_widgets/default_text_form_filed.dart';
import 'package:zajil_v2/src/core/helpers/extensions.dart';
import 'package:zajil_v2/src/core/helpers/spacing.dart';
import 'package:zajil_v2/src/core/routes/app_router.dart';
import 'package:zajil_v2/src/features/authntication/logic/authntication_cubit.dart';

class LoginPhone extends StatefulWidget {
  const LoginPhone({super.key});

  @override
  State<LoginPhone> createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF46C4FF),
          Color(0xFF2FF2DC),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.EnterYourPhoneproceed,
                style: font32BlackBold.copyWith(color: Colors.white),
              ),
              verticalSpace(12),
              CustomTextFormField(
                textEditingController:
                    context.read<AuthnticationCubit>().phoneEditingController,
                label: AppStrings.EnterYourPhone,
                keyboardType: TextInputType.phone,
                obscureText: false,
                labelStyle: font24BlackBold.copyWith(color: Colors.white),
              ),
              verticalSpace(24),
              SizedBox(
                width: 100.w,
                child: DefultButton(
                  text: AppStrings.Proceed,
                  onPressed: () {
                    context.read<AuthnticationCubit>().loginWithPhone();
                    context.goToAndReplace(Routes.layout);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
