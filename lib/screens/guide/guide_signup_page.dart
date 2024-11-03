import 'package:flutter/material.dart';
import 'package:seyahat/widgets/custom_text_field.dart';
import 'package:seyahat/widgets/password_field.dart';
import 'package:seyahat/screens/guide/guide_signup_page2.dart'; // Import the Guide signup page 2


class GuideSignUpPage extends StatelessWidget {
  const GuideSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController cnicController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
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
              'Join as a Guide',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A76D2),
              ),
            ),
            const SizedBox(height: 37),
            const Align(
              alignment: Alignment.centerLeft, // Aligns the text to the left
              child: Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF9800),
                ),
              ),
            ),

            CustomTextField(
              controller: nameController,
              hintText: 'Name',
              prefixIcon: const Icon(Icons.person, color: Color(0xFF1A76D2)), // Username icon
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: cnicController,
              hintText: 'CNIC',
              prefixIcon: const Icon(Icons.account_box, color: Color(0xFF1A76D2)), // Username icon
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: phoneController,
              hintText: 'Phone Number',
              prefixIcon: const Icon(Icons.phone, color: Color(0xFF1A76D2)), // Username icon
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
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Handle sign-up functionality
                  _handleSignUp(context, nameController, phoneController, cnicController);
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
              ),
            )

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
      //String username = usernameController.text;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GuideSignUpPage2(),
        ),
      );
    }
  }
}
