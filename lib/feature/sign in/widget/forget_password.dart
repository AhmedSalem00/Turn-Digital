import 'package:booking_application/core/theming/styles.dart';
import 'package:flutter/material.dart';

class RememberMeForgotPassword extends StatefulWidget {
  const RememberMeForgotPassword({super.key});

  @override
  State<RememberMeForgotPassword> createState() =>
      _RememberMeForgotPasswordState();
}

class _RememberMeForgotPasswordState extends State<RememberMeForgotPassword> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Switch(
              value: _rememberMe,
              activeColor: Colors.orange,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
            const Text("Remember Me"),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text("Forgot Password?", style: TextStyles.font15GrayRegular),
        ),
      ],
    );
  }
}
