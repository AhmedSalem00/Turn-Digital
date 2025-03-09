// import 'package:flutter/material.dart';
//
// class FormValidation {
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//
//   // Function to validate full name (at least 3 words)
//   String? _validateFullName(String? value) {
//     if (value == null || value.trim().split(" ").length < 3) {
//       return "Full name must have at least 3 words";
//     }
//     return null;
//   }
//
//   // Function to validate email
//   String? _validateEmail(String? value) {
//     if (value == null ||
//         !RegExp(
//           r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
//         ).hasMatch(value)) {
//       return "Enter a valid email address";
//     }
//     return null;
//   }
//
//   // Function to validate password
//   String? _validatePassword(String? value) {
//     if (value == null || value.length < 8) {
//       return "Password must be at least 8 characters";
//     }
//     if (!RegExp(
//       r"(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])",
//     ).hasMatch(value)) {
//       return "Password must contain Uppercase, Lowercase, Number & Special character";
//     }
//     return null;
//   }
//
//   // Function to validate confirm password
//   String? _validateConfirmPassword(String? value) {
//     if (value != _passwordController.text) {
//       return "Passwords do not match";
//     }
//     return null;
//   }
//
//   // Example usage in a form
//   String? validateForm() {
//     String? fullNameValidation = _validateFullName(_fullNameController.text);
//     if (fullNameValidation != null) return fullNameValidation;
//
//     String? emailValidation = _validateEmail(_emailController.text);
//     if (emailValidation != null) return emailValidation;
//
//     String? passwordValidation = _validatePassword(_passwordController.text);
//     if (passwordValidation != null) return passwordValidation;
//
//     String? confirmPasswordValidation =
//     _validateConfirmPassword(_confirmPasswordController.text);
//     if (confirmPasswordValidation != null) return confirmPasswordValidation;
//
//     return null; // No validation errors
//   }
// }
