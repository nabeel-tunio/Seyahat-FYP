import 'package:flutter/material.dart';
import 'package:seyahat/widgets/custom_text_field.dart';
import 'package:seyahat/widgets/custom_dropdown.dart';
import 'package:seyahat/screens/guide/guide_signup_page.dart'; // Import the Guide signup page
import 'package:seyahat/screens/guide/guide_signup_page3.dart'; // Import the Guide signup page 3

class GuideSignUpPage2 extends StatelessWidget {
  const GuideSignUpPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController experienceLevelController = TextEditingController();
    final TextEditingController languageController = TextEditingController();
    final TextEditingController certificationController = TextEditingController();
    final TextEditingController availabilityController = TextEditingController();

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
                'Guide Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF9800),
                ),
              ),
            ),

            const SizedBox(height: 10),
            // Experience Level Dropdown
            CustomDropdownField(
              controller: experienceLevelController,
              hintText: 'Experience Level',
              prefixIcon: const Icon(Icons.arrow_drop_down, color: Color(0xFF1A76D2)), // Add a prefix icon
              options: ['Beginner', 'Intermediate', 'Advanced'], // Dropdown options
            ),

            const SizedBox(height: 10),
            CustomDropdownField(
              controller: languageController,
              hintText: 'Languages',
              prefixIcon: const Icon(Icons.arrow_drop_down, color: Color(0xFF1A76D2)), // Add a prefix icon
              options: ['English', 'Sindhi', 'Urdu'], // Dropdown options
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: certificationController,
              hintText: 'Certification',
              prefixIcon: const Icon(Icons.ac_unit_outlined, color: Color(0xFF1A76D2)), // Username icon
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: availabilityController,
              hintText: 'Availability',
              prefixIcon: const Icon(Icons.access_time_filled_sharp, color: Color(0xFF1A76D2)), // Email icon
            ),
            const SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns buttons on the far left and far right
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to another page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const GuideSignUpPage(), // Replace with your target page
        ),
      );
    },
                  child: const Text(
                    'Previous',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                      // Handle previous button functionality
                    _handleSignUp(context, experienceLevelController, languageController, certificationController, availabilityController);
                  },

                child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                )

              ],
            )
          ],
        ),
      ),
    );
  }

  void _handleSignUp(BuildContext context, TextEditingController experienceLevelController, TextEditingController languageController, TextEditingController certificationController, TextEditingController availabilityController) {
    if (experienceLevelController.text.isEmpty || languageController.text.isEmpty || certificationController.text.isEmpty || availabilityController.text.isEmpty) {
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
          builder: (context) => GuideSignUpPage3(),
        ),
      );
    }
  }
}
