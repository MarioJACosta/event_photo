import '/backend/backend.dart';
import '/components/nav_bar_component/nav_bar_component_widget.dart';
import '/components/photo_in_mural_component/photo_in_mural_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, PhotosRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

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
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    photoInMuralComponentModels.dispose();
    navBarComponentModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, PhotosRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, PhotosRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, PhotosRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryPhotosRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
