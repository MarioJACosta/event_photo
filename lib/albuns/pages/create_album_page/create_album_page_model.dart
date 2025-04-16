import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_album_page_widget.dart' show CreateAlbumPageWidget;
import 'package:flutter/material.dart';

class CreateAlbumPageModel extends FlutterFlowModel<CreateAlbumPageWidget> {
  ///  Local state fields for this page.

  bool reload = false;

  bool loading = true;

  bool disabledButton = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in CreateAlbumPage widget.
  PhotosRecord? photo;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
