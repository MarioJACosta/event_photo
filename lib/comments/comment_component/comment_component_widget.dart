import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'comment_component_model.dart';
export 'comment_component_model.dart';

class CommentComponentWidget extends StatefulWidget {
  const CommentComponentWidget({
    super.key,
    required this.comment,
  });

  final CommentsRecord? comment;

  @override
  State<CommentComponentWidget> createState() => _CommentComponentWidgetState();
}

class _CommentComponentWidgetState extends State<CommentComponentWidget> {
  late CommentComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.cmmentOwner = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: widget.comment?.user?.id,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.reload = !_model.reload;
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
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: ClipOval(
                  child: Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: 25.0,
                      height: 25.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        valueOrDefault<String>(
                          _model.cmmentOwner?.photoUrl != null &&
                                  _model.cmmentOwner?.photoUrl != ''
                              ? _model.cmmentOwner?.photoUrl
                              : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/event-photo-g0cgg3/assets/r6czi752hwnu/no_avatar.png',
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/event-photo-g0cgg3/assets/r6czi752hwnu/no_avatar.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        _model.cmmentOwner?.displayName,
                        'Nome',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        dateTimeFormat(
                          "relative",
                          widget.comment?.createdAt,
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        'data',
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'Plus Jakarta Sans',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
          Text(
            valueOrDefault<String>(
              widget.comment?.comment,
              'Comentario',
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Plus Jakarta Sans',
                  letterSpacing: 0.0,
                ),
          ),
          Divider(
            height: 1.0,
            thickness: 1.0,
            indent: 16.0,
            endIndent: 16.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ].divide(SizedBox(height: 8.0)),
      ),
    );
  }
}
