import '/flutter_flow/flutter_flow_util.dart';
import '/profile/edit_profile_component/edit_profile_component_widget.dart';
import '/index.dart';
import 'create_profile_page_widget.dart' show CreateProfilePageWidget;
import 'package:flutter/material.dart';

class CreateProfilePageModel extends FlutterFlowModel<CreateProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EditProfileComponent component.
  late EditProfileComponentModel editProfileComponentModel;

  @override
  void initState(BuildContext context) {
    editProfileComponentModel =
        createModel(context, () => EditProfileComponentModel());
  }

  @override
  void dispose() {
    editProfileComponentModel.dispose();
  }
}
