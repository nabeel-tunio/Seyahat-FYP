import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seyahat/screens/guide/success_page_vendor.dart';
import 'package:seyahat/widgets/custom_text_field.dart';
import 'package:seyahat/widgets/image_picker.dart';  // Your custom image picker controller

class GuideSignUpPage3 extends StatelessWidget {
  const GuideSignUpPage3({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController aboutController = TextEditingController();
    ImagePickerController controller = Get.put(ImagePickerController());
    final TextEditingController socialMediaLinksController = TextEditingController();
    final TextEditingController paymentMethodController = TextEditingController();

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
              alignment: Alignment.centerLeft,
              child: Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF9800),
                ),
              ),
            ),
            CustomTextField(
              controller: aboutController,
              hintText: 'About Me/Bio',
              prefixIcon: const Icon(Icons.account_circle, color: Color(0xFF1A76D2)),  // Bio icon
            ),
            const SizedBox(height: 20),
            // GestureDetector wrapping a Container (rectangular box)
            GestureDetector(
              onTap: () {
                controller.getImage();  // Trigger the image picker when the container is tapped
              },
              child: Obx(() {
                return Stack(
                  alignment: Alignment.center,  // Center the hint text
                  children: [
                    Container(
                      width: 400,  // Width of the rectangular box
                      height: 180,  // Height of the rectangular box
                      decoration: BoxDecoration(
                        color: Colors.grey[300],  // Background color if no image
                        borderRadius: BorderRadius.circular(15),  // Rounded corners for the box
                        image: controller.imagePath.isNotEmpty
                            ? DecorationImage(
                          image: FileImage(File(controller.imagePath.toString())),
                          fit: BoxFit.cover,  // Fit the image to cover the box
                        )
                            : null,
                      ),

                    ),

                    // Hint text, shown only when no image is selected
                    if (controller.imagePath.isEmpty)
                      const Positioned(
                        child: Text(
                          "Upload CNIC",  // Hint text
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,  // Semi-transparent black color
                          ),
                        ),
                      ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: socialMediaLinksController,
              hintText: 'Social Media Links (Optional)',
              prefixIcon: const Icon(Icons.add_link_outlined, color: Color(0xFF1A76D2)),  // Bio icon
            ),
            CustomTextField(
              controller: paymentMethodController,
              hintText: 'Payment Method (Optional)',
              prefixIcon: const Icon(Icons.payment, color: Color(0xFF1A76D2)),  // Bio icon
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  String username = 'abc';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SuccessPageVendor(username: username),
                    ),
                  );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A76D2),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Signup",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
