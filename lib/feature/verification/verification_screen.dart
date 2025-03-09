import 'package:booking_application/core/helper/extension.dart';
import 'package:booking_application/core/theming/font_weight_helper.dart';
import 'package:booking_application/core/widget/text_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routing/app_routers.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import 'data/cubit/verification_cubit.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<VerificationCubit>(); // Trigger the cubit to start the timer
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerificationCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocListener<VerificationCubit, VerificationState>(
            listener: (context, state) {

              if (state is VerificationSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("OTP Verified!")));
                context.pushReplacementNamed(Routes.homeScreen);
              } else if (state is VerificationFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid OTP. Please try again.")));
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verification",
                  style: TextStyles.font24GrayRegular.copyWith(fontWeight: FontWeightHelper.bold),
                ),
                SizedBox(height: 10.h),
                Text(
                  "We've sent you the verification \n code on  +1 2620 0323 7631",
                  style: TextStyles.font15GrayRegular,
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _otpField(_controller1),
                    _otpField(_controller2),
                    _otpField(_controller3),
                    _otpField(_controller4),
                  ],
                ),
                SizedBox(height: 30.h),
                Center(
                  child: SizedBox(
                    width: 270.w,
                    child: AppTextButton(

                      buttonText: "Continue",
                      textStyle: TextStyles.font15GrayRegular.copyWith(
                        color: ColorsApp.orange,

                      ),
                      backgroundColor: Colors.orange,
                      icon: Icons.arrow_forward_outlined,
                      onPressed: () {
                        String enteredOtp = _controller1.text + _controller2.text + _controller3.text + _controller4.text;
                        context.read<VerificationCubit>().validateOtp(enteredOtp);
                        context.pushReplacementNamed(Routes.homeScreen);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                BlocBuilder<VerificationCubit, VerificationState>(
                  builder: (context, state) {
                    if (state is VerificationTimerUpdated) {
                      return Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Re-send code in ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: state.seconds > 0 ? "${state.seconds}" : "0",
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _otpField(TextEditingController controller) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(border: InputBorder.none, counterText: ""),
        style: TextStyles.font20WhiteRegular.copyWith(fontSize: 25.sp, color: Colors.black),
      ),
    );
  }
}

