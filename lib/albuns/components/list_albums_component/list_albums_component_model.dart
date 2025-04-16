import '/albuns/components/album_component/album_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_albums_component_widget.dart' show ListAlbumsComponentWidget;
import 'package:flutter/material.dart';

class ListAlbumsComponentModel
    extends FlutterFlowModel<ListAlbumsComponentWidget> {
  ///  Local state fields for this component.

  bool reload = false;

  ///  State fields for stateful widgets in this component.

  // Models for AlbumComponent dynamic component.
  late FlutterFlowDynamicModels<AlbumComponentModel> albumComponentModels;

  @override
  void initState(BuildContext context) {
    albumComponentModels =
        FlutterFlowDynamicModels(() => AlbumComponentModel());
  }

  @override
  void dispose() {
    albumComponentModels.dispose();
  }
}
