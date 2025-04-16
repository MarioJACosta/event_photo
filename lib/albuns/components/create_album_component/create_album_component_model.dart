import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_album_component_widget.dart' show CreateAlbumComponentWidget;
import 'package:flutter/material.dart';

class CreateAlbumComponentModel
    extends FlutterFlowModel<CreateAlbumComponentWidget> {
  ///  Local state fields for this component.

  bool reload = false;

  bool loading = true;

  bool disabledButton = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in CreateAlbumComponent widget.
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
