import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_gym_app/features/profile/widgets/profile_tile.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main.dart';
import '../../feedback/screens/feedback_screen.dart';
import '../../reset_password/screens/reset_password_screen.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({Key? key}) : super(key: key);
  urlLaunch(Uri url) async {
    try {
      if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
        print('could not reach');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container()),
        Expanded(
          flex: 3,
          child: Container(
            color: const Color(0xff2F3541),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ProfileTile(
                      icon: Icons.lock_reset,
                      text: 'Change Password',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPasswordScreen(),
                          ))),
                  ProfileTile(
                    icon: Icons.safety_check,
                    text: 'Terms and Conditions',
                    onTap: () {
                      Uri url = Uri.parse('');
                      urlLaunch(url);
                    },
                  ),
                  ProfileTile(
                    icon: Icons.privacy_tip,
                    text: 'Privacy Policy',
                    onTap: () {
                      Uri url = Uri.parse('');
                      urlLaunch(url);
                    },
                  ),
                  ProfileTile(
                      icon: Icons.feedback,
                      text: 'Feedback',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FeedbackScreen(),
                          ))),
                  ProfileTile(
                    icon: Icons.logout,
                    text: 'Sign Out',
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
