// ignore_for_file: deprecated_member_use

import 'package:fitness_gym_app/shared/utils/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_card.dart';
import '../widgets/profile_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Profile',
          style: kTextStyleHeaders,
        ),
      ),
      body: Stack(
        children: const [
          ProfileList(),
          ProfileCard(),
        ],
      ),
    );
  }
}
