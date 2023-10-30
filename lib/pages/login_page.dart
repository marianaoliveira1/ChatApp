import 'package:chat_messenger/components/my_button.dart';
import 'package:chat_messenger/components/my_text_filed.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() {}

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
              const SizedBox(
                height: 50,
              ),
              Icon(
                Icons.message,
                size: 80,
                color: Colors.grey[800],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Welcome back you're been missed!",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 22,
              ),
              MyTextField(controller: emailController, hintText: "Email", obscureText: false),
              const SizedBox(
                height: 13,
              ),
              MyTextField(controller: passwordController, hintText: "Password", obscureText: true),
              const SizedBox(
                height: 25,
              ),
              MyButton(
                text: "Sign In",
                onTap: signIn,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold),
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
