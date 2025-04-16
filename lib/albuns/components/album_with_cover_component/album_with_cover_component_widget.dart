import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'album_with_cover_component_model.dart';
export 'album_with_cover_component_model.dart';

class AlbumWithCoverComponentWidget extends StatefulWidget {
  const AlbumWithCoverComponentWidget({
    super.key,
    required this.albumDocument,
    required this.updateAlbumListState,
  });

  final AlbumsRecord? albumDocument;
  final Future Function(dynamic albumReference)? updateAlbumListState;

  @override
  State<AlbumWithCoverComponentWidget> createState() =>
      _AlbumWithCoverComponentWidgetState();
}

class _AlbumWithCoverComponentWidgetState
    extends State<AlbumWithCoverComponentWidget> {
  late AlbumWithCoverComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlbumWithCoverComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.albumPhotosActionOutput = await actions.fetchAlbumPhotos(
        widget.albumDocument?.reference,
      );
      _model.loadingComponentState = false;
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
    return Align(
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            AlbunsDetailsPageWidget.routeName,
            queryParameters: {
              'album': serializeParam(
                widget.albumDocument,
                ParamType.Document,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'album': widget.albumDocument,
            },
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: Container(
            width: 400.0,
            height: 250.0,
            constraints: BoxConstraints(
              maxWidth: 250.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(0.0),
            ),
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Stack(
              children: [
                if (!_model.loadingComponentState)
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        _model.albumPhotosActionOutput?.firstOrNull != null
                            ? _model.albumPhotosActionOutput!.firstOrNull!.url
                            : '',
                        width: 220.0,
                        height: 206.02,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 6.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 20.0,
                      buttonSize: 40.0,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      icon: Icon(
                        Icons.delete_outlined,
                        color: FlutterFlowTheme.of(context).error,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        await widget.albumDocument!.reference.delete();
                        await widget.updateAlbumListState?.call(
                          widget.albumDocument!,
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.albumDocument?.name,
                        'Nome',
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                if (_model.loadingComponentState)
                  Lottie.asset(
                    'assets/jsons/Animation_-_1737829990230.json',
                    width: 220.0,
                    height: 206.0,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
