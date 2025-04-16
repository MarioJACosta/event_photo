import '/albuns/components/list_albums_component/list_albums_component_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/comments/comments_bottom_sheet_component/comments_bottom_sheet_component_widget.dart';
import '/components/description_component/description_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'photo_in_mural_component_model.dart';
export 'photo_in_mural_component_model.dart';

class PhotoInMuralComponentWidget extends StatefulWidget {
  const PhotoInMuralComponentWidget({
    super.key,
    required this.photo,
  });

  final PhotosRecord? photo;

  @override
  State<PhotoInMuralComponentWidget> createState() =>
      _PhotoInMuralComponentWidgetState();
}

class _PhotoInMuralComponentWidgetState
    extends State<PhotoInMuralComponentWidget> {
  late PhotoInMuralComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoInMuralComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.photoOwner = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: widget.photo?.owner?.id,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.photoDetail = await actions.fetchPhotoDetails(
        widget.photo!.reference,
        _model.photoOwner!.reference,
      );
      _model.isLikedComponentState = _model.photoDetail;
      _model.numberLikes = valueOrDefault<int>(
        widget.photo?.likes,
        0,
      );
      _model.numberComments = valueOrDefault<int>(
        widget.photo?.comments,
        0,
      );
      _model.comments = await queryCommentsRecordOnce(
        queryBuilder: (commentsRecord) => commentsRecord
            .where(
              'photo',
              isEqualTo: widget.photo?.reference,
            )
            .orderBy('created_at'),
        limit: 25,
      );
      _model.isSaved = await actions.isPhotoSaved(
        widget.photo!.reference,
        currentUserReference!,
      );
      _model.isPhotoSavedComponentState = _model.isSaved!;
      _model.loading = false;
      safeSetState(() {});
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: double.infinity,
          height: 55.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: ClipOval(
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 35.0,
                        height: 35.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          valueOrDefault<String>(
                            _model.photoOwner?.photoUrl != null &&
                                    _model.photoOwner?.photoUrl != ''
                                ? _model.photoOwner?.photoUrl
                                : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/event-photo-g0cgg3/assets/r6czi752hwnu/no_avatar.png',
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/event-photo-g0cgg3/assets/r6czi752hwnu/no_avatar.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          _model.photoOwner?.displayName,
                          'Nome',
                        ),
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 500.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Stack(
            children: [
              if (!_model.loading)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onDoubleTap: () async {
                    if (_model.isLikedComponentState == false) {
                      // Like photo

                      await LikedPhotosRecord.collection.doc().set({
                        ...createLikedPhotosRecordData(
                          user: currentUserReference,
                          photo: widget.photo?.reference,
                        ),
                        ...mapToFirestore(
                          {
                            'created_at': FieldValue.serverTimestamp(),
                          },
                        ),
                      });
                      // Update Likes in photo

                      await widget.photo!.reference.update({
                        ...mapToFirestore(
                          {
                            'likes': FieldValue.increment(1),
                          },
                        ),
                      });
                      _model.numberLikes = _model.numberLikes + 1;
                      _model.isLikedComponentState = true;
                    } else {
                      // Dislike photo
                      _model.dislikedPhotoCopy =
                          await queryLikedPhotosRecordOnce(
                        queryBuilder: (likedPhotosRecord) => likedPhotosRecord
                            .where(
                              'photo',
                              isEqualTo: widget.photo?.reference,
                            )
                            .where(
                              'user',
                              isEqualTo: currentUserReference,
                            ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      unawaited(
                        () async {
                          await _model.dislikedPhotoCopy!.reference.delete();
                        }(),
                      );
                      // Update Likes in photo
                      unawaited(
                        () async {
                          await widget.photo!.reference.update({
                            ...mapToFirestore(
                              {
                                'likes': FieldValue.increment(-(1)),
                              },
                            ),
                          });
                        }(),
                      );
                      _model.numberLikes = _model.numberLikes + -1;
                      _model.isLikedComponentState = false;
                    }

                    _model.reload = !_model.reload;
                    safeSetState(() {});

                    safeSetState(() {});
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.network(
                      valueOrDefault<String>(
                        widget.photo?.url != null && widget.photo?.url != ''
                            ? widget.photo?.url
                            : 'https://firebasestorage.googleapis.com/v0/b/event-photo-04072025.appspot.com/o/admin%2Fassets%2Fno_picture(2).png?alt=media&token=7a0e679d-8b75-488d-a4d1-ef83d07fc4f4',
                        'https://firebasestorage.googleapis.com/v0/b/event-photo-04072025.appspot.com/o/admin%2Fassets%2Fno_picture(2).png?alt=media&token=7a0e679d-8b75-488d-a4d1-ef83d07fc4f4',
                      ),
                      width: double.infinity,
                      height: 500.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              if (_model.loading)
                Lottie.asset(
                  'assets/jsons/Animation_-_1737829990230.json',
                  width: 400.0,
                  height: 500.0,
                  fit: BoxFit.contain,
                  animate: true,
                ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: ToggleIcon(
                                onPressed: () async {
                                  safeSetState(() =>
                                      _model.isLikedComponentState =
                                          !_model.isLikedComponentState!);
                                  if (_model.isLikedComponentState!) {
                                    // Like photo

                                    await LikedPhotosRecord.collection
                                        .doc()
                                        .set({
                                      ...createLikedPhotosRecordData(
                                        user: currentUserReference,
                                        photo: widget.photo?.reference,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'created_at':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    // Update Likes in photo

                                    await widget.photo!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'likes': FieldValue.increment(1),
                                        },
                                      ),
                                    });
                                    _model.numberLikes = _model.numberLikes + 1;
                                  } else {
                                    // Dislike photo
                                    _model.dislikedPhoto =
                                        await queryLikedPhotosRecordOnce(
                                      queryBuilder: (likedPhotosRecord) =>
                                          likedPhotosRecord
                                              .where(
                                                'photo',
                                                isEqualTo:
                                                    widget.photo?.reference,
                                              )
                                              .where(
                                                'user',
                                                isEqualTo: currentUserReference,
                                              ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    unawaited(
                                      () async {
                                        await _model.dislikedPhoto!.reference
                                            .delete();
                                      }(),
                                    );
                                    // Update Likes in photo
                                    unawaited(
                                      () async {
                                        await widget.photo!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'likes':
                                                  FieldValue.increment(-(1)),
                                            },
                                          ),
                                        });
                                      }(),
                                    );
                                    _model.numberLikes =
                                        _model.numberLikes + -1;
                                  }

                                  _model.reload = !_model.reload;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                value: _model.isLikedComponentState!,
                                onIcon: Icon(
                                  Icons.favorite_rounded,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 20.0,
                                ),
                                offIcon: Icon(
                                  Icons.favorite_border,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  _model.numberLikes.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.9,
                                          child:
                                              CommentsBottomSheetComponentWidget(
                                            photoId: widget.photo!.reference,
                                            updateCommentNumber: () async {
                                              _model.numberComments =
                                                  _model.numberComments! + 1;
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.comment,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 18.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.9,
                                          child:
                                              CommentsBottomSheetComponentWidget(
                                            photoId: widget.photo!.reference,
                                            updateCommentNumber: () async {
                                              _model.numberComments =
                                                  _model.numberComments! + 1;
                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Text(
                                  valueOrDefault<String>(
                                    _model.numberComments?.toString(),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ToggleIcon(
                        onPressed: () async {
                          safeSetState(() => _model.isPhotoSavedComponentState =
                              !_model.isPhotoSavedComponentState);
                          if (_model.isPhotoSavedComponentState) {
                            // Save photo

                            await SavedPhotosRecord.collection.doc().set({
                              ...createSavedPhotosRecordData(
                                user: currentUserReference,
                                photo: widget.photo?.reference,
                              ),
                              ...mapToFirestore(
                                {
                                  'created_at': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height: 500.0,
                                    child: ListAlbumsComponentWidget(
                                      photoId: widget.photo?.reference,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            _model.isPhotoSavedComponentState = true;
                            _model.updatePage(() {});
                          } else {
                            // Unsave photo
                            _model.unsavedPhoto =
                                await querySavedPhotosRecordOnce(
                              queryBuilder: (savedPhotosRecord) =>
                                  savedPhotosRecord
                                      .where(
                                        'photo',
                                        isEqualTo: widget.photo?.reference,
                                      )
                                      .where(
                                        'user',
                                        isEqualTo: currentUserReference,
                                      ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            unawaited(
                              () async {
                                await _model.unsavedPhoto!.reference.delete();
                              }(),
                            );
                            _model.albumWithUnsavedPhoto =
                                await queryAlbumsRecordOnce(
                              queryBuilder: (albumsRecord) =>
                                  albumsRecord.where(
                                'photoIds',
                                arrayContains: widget.photo?.reference,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            await _model.albumWithUnsavedPhoto!.reference
                                .update({
                              ...mapToFirestore(
                                {
                                  'photoIds': FieldValue.arrayRemove(
                                      [widget.photo?.reference]),
                                },
                              ),
                            });
                            _model.isPhotoSavedComponentState = false;
                            _model.updatePage(() {});
                          }

                          safeSetState(() {});
                        },
                        value: _model.isPhotoSavedComponentState,
                        onIcon: Icon(
                          Icons.bookmark_border,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 21.0,
                        ),
                        offIcon: Icon(
                          Icons.bookmark_border,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 21.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            _model.photoOwner?.displayName,
                            'Nome',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Plus Jakarta Sans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      if (widget.photo?.description != null &&
                          widget.photo?.description != '')
                        Align(
                          alignment: AlignmentDirectional(-1.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height: 250.0,
                                        child: DescriptionComponentWidget(
                                          ownerName:
                                              _model.photoOwner!.displayName,
                                          decription:
                                              widget.photo!.description,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Text(
                                valueOrDefault<String>(
                                  widget.photo?.description,
                                  'Descricao',
                                ).maybeHandleOverflow(
                                  maxChars: 30,
                                  replacement: '…',
                                ),
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: Container(
                            height: 600.0,
                            child: CommentsBottomSheetComponentWidget(
                              photoId: widget.photo!.reference,
                              updateCommentNumber: () async {
                                _model.numberComments =
                                    _model.numberComments! + 1;
                                safeSetState(() {});
                              },
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Text(
                    _model.numberComments == 0
                        ? 'Se o primeiro a comentar'
                        : 'Ver todos os ${_model.numberComments?.toString()} comentarios',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
