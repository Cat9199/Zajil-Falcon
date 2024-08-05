import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zajil_v2/src/config/theme/styles.dart';
import 'dart:io' show Platform;

import 'package:zajil_v2/src/config/utils/app_strings.dart';
import 'package:zajil_v2/src/config/utils/assets_manger.dart';
import 'package:zajil_v2/src/config/utils/common_widgets/default_button.dart';
import 'package:zajil_v2/src/config/utils/common_widgets/default_text_form_filed.dart';
import 'package:zajil_v2/src/core/helpers/spacing.dart';
import 'package:zajil_v2/src/core/helpers/validators.dart';
import 'package:zajil_v2/src/features/authntication/presentation/widgets/deafult_rich_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<LoginScreen> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //     appBar: customAppBars(),
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    children: [
                      Image.asset(
                        AssetsManger.logo,
                        height: 100,
                        width: 100,
                      ),
                      Text(
                        AppStrings.login,
                        style: font24BlackBold,
                      ),
                      Text(
                        AppStrings.loginInfo,
                        style: font13GrayRegular,
                      ),
                      verticalSpace(30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CustomTextFormField(
                          labelStyle: font16WhiteMedium,
                          validator: (email) {
                            return null;

                            //  return Valdiator.validateEmail(email)?.tr;
                          },
                          textEditingController: emailEditingController,
                          label: AppStrings.enterEmail,
                          obscureText: false,
                        ),
                      ),
                      verticalSpace(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CustomTextFormField(
                          key: const Key('login'),
                          validator: (password) {
                            return Valdiator.validatePassword(password);
                          },
                          textEditingController: passwordEditingController,
                          label: AppStrings.EnterPasswordPrompt,
                          obscureText: false,
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // GO.toNamed(Routes.forgotPasswordRoute);
                          },
                          child: Text(
                            AppStrings.ForgotYourPassword,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      verticalSpace(30),
                      DefultButton(
                        text: AppStrings.login,
                        onPressed: () {
                          if (loginFormKey.currentState!.validate()) {
                            // authController.login(
                            //     password: passwordEditingController.text,
                            //     email: emailEditingController.text);
                          }
                          // GO.toNamedAndCloseAll(
                          //     Routes.NoChallengesLayoutRoute);
                        },
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Expanded(
                      //       child: SociaMediaButton(
                      //         sociaMediaLogo: AssetsManger.facbookIcon,
                      //         onTap: () {
                      //           authController.signinWithFacebook();
                      //         },
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 10,
                      //     ),
                      //     Expanded(
                      //       child: SociaMediaButton(
                      //         sociaMediaLogo: AssetsManger.googleIcon,
                      //         onTap: () {
                      //           authController.signinWithGoogle();
                      //         },
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 10,
                      //     ),
                      //     if (!kIsWeb)
                      //       if (Platform.isIOS)
                      //         Expanded(
                      //           child: SociaMediaButton(
                      //             onTap: () {
                      //               authController.signInWithApple();
                      //             },
                      //             sociaMediaLogo: AssetsManger.appleIcon,
                      //           ),
                      //         ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: defaultRichText(
            text1: AppStrings.DonotHaveAnAccount,
            text2: AppStrings.RegisterNowPrompt,
            onTap: () {
              //  GO.toNamed(Routes.registerRoute);
            },
          ),
        )
      ],
    ));
  }
}
