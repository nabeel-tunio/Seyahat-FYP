import 'package:flutter/material.dart';
import 'package:seyahat/screens/success_page.dart';
import 'package:seyahat/widgets/custom_text_field.dart';
import 'package:seyahat/widgets/password_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'User Sign Up',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A76D2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Already have an account? ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to LoginPage
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline, // Underline for emphasis
                ),
              ),
            ),
            const SizedBox(height: 35),
            CustomTextField(
              controller: usernameController,
              hintText: 'Username',
              prefixIcon: const Icon(Icons.person, color: Color(0xFF1A76D2)), // Username icon
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: emailController,
              hintText: 'Email',
              prefixIcon: const Icon(Icons.email, color: Color(0xFF1A76D2)), // Email icon
            ),
            const SizedBox(height: 10),
            PasswordTextField(controller: passwordController), // Your password field widget
            const SizedBox(height: 45),
            ElevatedButton(
              onPressed: () {
                // Handle sign-up functionality
                _handleSignUp(context, usernameController, emailController, passwordController);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A76D2),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSignUp(BuildContext context, TextEditingController usernameController, TextEditingController emailController, TextEditingController passwordController) {
    if (usernameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Pass the username to the SuccessPage
      String username = usernameController.text;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessPage(username: username), // Pass username here
        ),
      );
    }
  }
}
