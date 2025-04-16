import '/backend/backend.dart';
import '/components/nav_bar_component/nav_bar_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  Local state fields for this page.

  bool isLightMode = false;

  List<PhotosRecord> listPhotosState = [];
  void addToListPhotosState(PhotosRecord item) => listPhotosState.add(item);
  void removeFromListPhotosState(PhotosRecord item) =>
      listPhotosState.remove(item);
  void removeAtIndexFromListPhotosState(int index) =>
      listPhotosState.removeAt(index);
  void insertAtIndexInListPhotosState(int index, PhotosRecord item) =>
      listPhotosState.insert(index, item);
  void updateListPhotosStateAtIndex(
          int index, Function(PhotosRecord) updateFn) =>
      listPhotosState[index] = updateFn(listPhotosState[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ProfilePage widget.
  List<PhotosRecord>? listPhotos;
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
