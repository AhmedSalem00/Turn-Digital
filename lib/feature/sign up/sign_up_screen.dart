import 'package:booking_application/core/helper/extension.dart';
import 'package:booking_application/core/routing/app_routers.dart';
import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:booking_application/core/widget/text_button.widget.dart';
import 'package:booking_application/feature/sign%20up/widget/already_have_account.dart';
import 'package:booking_application/feature/sign%20up/widget/email_password_sign_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/theming/font_weight_helper.dart';
import '../sign in/widget/social_login_button.dart';
import 'data/cubit/cubit.dart';
import 'data/cubit/state.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(

              image: AssetImage('assets/images/background_ui.png',
              ),
              fit: BoxFit.cover,
            ),),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyles.font24GrayRegular.copyWith(
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                EmailPasswordSignWidget(),
                SizedBox(height: 30.h),

                // Sign Up Button
                Center(
                  child: SizedBox(
                    width: 290.w,
                    child: BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) {
                        if (state is SignUpLoading) {
                          // Show loading spinner
                        }
                        if (state is SignUpSuccess) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(state.message)));
                        }
                        if (state is SignUpFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMessage)),
                          );
                        }
                      },
                      builder: (context, state) {
                        return AppTextButton(
                          buttonText:
                              state is SignUpLoading ? "Loading..." : "SIGN UP",
                          backgroundColor: Colors.orange,
                          icon:
                              state is SignUpLoading ? null : Icons.arrow_forward,
                          onPressed: () async {
                            final cubit = context.read<SignUpCubit>();

                            if (!cubit.formKey.currentState!.validate()) {
                              return;
                            }

    if (state is! SignUpLoading) {
                              await context.read<SignUpCubit>().registerUser();

                              // 🔥 Wait for UI to rebuild with the new state
                              await Future.delayed(Duration(milliseconds: 100));

                              final newState = context.read<SignUpCubit>().state; // Get the latest state
                              print("Updated state is $newState");
                              print("qqqqqqqqq${newState is SignUpSuccess}");

                              if (newState is SignUpSuccess) {
                              Navigator.of(context).pushNamed(Routes.verificationScreen);
                              }
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Center(
                  child: Text(
                    "OR",
                    style: TextStyles.font15GrayRegular.copyWith(
                      color: ColorsApp.orange,
                    ),
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
                AlreadyHaveAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//              Text(
//               "Sign Up",
//               style: TextStyles.font24GrayRegular.copyWith(
//                 fontWeight: FontWeightHelper.bold,
//               ),            ),
//             SizedBox(height: 20.h),
//
//             EmailPasswordSignWidget(),
//             SizedBox(height: 30.h),
//             // Sign In Button
//             Center(
//               child: SizedBox(
//                 width: 290.w,
//                 child: AppTextButton(
//                   buttonText: "SIGN UP",
//                   backgroundColor: Colors.orange,
//                     icon: Icons.arrow_forward,
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 15.h),
//             Center(
//               child: Text(
//                 "OR",
//                 style: TextStyles.font15GrayRegular.copyWith(color: ColorsApp.orange),
//               ),
//             ),
//             SizedBox(height: 15.h),
//             // Google Sign-In Button
//             SocialLoginButton(
//               text: 'Login with Google',
//               icon: FontAwesomeIcons.google,
//               onPressed: () {},
//               iconColor: Colors.red,
//             ),
//             SizedBox(height: 10.h),
//             SocialLoginButton(
//               text: 'Login with Facebook',
//               icon: FontAwesomeIcons.facebook,
//               onPressed: () {},
//               iconColor: Colors.blue,
//             ),
//             SizedBox(height: 20.h),
//             // Sign Up Link
//             AlreadyHaveAccountText(),
//           ],
//         ),
//       ),
//     );
//   }
// }
