import 'package:booking_application/core/widget/text_form_filed.dart';
import 'package:booking_application/feature/sign%20up/data/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/cubit/state.dart';


class EmailPasswordSignWidget extends StatefulWidget {
  const EmailPasswordSignWidget({super.key});

  @override
  State<EmailPasswordSignWidget> createState() => _EmailPasswordSignWidgetState();
}

class _EmailPasswordSignWidgetState extends State<EmailPasswordSignWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormFiled(
            controller: cubit.fullNameController,
            hintText: "Full name",
            prefixIcon: Icon(Icons.person),
            validator: (value) {
              if (value == null || value.trim().split(" ").length < 3) {
                return "Full name must have at least 3 words";
              }
              return null;
            },
          ),
          SizedBox(height: 15),

          // Email Field
          AppTextFormFiled(
            controller: SignUpCubit.emailController,
            hintText: "abc@email.com",
            prefixIcon: Icon(Icons.email),
            validator: (value) {
              if (value == null || !RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(value)) {
                return "Enter a valid email address";
              }
              return null;
            },
          ),
          SizedBox(height: 15.h),

          // Password Field
          AppTextFormFiled(
            controller: cubit.passwordController,
            hintText: "Your password",
            prefixIcon: Icon(Icons.lock),
            // obscureText: true,  // Ensure password is obscured
            validator: (value) {
              if (value == null || value.length < 8) {
                return "Password must be at least 8 characters";
              }
              return null;
            },
          ),
          SizedBox(height: 15),

          // Confirm Password Field
          AppTextFormFiled(
            controller: cubit.confirmPasswordController,
            hintText: "Confirm password",
            prefixIcon: Icon(Icons.lock),
            // obscureText: true,  // Ensure confirm password is obscured
            validator: (value) {
              if (value != cubit.passwordController.text) {
                return "Passwords do not match";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
