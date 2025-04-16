import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_component/nav_bar_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  static String routeName = 'ProfilePage';
  static String routePath = '/profile';

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listPhotos = await queryPhotosRecordOnce(
        queryBuilder: (photosRecord) => photosRecord
            .where(
              'owner',
              isEqualTo: currentUserReference,
            )
            .orderBy('created_at', descending: true),
      );
      _model.isLightMode = Theme.of(context).brightness == Brightness.light;
      _model.listPhotosState = _model.listPhotos!.toList().cast<PhotosRecord>();
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
        body: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Container(
            width: 400.0,
            height: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 770.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Container(
                            height: 100.0,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 90.0,
                                      height: 90.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: currentUserPhoto,
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Text(
                                  currentUserDisplayName,
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Urbanist',
                                        fontSize: 26.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderRadius: 8.0,
                                  borderWidth: 2.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.manage_accounts_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed(
                                        EditProfilePageWidget.routeName);
                                  },
                                ),
                                FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderRadius: 8.0,
                                  borderWidth: 2.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.logout_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context)
                                        .clearRedirectLocation();

                                    context.goNamedAuth(
                                        LoginPageWidget.routeName,
                                        context.mounted);
                                  },
                                ),
                                ToggleIcon(
                                  onPressed: () async {
                                    safeSetState(() => _model.isLightMode =
                                        !_model.isLightMode);
                                    if ((Theme.of(context).brightness ==
                                            Brightness.light) ==
                                        true) {
                                      setDarkModeSetting(
                                          context, ThemeMode.dark);
                                    } else {
                                      setDarkModeSetting(
                                          context, ThemeMode.light);
                                    }
                                  },
                                  value: _model.isLightMode,
                                  onIcon: Icon(
                                    Icons.mode_night_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  offIcon: Icon(
                                    Icons.wb_sunny_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(width: 12.0))
                                  .around(SizedBox(width: 12.0)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final listPhotosGridView =
                              _model.listPhotosState.toList();

                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0,
                              childAspectRatio: 1.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listPhotosGridView.length,
                            itemBuilder: (context, listPhotosGridViewIndex) {
                              final listPhotosGridViewItem =
                                  listPhotosGridView[listPhotosGridViewIndex];
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
                                        _model.listPhotos,
                                        ParamType.Document,
                                        isList: true,
                                      ),
                                      'index': serializeParam(
                                        listPhotosGridViewIndex,
                                        ParamType.int,
                                      ),
                                      'albumName': serializeParam(
                                        'As minhas fotos',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'photos': _model.listPhotos,
                                    },
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.network(
                                    listPhotosGridViewItem.url,
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navBarComponentModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavBarComponentWidget(
                      selectedPageIndex: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
