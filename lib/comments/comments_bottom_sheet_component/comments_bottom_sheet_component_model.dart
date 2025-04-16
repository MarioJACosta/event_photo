import '/backend/backend.dart';
import '/comments/comment_component/comment_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comments_bottom_sheet_component_widget.dart'
    show CommentsBottomSheetComponentWidget;
import 'package:flutter/material.dart';

class CommentsBottomSheetComponentModel
    extends FlutterFlowModel<CommentsBottomSheetComponentWidget> {
  ///  Local state fields for this component.

  bool reload = false;

  List<CommentsRecord> listOfCommentsForListView = [];
  void addToListOfCommentsForListView(CommentsRecord item) =>
      listOfCommentsForListView.add(item);
  void removeFromListOfCommentsForListView(CommentsRecord item) =>
      listOfCommentsForListView.remove(item);
  void removeAtIndexFromListOfCommentsForListView(int index) =>
      listOfCommentsForListView.removeAt(index);
  void insertAtIndexInListOfCommentsForListView(
          int index, CommentsRecord item) =>
      listOfCommentsForListView.insert(index, item);
  void updateListOfCommentsForListViewAtIndex(
          int index, Function(CommentsRecord) updateFn) =>
      listOfCommentsForListView[index] =
          updateFn(listOfCommentsForListView[index]);

  bool executeCallback1 = false;

  bool executeCallback2 = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in CommentsBottomSheetComponent widget.
  List<CommentsRecord>? listOfComments;
  // Models for CommentComponent dynamic component.
  late FlutterFlowDynamicModels<CommentComponentModel> commentComponentModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  CommentsRecord? createdComment;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  CommentsRecord? createdComment1;

  @override
  void initState(BuildContext context) {
    commentComponentModels =
        FlutterFlowDynamicModels(() => CommentComponentModel());
  }

  @override
  void dispose() {
    commentComponentModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
