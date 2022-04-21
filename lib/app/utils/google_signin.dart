import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../modules/home/utils/firebaseOps.dart';

Future<UserCredential> signInWithGoogle() async {
  print("Google Sign in Start");
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = (await GoogleSignIn().signIn())!;

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  print("Google SignIn: Authentication");

  // Create a new credential
  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  await FirebaseAuth.instance
      .signInWithCredential(credential)
      .then((value) async {
    if (!(await checkIfDocumentExists('users/${value.user!.email}'))) {
      await writeToFirestore('users/${value.user!.email}', {
        "name": googleUser.displayName,
        "email": googleUser.email,
        "uid": value.user!.uid,
        "imgUrl": value.user!.photoURL,
        "phoneNumber": "",
      });
    }
  });

  Get.back();
  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
