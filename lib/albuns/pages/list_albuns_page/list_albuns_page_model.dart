import '/albuns/components/album_with_cover_component/album_with_cover_component_widget.dart';
import '/backend/backend.dart';
import '/components/nav_bar_component/nav_bar_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'list_albuns_page_widget.dart' show ListAlbunsPageWidget;
import 'package:flutter/material.dart';

class ListAlbunsPageModel extends FlutterFlowModel<ListAlbunsPageWidget> {
  ///  Local state fields for this page.

  bool reload = false;

  List<AlbumsRecord> albunsListState = [];
  void addToAlbunsListState(AlbumsRecord item) => albunsListState.add(item);
  void removeFromAlbunsListState(AlbumsRecord item) =>
      albunsListState.remove(item);
  void removeAtIndexFromAlbunsListState(int index) =>
      albunsListState.removeAt(index);
  void insertAtIndexInAlbunsListState(int index, AlbumsRecord item) =>
      albunsListState.insert(index, item);
  void updateAlbunsListStateAtIndex(
          int index, Function(AlbumsRecord) updateFn) =>
      albunsListState[index] = updateFn(albunsListState[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ListAlbunsPage widget.
  List<AlbumsRecord>? albunsListActionOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in GridView widget.
  List<AlbumsRecord>? albunsListRefreshed;
  // Models for AlbumWithCoverComponent dynamic component.
  late FlutterFlowDynamicModels<AlbumWithCoverComponentModel>
      albumWithCoverComponentModels;
  // Model for NavBarComponent component.
  late NavBarComponentModel navBarComponentModel;

  @override
  void initState(BuildContext context) {
    albumWithCoverComponentModels =
        FlutterFlowDynamicModels(() => AlbumWithCoverComponentModel());
    navBarComponentModel = createModel(context, () => NavBarComponentModel());
  }

  @override
  void dispose() {
    albumWithCoverComponentModels.dispose();
    navBarComponentModel.dispose();
  }
}
