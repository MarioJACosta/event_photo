// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> isPhotoSaved(
  DocumentReference photoId,
  DocumentReference userId,
) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Check if the photo is saved by the authenticated user
  QuerySnapshot savesSnapshot = await firestore
      .collection('saved_photos')
      .where('photo', isEqualTo: photoId)
      .where('user', isEqualTo: userId)
      .get();

  bool isSaved = savesSnapshot.docs.isNotEmpty;

  return isSaved;
}
