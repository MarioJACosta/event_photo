import '/albuns/components/album_with_cover_component/album_with_cover_component_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_component/nav_bar_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'list_albuns_page_model.dart';
export 'list_albuns_page_model.dart';

class ListAlbunsPageWidget extends StatefulWidget {
  const ListAlbunsPageWidget({super.key});

  static String routeName = 'ListAlbunsPage';
  static String routePath = '/listAlbuns';

  @override
  State<ListAlbunsPageWidget> createState() => _ListAlbunsPageWidgetState();
}

class _ListAlbunsPageWidgetState extends State<ListAlbunsPageWidget> {
  late ListAlbunsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListAlbunsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.albunsListActionOutput = await queryAlbumsRecordOnce(
        queryBuilder: (albumsRecord) => albumsRecord.where(
          'userID',
          isEqualTo: currentUserReference,
        ),
      );
      _model.reload = true;
      _model.albunsListState =
          _model.albunsListActionOutput!.toList().cast<AlbumsRecord>();
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
                          Row(
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
                                    context.pushNamed(HomePageWidget.routeName);
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '50f0pbsh' /* Os meus albums */,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 65.0, 0.0, 50.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final albunsListGridView =
                                _model.albunsListState.toList();

                            return RefreshIndicator(
                              onRefresh: () async {
                                _model.albunsListRefreshed =
                                    await queryAlbumsRecordOnce(
                                  queryBuilder: (albumsRecord) =>
                                      albumsRecord.where(
                                    'userID',
                                    isEqualTo: currentUserReference,
                                  ),
                                );
                                _model.albunsListState = _model
                                    .albunsListRefreshed!
                                    .toList()
                                    .cast<AlbumsRecord>();
                                safeSetState(() {});
                              },
                              child: GridView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  10.0,
                                  0,
                                  10.0,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 1.0,
                                  mainAxisSpacing: 1.0,
                                  childAspectRatio: 0.65,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: albunsListGridView.length,
                                itemBuilder:
                                    (context, albunsListGridViewIndex) {
                                  final albunsListGridViewItem =
                                      albunsListGridView[
                                          albunsListGridViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 4.0, 12.0),
                                    child: wrapWithModel(
                                      model: _model
                                          .albumWithCoverComponentModels
                                          .getModel(
                                        'album_with_cover_${albunsListGridViewItem.reference.id}',
                                        albunsListGridViewIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: AlbumWithCoverComponentWidget(
                                        key: Key(
                                          'Keyld2_${'album_with_cover_${albunsListGridViewItem.reference.id}'}',
                                        ),
                                        albumDocument: albunsListGridViewItem,
                                        updateAlbumListState:
                                            (albumReference) async {
                                          _model.removeFromAlbunsListState(
                                              albunsListGridViewItem);
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
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
