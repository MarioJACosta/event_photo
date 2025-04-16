import '/backend/backend.dart';
import '/components/nav_bar_component/nav_bar_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'albuns_details_page_widget.dart' show AlbunsDetailsPageWidget;
import 'package:flutter/material.dart';

class AlbunsDetailsPageModel extends FlutterFlowModel<AlbunsDetailsPageWidget> {
  ///  Local state fields for this page.

  bool reload = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - fetchAlbumPhotos] action in AlbunsDetailsPage widget.
  List<PhotosRecord>? albumPhotosList;
  // Model for NavBarComponent component.
  late NavBarComponentModel navBarComponentModel;

  @override
  void initState(BuildContext context) {
    navBarComponentModel = createModel(context, () => NavBarComponentModel());
  }

  @override
  void dispose() {
    navBarComponentModel.dispose();
  }
}
