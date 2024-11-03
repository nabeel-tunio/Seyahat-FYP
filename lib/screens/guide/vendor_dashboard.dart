import 'package:flutter/material.dart';
import 'package:seyahat/widgets/userprofile_widget.dart';
import 'package:seyahat/widgets/bottomnavbar.dart';

class VendorDashboard extends StatelessWidget {
  final String username;
  const VendorDashboard({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Welcome back",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A76D2),
                ),
              ),
              UserProfile(username: username),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Color(0xFFFFFFFF),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Experience',
                                style: TextStyle(
                                  color: Color(0xFF1A76D2),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Icon(Icons.bar_chart_rounded, size: 100, color: Colors.blue),
                              SizedBox(height: 8),
                              Text(
                                '5 years',
                                style: TextStyle(
                                  color: Color(0xFF1A76D2),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Card(
                        color: Color(0xFFFFFFFF),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Response Time',
                                style: TextStyle(
                                  color: Color(0xFF1A76D2),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Icon(Icons.timer_rounded,
                                  size: 90, color: Colors.blue),
                              SizedBox(height: 8),
                              Text(
                                '1 hour',
                                style: TextStyle(
                                  color: Color(0xFF1A76D2),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                      Expanded(
                      child: Card(
                        color: Color(0xFFFFFFFF),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rating',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF1A76D2),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.star_rounded,
                                      size: 20, color: Colors.yellow),
                                  Icon(Icons.star_rounded,
                                      size: 20, color: Colors.yellow),
                                  Icon(Icons.star_rounded,
                                      size: 20, color: Colors.yellow),
                                  Icon(Icons.star_rounded,
                                      size: 20, color: Colors.yellow),
                                  Icon(Icons.star_border_rounded,
                                      size: 20, color: Colors.grey),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                '4.0/5',
                                style: TextStyle(
                                  color: Color(0xFF1A76D2),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    SizedBox(width: 16),
                    Expanded(
                      child: Card(
                        color: Color(0xFFFFFFFF),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Success Score',
                                style: TextStyle(
                                  color: Color(0xFF1A76D2),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              LinearProgressIndicator(
                                minHeight: 10,
                                value: 0.8,
                                valueColor: AlwaysStoppedAnimation(Colors.green),
                                backgroundColor: Colors.grey,
                              ),
                              SizedBox(height: 8),
                              Text(
                                '80%',
                                style: TextStyle(
                                  color: Color(0xFF1A76D2),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Align text on opposite sides
                  children: [
                    Text(
                      'Bookings',  // Left-side text
                      style: TextStyle(
                        color: Color(0xFF1A76D2),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '2 / 5',  // Right-side text (number of bookings)
                      style: TextStyle(
                        color: Color(0xFF1A76D2),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'To do',
                  style: TextStyle(
                    color: Color(0xFF1A76D2),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notifications to ponder',
                      style: TextStyle(
                        color: Color(0xFF1A76D2),
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8), // Add some padding around the circle
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF1A76D2), // Set the circle color
                      ),
                      child: Text(
                        '5', // The notification number
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    // Bookings

    ),
        bottomNavigationBar: const BottomNavBar(), // Include the bottom nav bar here

      ),
    );
  }
}