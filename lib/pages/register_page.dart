// ignore_for_file: use_build_context_synchronously

import 'package:chat_messenger/services/auth/auth_service.dart';
import 'package:chat_messenger/widgets/default_text_filed.dart';
import 'package:chat_messenger/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
        ),
      );
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Icon(
                Icons.message,
                size: 80,
                color: Colors.grey[800],
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(
                "Welcome back you're been missed!",
                style: GoogleFonts.lato(fontSize: 16.sp),
              ),
              SizedBox(
                height: 22.h,
              ),
              DefaultTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false),
              SizedBox(
                height: 13.h,
              ),
              DefaultTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true),
              SizedBox(
                height: 25.h,
              ),
              DefaultTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm password",
                  obscureText: true),
              SizedBox(
                height: 25.h,
              ),
              DefaultButton(
                text: "Sign In",
                onTap: signUp,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already a member? ",
                    style: GoogleFonts.lato(fontSize: 16.sp),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login now",
                      style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
