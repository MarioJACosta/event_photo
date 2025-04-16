// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<PhotosRecord>> fetchAlbumPhotos(DocumentReference? albumId) async {
  if (albumId == null) {
    throw Exception("Album ID cannot be null.");
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Fetch the album document
  DocumentSnapshot albumSnapshot = await albumId.get();
  if (!albumSnapshot.exists) {
    throw Exception("Album does not exist.");
  }

  // Extract the 'photos' field, ensuring it contains DocumentReferences
  List<dynamic> photoRefs = albumSnapshot.get('photoIds') ?? [];
  if (photoRefs.isEmpty) {
    return []; // Return an empty list if no photos exist in the album
  }

  // Ensure photoRefs are all DocumentReferences
  List<DocumentReference> photoReferences = photoRefs.cast<DocumentReference>();

  // Fetch photo details for each DocumentReference
  List<PhotosRecord> photos = [];
  for (var photoRef in photoReferences) {
    DocumentSnapshot photoSnapshot = await photoRef.get();

    if (photoSnapshot.exists) {
      photos.add(PhotosRecord.fromSnapshot(photoSnapshot));
    }
  }

  return photos;
}
