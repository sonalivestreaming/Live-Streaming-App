import 'package:flutter/material.dart';
import 'package:streaming_app/pages/root_app.dart';
import 'package:streaming_app/theme/colors.dart';
import 'package:video_player/video_player.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the video player
    _controller = VideoPlayerController.asset('assets/splash_video.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true); // Loop the video

        setState(() {}); // Update UI
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Video Background
          if (_controller.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover, // Make the video cover the screen
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            )
          else
            Center(
              child: CircularProgressIndicator(), // Show loader while video initializes
            ),

          // Overlay Content
          SafeArea(
            child: Column(
              children: [
                // Top Bar: Back Arrow and Skip
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Arrow
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => RootApp()), // Navigate to the new page
                          );
                        },
                      ),
                      // Skip Button
                      TextButton(
                        onPressed: () {
                          // Navigate to next screen or perform action
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => RootApp()), // Navigate to the new page
                          );
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(), // Push remaining content to the bottom

                // Title
                Text(
                  "Glad to Meet You!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),

                // Buttons
                Column(
                  children: [
                    _buildButton(Icons.phone, "Phone", Colors.purple),
                    _buildButton(Icons.facebook, "Facebook", Colors.blue),
                    _buildButton(Icons.email, "Google", Colors.red),
                    _buildButton(Icons.mail, "Email", Colors.green),
                  ],
                ),

                SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'By signing up means that you agree to our ',
                      style: TextStyle(color: Colors.white70, fontSize: 14,fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build buttons
  Widget _buildButton(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          minimumSize: Size(double.infinity, 48), // Full-width button
        ),
        onPressed: () {
          // Button action here
          print('$label button pressed');
        },
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
