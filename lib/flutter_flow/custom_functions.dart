import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

FFUploadedFile stringToImagePath(String filePath) {
  print('Photo Path: $filePath');

  return FFUploadedFile(
    name: filePath.split('/').last, // Extract the file name
    bytes: null, // This remains null since the actual data isn't loaded here
  );
}

FFUploadedFile base64ToFile(
  String base64Img,
  String imageName,
) {
  final bytes = base64Decode(base64Img);

  final file = FFUploadedFile(name: imageName, bytes: bytes);
  return file;
}
