import 'package:booking_application/core/helper/extension.dart';
import 'package:booking_application/core/routing/app_routers.dart';
import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?',
              style: TextStyles.font14BlueRegular.copyWith(color: ColorsApp.black),
            ),
            TextSpan(
              text: ' Sign up',
              style: TextStyles.font14BlueRegular.copyWith(color: ColorsApp.orange),
              recognizer:
              TapGestureRecognizer()
                ..onTap = () {
                  context.pushReplacementNamed(Routes.loginScreen);
                },

            ),
          ],
        ),
      ),
    );
  }
}