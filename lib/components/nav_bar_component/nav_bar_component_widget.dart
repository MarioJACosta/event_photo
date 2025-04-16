import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'nav_bar_component_model.dart';
export 'nav_bar_component_model.dart';

class NavBarComponentWidget extends StatefulWidget {
  const NavBarComponentWidget({
    super.key,
    int? selectedPageIndex,
  }) : this.selectedPageIndex = selectedPageIndex ?? 0;

  final int selectedPageIndex;

  @override
  State<NavBarComponentWidget> createState() => _NavBarComponentWidgetState();
}

class _NavBarComponentWidgetState extends State<NavBarComponentWidget> {
  late NavBarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarComponentModel());

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
      width: 400.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Opacity(
            opacity: widget.selectedPageIndex == 0 ? 1.0 : 0.5,
            child: FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 0.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.home_outlined,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.goNamed(
                  HomePageWidget.routeName,
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
            ),
          ),
          Opacity(
            opacity: widget.selectedPageIndex == 1 ? 1.0 : 0.5,
            child: FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 0.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.add_circle_outline_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                await requestPermission(cameraPermission);

                context.pushNamed(CameraPageWidget.routeName);
              },
            ),
          ),
          Opacity(
            opacity: widget.selectedPageIndex == 2 ? 1.0 : 0.5,
            child: FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 0.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.bookmarks_outlined,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(ListAlbunsPageWidget.routeName);
              },
            ),
          ),
          Opacity(
            opacity: widget.selectedPageIndex == 3 ? 1.0 : 0.5,
            child: AuthUserStreamWidget(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    ProfilePageWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Container(
                  width: 25.0,
                  height: 25.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    valueOrDefault<String>(
                      currentUserPhoto != ''
                          ? currentUserPhoto
                          : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/event-photo-g0cgg3/assets/r6czi752hwnu/no_avatar.png',
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/event-photo-g0cgg3/assets/r6czi752hwnu/no_avatar.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
