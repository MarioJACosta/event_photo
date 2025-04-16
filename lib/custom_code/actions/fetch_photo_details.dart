// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> fetchPhotoDetails(
  DocumentReference photoId,
  DocumentReference userId,
) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Check if the photo is liked by the authenticated user
  QuerySnapshot likesSnapshot = await firestore
      .collection('liked_photos')
      .where('photo', isEqualTo: photoId)
      .where('user', isEqualTo: userId)
      .get();

  bool isLiked = likesSnapshot.docs.isNotEmpty;

  return isLiked;
}
