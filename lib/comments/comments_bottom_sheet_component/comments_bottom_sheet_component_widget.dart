import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/comments/comment_component/comment_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'comments_bottom_sheet_component_model.dart';
export 'comments_bottom_sheet_component_model.dart';

class CommentsBottomSheetComponentWidget extends StatefulWidget {
  const CommentsBottomSheetComponentWidget({
    super.key,
    required this.photoId,
    required this.updateCommentNumber,
  });

  final DocumentReference? photoId;
  final Future Function()? updateCommentNumber;

  @override
  State<CommentsBottomSheetComponentWidget> createState() =>
      _CommentsBottomSheetComponentWidgetState();
}

class _CommentsBottomSheetComponentWidgetState
    extends State<CommentsBottomSheetComponentWidget>
    with TickerProviderStateMixin {
  late CommentsBottomSheetComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentsBottomSheetComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listOfComments = await queryCommentsRecordOnce(
        queryBuilder: (commentsRecord) => commentsRecord
            .where(
              'photo',
              isEqualTo: widget.photoId,
            )
            .orderBy('created_at'),
      );
      _model.listOfCommentsForListView =
          _model.listOfComments!.toList().cast<CommentsRecord>();
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(0.0),
        bottomRight: Radius.circular(0.0),
        topLeft: Radius.circular(0.0),
        topRight: Radius.circular(0.0),
      ),
      child: Container(
        width: 700.0,
        height: 700.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: 400.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '00ywe6nf' /* Comentários */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        hoverColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 400.0,
                  height: 600.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(0.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Builder(
                    builder: (context) {
                      final listComments =
                          _model.listOfCommentsForListView.toList();

                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          12.0,
                          0,
                          12.0,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listComments.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.0),
                        itemBuilder: (context, listCommentsIndex) {
                          final listCommentsItem =
                              listComments[listCommentsIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: wrapWithModel(
                              model: _model.commentComponentModels.getModel(
                                'comment_${listCommentsItem.reference.id}',
                                listCommentsIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: CommentComponentWidget(
                                key: Key(
                                  'Key1s7_${'comment_${listCommentsItem.reference.id}'}',
                                ),
                                comment: listCommentsItem,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: 400.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.99,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.99,
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.99,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onFieldSubmitted: (_) async {
                                    _model.executeCallback1 = true;

                                    var commentsRecordReference =
                                        CommentsRecord.collection.doc();
                                    await commentsRecordReference.set({
                                      ...createCommentsRecordData(
                                        user: currentUserReference,
                                        photo: widget.photoId,
                                        comment: _model.textController.text,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'created_at':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    _model.createdComment =
                                        CommentsRecord.getDocumentFromData({
                                      ...createCommentsRecordData(
                                        user: currentUserReference,
                                        photo: widget.photoId,
                                        comment: _model.textController.text,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'created_at': DateTime.now(),
                                        },
                                      ),
                                    }, commentsRecordReference);

                                    await widget.photoId!.update({
                                      ...mapToFirestore(
                                        {
                                          'comments': FieldValue.increment(1),
                                        },
                                      ),
                                    });
                                    safeSetState(() {
                                      _model.textController?.clear();
                                    });
                                    _model
                                        .insertAtIndexInListOfCommentsForListView(
                                            0, _model.createdComment!);
                                    _model.updatePage(() {});
                                    if (_model.executeCallback1 == true) {
                                      await widget.updateCommentNumber?.call();
                                    }
                                    _model.executeCallback1 = false;

                                    safeSetState(() {});
                                  },
                                  autofocus: true,
                                  textInputAction: TextInputAction.send,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'ahup1w57' /* Adiciona um comentário... */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 8.0, 12.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        letterSpacing: 0.0,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: 8,
                                  minLines: 1,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.send_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      _model.executeCallback2 = true;

                                      var commentsRecordReference =
                                          CommentsRecord.collection.doc();
                                      await commentsRecordReference.set({
                                        ...createCommentsRecordData(
                                          user: currentUserReference,
                                          photo: widget.photoId,
                                          comment: _model.textController.text,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'created_at':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.createdComment1 =
                                          CommentsRecord.getDocumentFromData({
                                        ...createCommentsRecordData(
                                          user: currentUserReference,
                                          photo: widget.photoId,
                                          comment: _model.textController.text,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'created_at': DateTime.now(),
                                          },
                                        ),
                                      }, commentsRecordReference);

                                      await widget.photoId!.update({
                                        ...mapToFirestore(
                                          {
                                            'comments': FieldValue.increment(1),
                                          },
                                        ),
                                      });
                                      safeSetState(() {
                                        _model.textController?.clear();
                                      });
                                      _model
                                          .insertAtIndexInListOfCommentsForListView(
                                              0, _model.createdComment1!);
                                      _model.updatePage(() {});
                                      if (_model.executeCallback2 == true) {
                                        await widget.updateCommentNumber
                                            ?.call();
                                      }
                                      _model.executeCallback1 = false;

                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
