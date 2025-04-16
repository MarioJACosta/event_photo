import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'camera_page_model.dart';
export 'camera_page_model.dart';

class CameraPageWidget extends StatefulWidget {
  const CameraPageWidget({super.key});

  static String routeName = 'CameraPage';
  static String routePath = '/camera';

  @override
  State<CameraPageWidget> createState() => _CameraPageWidgetState();
}

class _CameraPageWidgetState extends State<CameraPageWidget> {
  late CameraPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraPageModel());

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
                height: 900.0,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 800.0,
                      child: custom_widgets.CameraWidget(
                        width: double.infinity,
                        height: 800.0,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 24.0, 0.0),
                        child: ClipOval(
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              shape: BoxShape.circle,
                            ),
                            child: FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 48.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.clear_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed(HomePageWidget.routeName);
                              },
                            ),
                          ),
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
