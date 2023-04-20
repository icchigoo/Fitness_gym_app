import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/utils/constants.dart';
import '../../toDoList/models/toDoList_model.dart';
import '../models/profile_model.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskData>(context, listen: true);
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('ProfileDetails')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: blueColor,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Card(
              elevation: 5,
              color: const Color(0xff2F3541),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: SizedBox(
                height: 220,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('ProfileDetails')
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .collection('ProfilePicture')
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const CircleAvatar(
                                      radius: 45,
                                      backgroundColor: Color(0xff181920),
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 45,
                                      ));
                                }
                                return CircleAvatar(
                                  radius: 45,
                                  backgroundColor: const Color(0xff181920),
                                  backgroundImage: snapshot.data!
                                              .data()!['ProfilePicture'] ==
                                          null
                                      ? null
                                      : NetworkImage(snapshot.data!
                                          .data()!['ProfilePicture']),
                                  child: snapshot.data!
                                              .data()!['ProfilePicture'] ==
                                          null
                                      ? const Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: 45,
                                        )
                                      : null,
                                );
                              }),
                          Positioned(
                            bottom: 1.5,
                            right: 0.5,
                            child: GestureDetector(
                              onTap: () =>
                                  ProfileModel.setProfilePicture(context),
                              child: const CircleAvatar(
                                radius: 15,
                                backgroundColor: orangeColor,
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text('${snapshot.data!.data()!['UserName']}',
                          style: kTextStyleHeaders),
                      Text(
                        '${FirebaseAuth.instance.currentUser!.email}',
                        style: kTextStyleLarge.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
