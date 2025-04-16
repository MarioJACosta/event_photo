import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'review_photo_page_widget.dart' show ReviewPhotoPageWidget;
import 'package:flutter/material.dart';

class ReviewPhotoPageModel extends FlutterFlowModel<ReviewPhotoPageWidget> {
  ///  Local state fields for this page.

  String? filteredImage = '';

  bool showFilters = false;

  int selectedIndex = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - applyFilterToImage] action in NoFilterContainer widget.
  String? filteredImageOriginaActionOutput;
  // Stores action output result for [Custom Action - applyFilterToImage] action in BWContainer widget.
  String? filteredImageGrayScaleActionOutput;
  // Stores action output result for [Custom Action - applyFilterToImage] action in SepiaContainer widget.
  String? filteredImageSepiaActionOutput;
  // Stores action output result for [Custom Action - applyFilterToImage] action in InvertContainer widget.
  String? filteredImageInvertActionOutput;
  // Stores action output result for [Custom Action - applyFilterToImage] action in WarmContainer widget.
  String? filteredImageWarmActionOutput;
  // Stores action output result for [Custom Action - applyFilterToImage] action in ColdContainer widget.
  String? filteredImageColdActionOutput;
  // Stores action output result for [Custom Action - applyFilterToImage] action in VibrantContainer widget.
  String? filteredImageVibrantActionOutput;
  // Stores action output result for [Custom Action - applyFilterToImage] action in FadeContainer widget.
  String? filteredImageFadeActionOutput;
  // Stores action output result for [Custom Action - applyFilterToImage] action in RetroContainer widget.
  String? filteredImageRetroActionOutput;
  // Stores action output result for [Custom Action - applyFilterToImage] action in MutedContainer widget.
  String? filteredImageMutedActionOutput;
  // Stores action output result for [Custom Action - applyFilterToImage] action in PurpleContainer widget.
  String? filteredImagePurpleActionOutput;
  // Stores action output result for [Custom Action - applyFilterToImage] action in PosterContainer widget.
  String? filteredImagePosterActionOutput;
  // Stores action output result for [Custom Action - applyFilterToImage] action in OrangeTealContainer widget.
  String? filteredImageOrangeTealActionOutput;
  // Stores action output result for [Custom Action - applyFilterToImage] action in OldTVContainer widget.
  String? filteredImageOldTVActionOutput;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
