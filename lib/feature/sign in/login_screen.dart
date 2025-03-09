import 'package:booking_application/core/helper/extension.dart';
import 'package:booking_application/core/routing/app_routers.dart';
import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/font_weight_helper.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:booking_application/core/widget/text_button.widget.dart';
import 'package:booking_application/feature/sign%20in/widget/email_password_login.dart';
import 'package:booking_application/feature/sign%20in/widget/forget_password.dart';
import 'package:booking_application/feature/sign%20in/widget/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widget/dont_have_account.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_ui.png'),
            fit: BoxFit.cover,
          ),),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/splash.png', height: 80.h),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
              Text(
                "Sign in",
                style: TextStyles.font24GrayRegular.copyWith(
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              // Email Field
              SizedBox(height: 15),
              EmailPasswordLoginWidget(),

              SizedBox(height: 10.h),
              RememberMeForgotPassword(),
              SizedBox(height: 15.h),
              // Sign In Button
              Center(
                child: SizedBox(
                  width: 270.w,
                  child: AppTextButton(
                    buttonText: "SIGN IN",
                    textStyle: TextStyles.font15GrayRegular.copyWith(
                      color: ColorsApp.white,
                    ),
                    backgroundColor: Colors.orange,
                    icon: Icons.arrow_forward_outlined,
                    onPressed: (){
                      context.pushReplacementNamed(Routes.homeScreen);

                    },
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Center(
                child: Text(
                  "OR",
                  style: TextStyles.font15GrayRegular.copyWith(color: ColorsApp.orange),
                ),
              ),
              SizedBox(height: 15.h),
              // Google Sign-In Button
              SocialLoginButton(
                text: 'Login with Google',
                icon: FontAwesomeIcons.google,
                onPressed: () {},
                iconColor: Colors.red,
              ),
              SizedBox(height: 10.h),
              SocialLoginButton(
                text: 'Login with Facebook',
                icon: FontAwesomeIcons.facebook,
                onPressed: () {},
                iconColor: Colors.blue,
              ),
              SizedBox(height: 20.h),
              DontHaveAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
