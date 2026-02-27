import 'package:addis_movies/widgets/my_button.dart';
import 'package:addis_movies/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  // tap to go to register page
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // email and pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            const Text(
              'Addis Movies',
              style: TextStyle(color: Colors.red, fontSize: 36),
            ),
            const SizedBox(height: 50),
            // welcome back message
            const Text(
              'Welcome back...',
              style: TextStyle(color: Colors.white54, fontSize: 21),
            ),
            const SizedBox(height: 25),

            // email textfield
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 12),

            // pw textfield
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
            ),
            const SizedBox(height: 25),

            // login button
            MyButton(text: "Login", onTap: login),
            const SizedBox(height: 15),

            // register now
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Don't have an account? "),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
