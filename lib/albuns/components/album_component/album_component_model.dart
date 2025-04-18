import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'album_component_widget.dart' show AlbumComponentWidget;
import 'package:flutter/material.dart';

class AlbumComponentModel extends FlutterFlowModel<AlbumComponentWidget> {
  ///  Local state fields for this component.

  bool reload = false;

  bool loading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - fetchAlbumPhotos] action in AlbumComponent widget.
  List<PhotosRecord>? albumPhotos;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
