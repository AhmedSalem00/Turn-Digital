import 'package:bloc/bloc.dart';
import 'package:booking_application/feature/sign%20up/data/cubit/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final Dio _dio = Dio();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  SignUpCubit() : super(SignUpInitial());

  Future<void> registerUser() async {
    emit(SignUpLoading());

    try {

      final response = await _dio.post(
        "http://api.td-dev.turndigital.net/api/users/register",
        data: {
          "name":fullNameController.text,
          "email": emailController.text,
          "password": passwordController.text.trim()

        },
      );



      if (response.statusCode == 200) {
        print("response: ${response.data}");
        if (response.data["success"].toString() == 'true') {
          print("Registration successful!");
          emit(SignUpSuccess("Registration successful!"));
        } else {
          emit(SignUpFailure(response.data["message"] ?? "Registration failed"));
        }
      } else {
        emit(SignUpFailure(response.data["message"] ?? "Registration failed"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // 🔍 Extract validation errors from server response
        print("Server Response: ${e.response?.data}");
        print("Status Code: ${e.response?.statusCode}");

        String errorMessage = "Registration failed";

        if (e.response?.statusCode == 422) {
          if (e.response?.data is Map && e.response?.data["errors"] != null) {
            final errors = e.response?.data["errors"];
            if (errors is Map) {
              errorMessage = errors.values.first[0]; // Get first error message
            }
          } else {
            errorMessage = e.response?.data["message"] ?? "Invalid input";
          }
        }

        emit(SignUpFailure(errorMessage));
      } else {
        print("DioException: ${e.message}");
        emit(SignUpFailure("Network error: ${e.message}"));
      }
    } catch (e) {
      print("Unexpected Error: $e");
      emit(SignUpFailure("An unexpected error occurred"));
    }
  }

  @override
  Future<void> close() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
