import '/components/nav_bar_component/nav_bar_component_widget.dart';
import '/components/photo_in_mural_component/photo_in_mural_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'photo_detail_page_widget.dart' show PhotoDetailPageWidget;
import 'package:flutter/material.dart';

class PhotoDetailPageModel extends FlutterFlowModel<PhotoDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for PhotoInMuralComponent dynamic component.
  late FlutterFlowDynamicModels<PhotoInMuralComponentModel>
      photoInMuralComponentModels;
  // Model for NavBarComponent component.
  late NavBarComponentModel navBarComponentModel;

  @override
  void initState(BuildContext context) {
    photoInMuralComponentModels =
        FlutterFlowDynamicModels(() => PhotoInMuralComponentModel());
    navBarComponentModel = createModel(context, () => NavBarComponentModel());
  }

  @override
  void dispose() {
    photoInMuralComponentModels.dispose();
    navBarComponentModel.dispose();
  }
}
