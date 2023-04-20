import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../toDoList/models/toDoList_model.dart';

class ProfileModel {
  static final _firebaseFirestore =
      FirebaseFirestore.instance.collection('ProfileDetails');
  static void setProfilePicture(BuildContext context) async {
    try {
      final picker = await ImagePicker().pickImage(source: ImageSource.gallery);

      uploadProfileImageToFirebaseStorage(File(picker!.path), context);
    } catch (e) {
      print(e);
    }
  }

  static Future<String> uploadProfileImageToFirebaseStorage(
      File image, BuildContext context) async {
    String fileName = basename(image.path);

    var reference = FirebaseStorage.instance.ref().child(
        'profileImages/${FirebaseAuth.instance.currentUser!.uid}/$fileName');
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    await taskSnapshot.ref.getDownloadURL().then((value) {
      Provider.of<TaskData>(context, listen: false).setProfilePhoto(value);
      Map<String, String> information = {
        'ProfilePicture': value,
      };
      _firebaseFirestore
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('ProfilePicture')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(information);
    }).catchError((FirebaseException e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    });

    return Provider.of<TaskData>(context, listen: false).profilePhoto!;
  }
}
