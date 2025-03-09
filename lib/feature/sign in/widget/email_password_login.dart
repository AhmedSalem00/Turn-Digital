import 'package:booking_application/core/widget/text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailPasswordLoginWidget extends StatefulWidget {
  const EmailPasswordLoginWidget({super.key});

  @override
  State<EmailPasswordLoginWidget> createState() => _EmailPasswordLoginWidgetState();
}

class _EmailPasswordLoginWidgetState extends State<EmailPasswordLoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormFiled(
          controller: _emailController,
          hintText: "abc@email.com",
          prefixIcon: Icon(Icons.email),
          validator: (String) {},
        ),
        SizedBox(height: 20.h),

        // Password Field
        AppTextFormFiled(
          controller: _passwordController,
          hintText: "Your password",
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed:
                () => setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            }),
          ),
          validator: (String) {},
        ),
      ],
    );
  }
}
