import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img; // Correct import for image package
import 'package:image_picker/image_picker.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

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

  // Function to get the dimensions of the image
  Future<Size> _getImageSize(Uint8List imageBytes) async {
    final image = img.decodeImage(Uint8List.fromList(imageBytes));
    if (image == null) {
      throw Exception('Failed to decode image');
    }
    return Size(image.width.toDouble(), image.height.toDouble());
  }

  Future<void> _takePicture() async {
    if (_controller != null && _controller!.value.isInitialized) {
      try {
        final XFile file = await _controller!.takePicture();
        final Uint8List imageBytes = await file.readAsBytes();

        // Get the actual camera resolution
        final double cameraWidth = _controller!.value.previewSize!.width;
        final double cameraHeight = _controller!.value.previewSize!.height;

        // Get image dimensions to calculate the grid offsets
        Size imageSize = await _getImageSize(imageBytes);

        // Define grid parameters (adjusting for mobile screen size)
        double gridWidth =
            400.0; // Grid width (can be adjusted based on design)
        double gridHeight =
            500.0; // Grid height (can be adjusted based on design)

        // Calculate the center of the screen to center the grid
        double offsetX = (imageSize.width - gridWidth) / 2;
        double offsetY = (imageSize.height - gridHeight) / 2;

        // Scale the crop dimensions based on the camera preview size
        double scaleX = imageSize.width / cameraWidth;
        double scaleY = imageSize.height / cameraHeight;

        // Adjust the crop area to match the visible grid area on the preview
        double adjustedOffsetX = offsetX * scaleX;
        double adjustedOffsetY = offsetY * scaleY;
        double adjustedGridWidth = gridWidth * scaleX;
        double adjustedGridHeight = gridHeight * scaleY;

        // Crop the image based on the calculated and scaled values
        final croppedBytes = await _cropImage(imageBytes, adjustedOffsetX,
            adjustedOffsetY, adjustedGridWidth, adjustedGridHeight);

        // // Save the cropped image
        // FFAppState().update(() {
        //   FFAppState().takenPhoto64bits = base64Encode(croppedBytes);
        // });

        // Save the original image
        FFAppState().update(() {
          FFAppState().takenPhoto64bits = base64Encode(imageBytes);
        });

        // Navigate to the ReviewPhoto page using GoRouter (or wherever you want to display the image)
        GoRouter.of(context).go('/ReviewPhoto');
      } catch (e) {
        print('Error reading image: $e');
      }
    }
  }

  Future<Uint8List> _cropImage(Uint8List imageBytes, double offsetX,
      double offsetY, double gridWidth, double gridHeight) async {
    // Decode the image to get the pixel data
    final image = img.decodeImage(Uint8List.fromList(imageBytes));

    // Crop the image based on the grid (offsetX, offsetY) and grid dimensions (gridWidth, gridHeight)
    final croppedImage = img.copyCrop(
      image!,
      x: offsetX.toInt(), // Left edge of the crop area
      y: offsetY.toInt(), // Top edge of the crop area
      width: gridWidth.toInt(), // Width of the crop area
      height: gridHeight.toInt(), // Height of the crop area
    );

    // Return the cropped image as a byte array (JPEG format)
    return Uint8List.fromList(img.encodeJpg(croppedImage));
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
              padding:
                  const EdgeInsets.only(bottom: 88), // Leave space for buttons
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CameraPreview(_controller!), // Live camera feed
                  // CustomPaint(
                  //   painter: GridPainter(), // Draw grid on top of the preview
                  // ),
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
    // Define grid size (400px x 500px)
    double gridWidth = 400.0;
    double gridHeight = 500.0;

    // Calculate the center of the screen to center the grid
    double offsetX = (size.width - gridWidth) / 2;
    double offsetY = (size.height - gridHeight) / 2;

    // Paint for the rectangles
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.6); // Semi-transparent black paint

    // 1. Top rectangle (from the top to the grid's top)
    final topRect = Rect.fromLTRB(0, 0, size.width, offsetY);
    canvas.drawRect(topRect, paint);

    // 2. Bottom rectangle (from the bottom of the grid to the screen's bottom)
    final bottomRect =
        Rect.fromLTRB(0, offsetY + gridHeight, size.width, size.height);
    canvas.drawRect(bottomRect, paint);

    // Draw the grid lines (3x3 grid inside the 400x500 box)
    final gridLinePaint = Paint()
      ..color = Colors.white.withOpacity(0.5) // Grid line color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final double columnWidth = gridWidth / 3;
    for (int i = 1; i < 3; i++) {
      canvas.drawLine(
        Offset(offsetX + i * columnWidth, offsetY),
        Offset(offsetX + i * columnWidth, offsetY + gridHeight),
        gridLinePaint,
      );
    }

    final double rowHeight = gridHeight / 3;
    for (int i = 1; i < 3; i++) {
      canvas.drawLine(
        Offset(offsetX, offsetY + i * rowHeight),
        Offset(offsetX + gridWidth, offsetY + i * rowHeight),
        gridLinePaint,
      );
    }

    // Draw border around the grid
    final borderPaint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 2.0;
    canvas.drawRect(
      Rect.fromLTWH(offsetX, offsetY, gridWidth, gridHeight),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
