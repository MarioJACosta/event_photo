import '/flutter_flow/flutter_flow_util.dart';
import 'edit_album_component_widget.dart' show EditAlbumComponentWidget;
import 'package:flutter/material.dart';

class EditAlbumComponentModel
    extends FlutterFlowModel<EditAlbumComponentWidget> {
  ///  Local state fields for this component.

  bool hideList = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for albumName widget.
  FocusNode? albumNameFocusNode;
  TextEditingController? albumNameTextController;
  String? Function(BuildContext, String?)? albumNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    albumNameFocusNode?.dispose();
    albumNameTextController?.dispose();
  }
}
