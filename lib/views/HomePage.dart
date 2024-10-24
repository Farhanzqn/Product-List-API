import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_api/views/product_list_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Main Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Welcome Text with Animation
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(seconds: 2),
                builder: (context, double opacity, child) {
                  return Opacity(
                    opacity: opacity,
                    child: Text(
                      'Welcome Home!',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black38,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 20),

              // Subtitle Text with slight animation
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(seconds: 2),
                builder: (context, double opacity, child) {
                  return Opacity(
                    opacity: opacity,
                    child: Text(
                      'We are so glad you\'re here!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 40),

              // Illustrative Image or Icon

              SizedBox(height: 50),

              // Get Started Button
              ElevatedButton(
                onPressed: () {
                  Get.to(() => ProductListPage());
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Background warna putih
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 10,
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
