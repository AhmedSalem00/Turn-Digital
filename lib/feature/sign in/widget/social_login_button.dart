import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SocialLoginButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 270,
        height: 50,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          icon: FaIcon(icon, color: iconColor),
          onPressed: onPressed,
          label: Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
