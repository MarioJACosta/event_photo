import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'album_component_model.dart';
export 'album_component_model.dart';

class AlbumComponentWidget extends StatefulWidget {
  const AlbumComponentWidget({
    super.key,
    required this.albumName,
    this.albumId,
    required this.photoId,
  });

  final String? albumName;
  final DocumentReference? albumId;
  final DocumentReference? photoId;

  @override
  State<AlbumComponentWidget> createState() => _AlbumComponentWidgetState();
}

class _AlbumComponentWidgetState extends State<AlbumComponentWidget> {
  late AlbumComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlbumComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.albumPhotos = await actions.fetchAlbumPhotos(
        widget.albumId,
      );
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await widget.albumId!.update({
            ...mapToFirestore(
              {
                'photoIds': FieldValue.arrayUnion([widget.photoId]),
              },
            ),
          });
          Navigator.pop(context);
        },
        child: Container(
          width: 400.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                color: FlutterFlowTheme.of(context).alternate,
                offset: Offset(
                  0.0,
                  1.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(0.0),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (_model.loading)
                  Lottie.asset(
                    'assets/jsons/Animation_-_1737829990230.json',
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                if (!_model.loading)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      _model.albumPhotos != null &&
                              (_model.albumPhotos)!.isNotEmpty
                          ? _model.albumPhotos!.firstOrNull!.url
                          : '',
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      widget.albumName!,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Icon(
                  Icons.add_circle_outline_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
