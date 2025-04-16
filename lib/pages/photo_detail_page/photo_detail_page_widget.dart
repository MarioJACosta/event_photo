import '/backend/backend.dart';
import '/components/nav_bar_component/nav_bar_component_widget.dart';
import '/components/photo_in_mural_component/photo_in_mural_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'photo_detail_page_model.dart';
export 'photo_detail_page_model.dart';

class PhotoDetailPageWidget extends StatefulWidget {
  const PhotoDetailPageWidget({
    super.key,
    required this.photos,
    int? index,
    this.albumName,
  }) : this.index = index ?? 0;

  final List<PhotosRecord>? photos;
  final int index;
  final String? albumName;

  static String routeName = 'PhotoDetailPage';
  static String routePath = '/photoDetail';

  @override
  State<PhotoDetailPageWidget> createState() => _PhotoDetailPageWidgetState();
}

class _PhotoDetailPageWidgetState extends State<PhotoDetailPageWidget> {
  late PhotoDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoDetailPageModel());

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
              decoration: BoxDecoration(),
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                                  widget.albumName,
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
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final photosInListView = widget.photos!.toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: photosInListView.length,
                          itemBuilder: (context, photosInListViewIndex) {
                            final photosInListViewItem =
                                photosInListView[photosInListViewIndex];
                            return Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: wrapWithModel(
                                model:
                                    _model.photoInMuralComponentModels.getModel(
                                  'photo_in_mural_${photosInListViewItem.uid}',
                                  photosInListViewIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: PhotoInMuralComponentWidget(
                                  key: Key(
                                    'Keyjlq_${'photo_in_mural_${photosInListViewItem.uid}'}',
                                  ),
                                  photo: photosInListViewItem,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navBarComponentModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarComponentWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
