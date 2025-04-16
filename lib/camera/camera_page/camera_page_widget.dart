import 'package:flutter/material.dart';

import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
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
    // Get the screen height dynamically
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Container(
                width: double.infinity,
                height: screenHeight,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: screenHeight,
                      child: custom_widgets.CameraWidget(
                        width: double.infinity,
                        height: screenHeight * 0.8,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 20.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.pushNamed(HomePageWidget.routeName);
                          },
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
