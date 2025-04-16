import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'photo_in_mural_component_widget.dart' show PhotoInMuralComponentWidget;
import 'package:flutter/material.dart';

class PhotoInMuralComponentModel
    extends FlutterFlowModel<PhotoInMuralComponentWidget> {
  ///  Local state fields for this component.

  bool? isLikedComponentState = false;

  int numberLikes = 0;

  bool isPhotoSavedComponentState = false;

  bool reload = false;

  int? numberComments = 0;

  bool loading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in PhotoInMuralComponent widget.
  UsersRecord? photoOwner;
  // Stores action output result for [Custom Action - fetchPhotoDetails] action in PhotoInMuralComponent widget.
  dynamic photoDetail;
  // Stores action output result for [Firestore Query - Query a collection] action in PhotoInMuralComponent widget.
  List<CommentsRecord>? comments;
  // Stores action output result for [Custom Action - isPhotoSaved] action in PhotoInMuralComponent widget.
  dynamic isSaved;
  // Stores action output result for [Firestore Query - Query a collection] action in Image widget.
  LikedPhotosRecord? dislikedPhotoCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in ToggleIcon widget.
  LikedPhotosRecord? dislikedPhoto;
  // Stores action output result for [Firestore Query - Query a collection] action in ToggleIcon widget.
  SavedPhotosRecord? unsavedPhoto;
  // Stores action output result for [Firestore Query - Query a collection] action in ToggleIcon widget.
  AlbumsRecord? albumWithUnsavedPhoto;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
