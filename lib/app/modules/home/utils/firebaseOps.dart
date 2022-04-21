// import 'package:universal_io/io.dart' as uniIO;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
// import 'package:firebase_storage/firebase_storage.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
// final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

late String verificationID;

Future<bool> checkIfDocumentExists(String documentPath) async {
  bool doesExists = false;
  await firebaseFirestore
      .doc(documentPath)
      .get()
      .then((value) => doesExists = value.exists);
  return doesExists;
}

Future<bool> checkIfDocumentFieldExists(
    String documentPath, String field) async {
  bool doesExists = false;
  await firebaseFirestore.doc(documentPath).get().then((value) {
    try {
      if (value.data()![field] != null) {
        doesExists = true;
      }
    } catch (e) {
      print(e);
    }
  });
  return doesExists;
}

writeToFirestore(String documentPath, Map<String, dynamic> data) async {
  await firebaseFirestore.doc(documentPath).get().then((value) async {
    if (value.exists) {
      await firebaseFirestore.doc(documentPath).update(data);
    } else {
      await firebaseFirestore.doc(documentPath).set(data);
    }
  });
}

incrementAField(String documentPath, String field) async {
  await firebaseFirestore.doc(documentPath).get().then((value) async {
    if (value.exists) {
      await firebaseFirestore
          .doc(documentPath)
          .update({'$field': FieldValue.increment(1)});
    } else {
      await firebaseFirestore
          .doc(documentPath)
          .set({'$field': FieldValue.increment(1)});
    }
  });
}

// decrementAField(String documentPath, String field) async {
//   await firebaseFirestore.doc(documentPath).get().then((value) async {
//     if (value.exists) {
//       await firebaseFirestore
//           .doc(documentPath)
//           .update({'$field': FieldValue.increment(-1)});
//     } else {
//       await firebaseFirestore
//           .doc(documentPath)
//           .set({'$field': FieldValue.increment(-1)});
//     }
//   });
// }

// deleteFromFirestore(String documentPath) async {
//   await firebaseFirestore.doc(documentPath).get().then((value) async {
//     if (value.exists) {
//       await firebaseFirestore.doc(documentPath).delete();
//     }
//   });
// }

Future<Map<String, dynamic>> getDataFromFirestore(String documentPath) async {
  Map<String, dynamic>? data = {};
  await firebaseFirestore.doc(documentPath).get().then((value) async {
    if (value.exists) {
      data = value.data();
    }
  });
  return data!;
}

Future<dynamic> getFieldFromFirestore(String documentPath, String field) async {
  var data;
  await firebaseFirestore.doc(documentPath).get().then((value) async {
    if (value.exists) {
      data = value.data()![field];
    }
  });
  return data;
}

// Future<String> uploadAFile(uniIO.File file, String path) async {
//   print("start upload");
//   Reference reference = firebaseStorage.ref().child(path);
//   UploadTask uploadTask;

//   uploadTask = reference.putFile(File(file.path));
//   print("start put");

//   TaskSnapshot result = await uploadTask.whenComplete(() => null);
//   String url = await result.ref.getDownloadURL();
//   return url;
// }

// deleteAFile(String path) async {
//   Reference reference = firebaseStorage.ref().child(path);
//   await reference.delete();
// }

Future<bool> verifyPhoneNumber(String phoneNumber, String address) async {
  bool isPhoneVerificationSuccessFul = false;
  await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        print('Automatic Phone Verification,writing phoneNumber to database');
        await firebaseAuth.currentUser!.linkWithPhoneNumber(phoneNumber);
        await writeToFirestore("users/${firebaseAuth.currentUser!.email}",
            {"phoneNumber": phoneNumber, "address": address});
        isPhoneVerificationSuccessFul = true;
        Get.back();
        Get.snackbar('Done!', 'Our Team will get in touch with you shortly!');
      },
      verificationFailed: (FirebaseAuthException firebaseAuthException) {
        if (firebaseAuthException.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        } else
          print(firebaseAuthException.code);
        isPhoneVerificationSuccessFul = false;
      },
      codeSent: (String verificationId, int? i) {
        print('OTP has been sent to user, setting the verification ID');
        verificationID = verificationId;
      },
      codeAutoRetrievalTimeout: (String s) {});

  return isPhoneVerificationSuccessFul;
}

Future<bool> verifyPhoneNumberWithSmsCode(
    String smsCode, String address) async {
  PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationID, smsCode: smsCode);
  UserCredential userCredential =
      await firebaseAuth.currentUser!.linkWithCredential(phoneAuthCredential);
  if (userCredential.user!.phoneNumber != null) {
    await writeToFirestore("users/${firebaseAuth.currentUser!.email}",
        {"phoneNumber": userCredential.user!.phoneNumber, "address": address});
    Get.back();
    Get.snackbar('Done!', 'Our Team will get in touch with you shortly!');
    return true;
  }
  return false;
}
