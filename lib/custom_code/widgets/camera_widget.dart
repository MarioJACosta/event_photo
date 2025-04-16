// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  int _selectedCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isNotEmpty) {
        _startCamera(_selectedCameraIndex);
      } else {
        print('No cameras available.');
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  void _startCamera(int cameraIndex) {
    if (_controller != null) {
      _controller!.dispose();
    }

    _controller = CameraController(
      _cameras[cameraIndex],
      ResolutionPreset.high,
    );

    _controller?.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    }).catchError((e) {
      print('Error starting camera: $e');
    });
  }

  Future<void> _takePicture() async {
    if (_controller != null && _controller!.value.isInitialized) {
      try {
        final XFile file = await _controller!.takePicture();
        final Uint8List imageBytes = await file.readAsBytes();

        // Convert to FFUploadedFile format
        final FFUploadedFile uploadedFile = FFUploadedFile(
          name: file.name, // Use the picked file name
          bytes: imageBytes,
        );

        // Update FFAppState with the selected image
        FFAppState().update(() {
          FFAppState().takenPhoto64bits = base64Encode(imageBytes);
        });

        // Navigate to the ReviewPhoto page using GoRouter
        GoRouter.of(context).go('/ReviewPhoto');
      } catch (e) {
        print('Error reading image: $e');
      }
    }
  }

  void _switchCamera() {
    if (_cameras.length > 1) {
      _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras.length;
      _startCamera(_selectedCameraIndex);
    } else {
      print('Only one camera available.');
    }
  }

  void _openGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      try {
        // Read the selected image as bytes
        final Uint8List imageBytes = await pickedFile.readAsBytes();

        // Convert to FFUploadedFile format
        final FFUploadedFile uploadedFile = FFUploadedFile(
          name: pickedFile.name, // Use the picked file name
          bytes: imageBytes,
        );

        // Update FFAppState with the selected image
        FFAppState().update(() {
          FFAppState().takenPhoto64bits = base64Encode(imageBytes);
        });

        // Navigate to the ReviewPhoto page using GoRouter
        GoRouter.of(context).go(
          '/ReviewPhoto',
        );
      } catch (e) {
        print('Error reading image: $e');
      }
    } else {
      print('No image selected.');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          // Camera preview
          if (_controller != null && _controller!.value.isInitialized)
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 88), // Leave space for the buttons
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CameraPreview(_controller!),
                  CustomPaint(
                    painter: GridPainter(),
                  ),
                ],
              ),
            ),

          // Action buttons
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: _openGallery,
                  child: Icon(
                    Icons.photo_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: _takePicture,
                  child: Icon(
                    Icons.camera_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 48,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: _switchCamera,
                  child: Icon(
                    Icons.flip_camera_android_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.5) // Grid line color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    // Draw vertical lines
    final double columnWidth = size.width / 3;
    for (int i = 1; i < 3; i++) {
      canvas.drawLine(
        Offset(columnWidth * i, 0),
        Offset(columnWidth * i, size.height),
        paint,
      );
    }

    // Draw horizontal lines
    final double rowHeight = size.height / 3;
    for (int i = 1; i < 3; i++) {
      canvas.drawLine(
        Offset(0, rowHeight * i),
        Offset(size.width, rowHeight * i),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
