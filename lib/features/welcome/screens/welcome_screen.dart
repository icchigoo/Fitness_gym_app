import 'package:fitness_gym_app/authentication/screens/login_screen.dart';
import 'package:fitness_gym_app/shared/utils/constants.dart';
import 'package:fitness_gym_app/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/welcomeImage.jpg"),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 300),
                Text(
                  "Sohan app",
                  style: kTextStyleHeaders,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 30, right: 30),
                  child: Text(
                    "with this app,you can try different types of activities and choose what the most enjoyable for you",
                    style: kTextStyleSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 80,
              child: CustomButton(
                text: 'Get Started',
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
