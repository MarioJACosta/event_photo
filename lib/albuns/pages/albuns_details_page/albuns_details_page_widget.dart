import '/albuns/components/edit_album_component/edit_album_component_widget.dart';
import '/backend/backend.dart';
import '/components/nav_bar_component/nav_bar_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'albuns_details_page_model.dart';
export 'albuns_details_page_model.dart';

class AlbunsDetailsPageWidget extends StatefulWidget {
  const AlbunsDetailsPageWidget({
    super.key,
    required this.album,
  });

  final AlbumsRecord? album;

  static String routeName = 'AlbunsDetailsPage';
  static String routePath = '/albunsDetails';

  @override
  State<AlbunsDetailsPageWidget> createState() =>
      _AlbunsDetailsPageWidgetState();
}

class _AlbunsDetailsPageWidgetState extends State<AlbunsDetailsPageWidget> {
  late AlbunsDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlbunsDetailsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.albumPhotosList = await actions.fetchAlbumPhotos(
        widget.album?.reference,
      );
      _model.reload = !_model.reload;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 400.0,
              decoration: BoxDecoration(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.safePop();
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.album?.name,
                                      'Nome',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Urbanist',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 4.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.more_vert_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: 300.0,
                                          child: EditAlbumComponentWidget(
                                            albumName: widget.album!.name,
                                            albumId: widget.album?.reference,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 65.0, 0.0, 50.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Visibility(
                          visible: _model.reload == true,
                          child: Builder(
                            builder: (context) {
                              final albumPhotosListGridView =
                                  _model.albumPhotosList!.toList();

                              return GridView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  24.0,
                                  0,
                                  24.0,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 1.0,
                                  mainAxisSpacing: 1.0,
                                  childAspectRatio: 0.75,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: albumPhotosListGridView.length,
                                itemBuilder:
                                    (context, albumPhotosListGridViewIndex) {
                                  final albumPhotosListGridViewItem =
                                      albumPhotosListGridView[
                                          albumPhotosListGridViewIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        PhotoDetailPageWidget.routeName,
                                        queryParameters: {
                                          'photos': serializeParam(
                                            _model.albumPhotosList,
                                            ParamType.Document,
                                            isList: true,
                                          ),
                                          'index': serializeParam(
                                            albumPhotosListGridViewIndex,
                                            ParamType.int,
                                          ),
                                          'albumName': serializeParam(
                                            widget.album?.name,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'photos': _model.albumPhotosList,
                                        },
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.network(
                                        albumPhotosListGridViewItem.url,
                                        width: 250.0,
                                        height: 250.0,
                                        fit: BoxFit.cover,
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
                      child: wrapWithModel(
                        model: _model.navBarComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NavBarComponentWidget(
                          selectedPageIndex: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
