import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'review_photo_page_model.dart';
export 'review_photo_page_model.dart';

class ReviewPhotoPageWidget extends StatefulWidget {
  const ReviewPhotoPageWidget({super.key});

  static String routeName = 'ReviewPhotoPage';
  static String routePath = '/ReviewPhoto';

  @override
  State<ReviewPhotoPageWidget> createState() => _ReviewPhotoPageWidgetState();
}

class _ReviewPhotoPageWidgetState extends State<ReviewPhotoPageWidget> {
  late ReviewPhotoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewPhotoPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.filteredImage = FFAppState().takenPhoto64bits;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      width: double.infinity,
                      height: 790.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.memory(
                              functions
                                      .base64ToFile(_model.filteredImage!,
                                          '${currentUserReference?.id}.jpg')
                                      .bytes ??
                                  Uint8List.fromList([]),
                              width: double.infinity,
                              height: 700.0,
                              fit: BoxFit.cover,
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
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed(CameraPageWidget.routeName);
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 68.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '0cw1cy9m' /* Adiciona a tua legenda */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: 10,
                                  minLines: 1,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 150.0),
                              child: Container(
                                width: double.infinity,
                                height: 70.0,
                                decoration: BoxDecoration(),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Visibility(
                                  visible: _model.showFilters,
                                  child: ListView(
                                    padding: EdgeInsets.fromLTRB(
                                      MediaQuery.sizeOf(context).width * 0.5,
                                      0,
                                      0,
                                      0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filteredImageOriginaActionOutput =
                                              await actions.applyFilterToImage(
                                            FFAppState().takenPhoto64bits,
                                            'original',
                                          );
                                          _model.filteredImage = _model
                                              .filteredImageOriginaActionOutput;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.minus,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filteredImageGrayScaleActionOutput =
                                              await actions.applyFilterToImage(
                                            FFAppState().takenPhoto64bits,
                                            'grayscale',
                                          );
                                          _model.filteredImage = _model
                                              .filteredImageGrayScaleActionOutput;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground
                                              ],
                                              stops: [0.2, 0.8],
                                              begin: AlignmentDirectional(
                                                  0.31, -1.0),
                                              end: AlignmentDirectional(
                                                  -0.31, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filteredImageSepiaActionOutput =
                                              await actions.applyFilterToImage(
                                            FFAppState().takenPhoto64bits,
                                            'sepia',
                                          );
                                          _model.filteredImage = _model
                                              .filteredImageSepiaActionOutput;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFCDA882),
                                                Color(0xFFEADBCB)
                                              ],
                                              stops: [0.2, 0.8],
                                              begin: AlignmentDirectional(
                                                  0.31, -1.0),
                                              end: AlignmentDirectional(
                                                  -0.31, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filteredImageInvertActionOutput =
                                              await actions.applyFilterToImage(
                                            FFAppState().takenPhoto64bits,
                                            'invert',
                                          );
                                          _model.filteredImage = _model
                                              .filteredImageInvertActionOutput;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF1C08FE),
                                                Color(0xFFFD90F9)
                                              ],
                                              stops: [0.2, 0.8],
                                              begin: AlignmentDirectional(
                                                  0.31, -1.0),
                                              end: AlignmentDirectional(
                                                  -0.31, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filteredImageWarmActionOutput =
                                              await actions.applyFilterToImage(
                                            FFAppState().takenPhoto64bits,
                                            'warm',
                                          );
                                          _model.filteredImage = _model
                                              .filteredImageWarmActionOutput;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFF2E03F),
                                                Color(0xFFE24125)
                                              ],
                                              stops: [0.2, 0.8],
                                              begin: AlignmentDirectional(
                                                  0.31, -1.0),
                                              end: AlignmentDirectional(
                                                  -0.31, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filteredImageColdActionOutput =
                                              await actions.applyFilterToImage(
                                            FFAppState().takenPhoto64bits,
                                            'cold',
                                          );
                                          _model.filteredImage = _model
                                              .filteredImageColdActionOutput;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF0875DC),
                                                Color(0xFFD9CAF4)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.31, -1.0),
                                              end: AlignmentDirectional(
                                                  -0.31, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filteredImageVibrantActionOutput =
                                              await actions.applyFilterToImage(
                                            FFAppState().takenPhoto64bits,
                                            'vibrant',
                                          );
                                          _model.filteredImage = _model
                                              .filteredImageVibrantActionOutput;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFFF5E3A),
                                                Color(0xFF1E90FF)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.31, -1.0),
                                              end: AlignmentDirectional(
                                                  -0.31, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filteredImageFadeActionOutput =
                                              await actions.applyFilterToImage(
                                            FFAppState().takenPhoto64bits,
                                            'fade',
                                          );
                                          _model.filteredImage = _model
                                              .filteredImageFadeActionOutput;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFD8BFD8),
                                                Color(0xFFE0E0E0)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.31, -1.0),
                                              end: AlignmentDirectional(
                                                  -0.31, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filteredImageRetroActionOutput =
                                              await actions.applyFilterToImage(
                                            FFAppState().takenPhoto64bits,
                                            'retro',
                                          );
                                          _model.filteredImage = _model
                                              .filteredImageRetroActionOutput;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFFCF4A3),
                                                Color(0xFF947D88)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.31, -1.0),
                                              end: AlignmentDirectional(
                                                  -0.31, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filteredImageMutedActionOutput =
                                              await actions.applyFilterToImage(
                                            FFAppState().takenPhoto64bits,
                                            'muted',
                                          );
                                          _model.filteredImage = _model
                                              .filteredImageMutedActionOutput;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFB0B0B0),
                                                Color(0xFF888888)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.31, -1.0),
                                              end: AlignmentDirectional(
                                                  -0.31, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filteredImagePurpleActionOutput =
                                              await actions.applyFilterToImage(
                                            FFAppState().takenPhoto64bits,
                                            'purple',
                                          );
                                          _model.filteredImage = _model
                                              .filteredImagePurpleActionOutput;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF6A0DAD),
                                                Color(0xFFD8B9F2)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.31, -1.0),
                                              end: AlignmentDirectional(
                                                  -0.31, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filteredImagePosterActionOutput =
                                              await actions.applyFilterToImage(
                                            FFAppState().takenPhoto64bits,
                                            'poster\t',
                                          );
                                          _model.filteredImage = _model
                                              .filteredImagePosterActionOutput;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF6A0DAD),
                                                Color(0xFFDA0037)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.31, -1.0),
                                              end: AlignmentDirectional(
                                                  -0.31, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filteredImageOrangeTealActionOutput =
                                              await actions.applyFilterToImage(
                                            FFAppState().takenPhoto64bits,
                                            'orange_teal\t',
                                          );
                                          _model.filteredImage = _model
                                              .filteredImageOrangeTealActionOutput;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFFF7F50),
                                                Color(0xFF008080)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.31, -1.0),
                                              end: AlignmentDirectional(
                                                  -0.31, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filteredImageOldTVActionOutput =
                                              await actions.applyFilterToImage(
                                            FFAppState().takenPhoto64bits,
                                            'old_tv',
                                          );
                                          _model.filteredImage = _model
                                              .filteredImageOldTVActionOutput;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFFF7F50),
                                                Color(0xFF008080)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.31, -1.0),
                                              end: AlignmentDirectional(
                                                  -0.31, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 15.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 16.0, 0.0),
                                      child: Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        child: ToggleIcon(
                                          onPressed: () async {
                                            safeSetState(() =>
                                                _model.showFilters =
                                                    !_model.showFilters);
                                          },
                                          value: _model.showFilters,
                                          onIcon: Icon(
                                            Icons.now_wallpaper_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          offIcon: Icon(
                                            Icons.now_wallpaper,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 25.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.send,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 25.0,
                                        ),
                                        onPressed: () async {
                                          {
                                            safeSetState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];
                                            var selectedFiles =
                                                <SelectedFile>[];
                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles = functions
                                                      .base64ToFile(
                                                          _model.filteredImage!,
                                                          '${DateTime.fromMillisecondsSinceEpoch(random_data.randomDate().millisecondsSinceEpoch).toString()}.jpg')
                                                      .bytes!
                                                      .isNotEmpty
                                                  ? [
                                                      functions.base64ToFile(
                                                          _model.filteredImage!,
                                                          '${DateTime.fromMillisecondsSinceEpoch(random_data.randomDate().millisecondsSinceEpoch).toString()}.jpg')
                                                    ]
                                                  : <FFUploadedFile>[];
                                              selectedFiles =
                                                  selectedFilesFromUploadedFiles(
                                                selectedUploadedFiles,
                                              );
                                              downloadUrls = (await Future.wait(
                                                selectedFiles.map(
                                                  (f) async => await uploadData(
                                                      f.storagePath, f.bytes),
                                                ),
                                              ))
                                                  .where((u) => u != null)
                                                  .map((u) => u!)
                                                  .toList();
                                            } finally {
                                              _model.isDataUploading = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedFiles.length &&
                                                downloadUrls.length ==
                                                    selectedFiles.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          await PhotosRecord.collection
                                              .doc()
                                              .set({
                                            ...createPhotosRecordData(
                                              url: _model.uploadedFileUrl,
                                              likes: 0,
                                              owner: currentUserReference,
                                              comments: 0,
                                              description:
                                                  _model.textController.text,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'created_at': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });

                                          context.goNamed(
                                              HomePageWidget.routeName);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
