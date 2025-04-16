// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:image/image.dart' as img;
import 'dart:convert';
import 'dart:typed_data';

Future<String> applyFilterToImage(
  String base64Image,
  String filterType,
) async {
  // Add your function code here!
  final Uint8List imageBytes = base64Decode(base64Image);
  final img.Image? originalImage = img.decodeImage(imageBytes);

  if (originalImage == null) return base64Image;

  late img.Image filtered;

  switch (filterType) {
    case 'grayscale':
      filtered = img.grayscale(originalImage);
      break;
    case 'sepia':
      filtered = img.sepia(originalImage);
      break;
    case 'invert':
      filtered = img.invert(originalImage);
      break;
    case 'warm':
      filtered = img.adjustColor(
        originalImage,
        brightness: 1.1, // Slightly brighter
        contrast: 1.1, // Slightly more contrast
        saturation: 1.2, // More vibrant colors
        hue: -10, // Shift towards red/yellow
      );
      break;
    case 'cold':
      filtered = img.adjustColor(
        originalImage,
        brightness: 0.95, // Slightly darker
        contrast: 1.05, // Slightly more contrast
        saturation: 0.9, // Slightly desaturated
        hue: 10, // Shift towards blue
      );
      break;
    case 'vibrant':
      filtered = img.adjustColor(originalImage, saturation: 1.4, contrast: 1.2);
      break;
    case 'fade':
      filtered = img.adjustColor(originalImage,
          contrast: 0.9, saturation: 0.7, brightness: 1.05);
      break;
    case 'retro':
      filtered = img.adjustColor(originalImage,
          contrast: 1.3, saturation: 1.1, hue: 15);
      break;
    case 'muted':
      filtered =
          img.adjustColor(originalImage, saturation: 0.6, contrast: 0.85);
      break;
    case 'purple':
      filtered = img.adjustColor(originalImage, hue: 40, saturation: 1.2);
      break;
    case 'poster':
      filtered = img.billboard(originalImage, grid: 8, amount: 1);
      break;
    case 'orange_teal':
      filtered = img.adjustColor(originalImage,
          contrast: 1.2, saturation: 1.1, hue: -5);
      break;
    case 'old_tv':
      filtered = oldTVEffect(originalImage);
      break;
    default:
      return base64Image;
  }

  final Uint8List resultBytes = Uint8List.fromList(img.encodeJpg(filtered));
  return base64Encode(resultBytes);
}

img.Image oldTVEffect(img.Image image) {
  final filtered = img.Image.from(image);

  for (int y = 0; y < filtered.height; y++) {
    for (int x = 0; x < filtered.width; x++) {
      final pixel = filtered.getPixel(x, y);
      final r = (pixel.r * 0.7).toInt();
      final g = (pixel.g * 0.7).toInt();
      final b = (pixel.b * 0.7).toInt();

      // Add horizontal scanlines every 4 rows
      final lineDarken = (y % 4 == 0) ? 40 : 0;

      filtered.setPixelRgba(
        x,
        y,
        (r - lineDarken).clamp(0, 255),
        (g - lineDarken).clamp(0, 255),
        (b - lineDarken).clamp(0, 255),
        pixel.a,
      );
    }
  }

  return filtered;
}
