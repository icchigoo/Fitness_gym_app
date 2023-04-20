import 'package:flutter/material.dart';

import '../../../shared/utils/constants.dart';
class ProfileTile extends StatelessWidget {
  const ProfileTile(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);
  final IconData icon;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: const Color(0xff282E38),
            child: Icon(icon, color: Colors.grey, size: 25)),
        title: Text(
          text,
          style: kTextStyleLarge,
        ),
        trailing: const Icon(Icons.arrow_forward, color: Colors.white),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

