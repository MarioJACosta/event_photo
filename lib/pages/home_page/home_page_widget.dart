import '/backend/backend.dart';
import '/components/nav_bar_component/nav_bar_component_widget.dart';
import '/components/photo_in_mural_component/photo_in_mural_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

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
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: RefreshIndicator(
                        onRefresh: () async {},
                        child: PagedListView<DocumentSnapshot<Object?>?,
                            PhotosRecord>.separated(
                          pagingController: _model.setListViewController(
                            PhotosRecord.collection
                                .orderBy('created_at', descending: true),
                          ),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (_, __) => SizedBox(height: 5.0),
                          builderDelegate:
                              PagedChildBuilderDelegate<PhotosRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),

                            itemBuilder: (context, _, listViewIndex) {
                              final listViewPhotosRecord = _model
                                  .listViewPagingController!
                                  .itemList![listViewIndex];
                              return wrapWithModel(
                                model:
                                    _model.photoInMuralComponentModels.getModel(
                                  'mural_${listViewPhotosRecord.reference.id}',
                                  listViewIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: PhotoInMuralComponentWidget(
                                  key: Key(
                                    'Keynew_${'mural_${listViewPhotosRecord.reference.id}'}',
                                  ),
                                  photo: listViewPhotosRecord,
                                ),
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
                          selectedPageIndex: 0,
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
