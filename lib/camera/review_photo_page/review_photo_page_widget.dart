import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_image_editor/models/editor_callbacks/pro_image_editor_callbacks.dart';
import 'package:pro_image_editor/models/editor_configs/pro_image_editor_configs.dart';
import 'package:pro_image_editor/modules/main_editor/main_editor.dart';
import 'package:provider/provider.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/upload_data.dart';
import '/index.dart';
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
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.9,
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
                              width: screenWidth,
                              height: screenHeight * 0.8,
                              fit: BoxFit.fitWidth,
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
                            alignment: AlignmentDirectional(1.0, -1.0),
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
                                child: FlutterFlowIconButton(
                                  borderRadius: 25.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: FaIcon(
                                    FontAwesomeIcons.wandMagicSparkles,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 25.0,
                                  ),
                                  onPressed: () async {
                                    final originalBytes = functions
                                        .base64ToFile(_model.filteredImage!,
                                            '${currentUserReference?.id}.jpg')
                                        .bytes;

                                    if (originalBytes == null) return;

                                    final editedBytes = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ProImageEditor.memory(
                                          originalBytes,
                                          configs: ProImageEditorConfigs(
                                              imageEditorTheme:
                                                  ImageEditorTheme(
                                                      background:
                                                          Color(0xFFFF9000))),
                                          callbacks: ProImageEditorCallbacks(
                                            onImageEditingComplete:
                                                (editedBytes) async {
                                              if (editedBytes != null) {
                                                // Handle the edited image (e.g., upload or update state)
                                                setState(() {
                                                  _model.filteredImage =
                                                      base64Encode(editedBytes);
                                                });
                                                Navigator.pop(context,
                                                    editedBytes); // Close the editor
                                                print(
                                                    'Edited image completed!');
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    );

                                    if (editedBytes != null) {
                                      setState(() {
                                        _model.filteredImage =
                                            base64Encode(editedBytes);
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 68.0),
                              child: Container(
                                width: screenWidth,
                                child: TextFormField(
                                  controller: _model.textController,
                                  // focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
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
                                  // Align(
                                  //   alignment: AlignmentDirectional(1.0, 1.0),
                                  //   child: Padding(
                                  //     padding: EdgeInsetsDirectional.fromSTEB(
                                  //         0.0, 16.0, 16.0, 0.0),
                                  //     child: Container(
                                  //       width: 40.0,
                                  //       height: 40.0,
                                  //       decoration: BoxDecoration(
                                  //         color: FlutterFlowTheme.of(context)
                                  //             .primaryBackground,
                                  //         shape: BoxShape.circle,
                                  //       ),
                                  //       child: FlutterFlowIconButton(
                                  //         borderRadius: 25.0,
                                  //         buttonSize: 40.0,
                                  //         fillColor:
                                  //             FlutterFlowTheme.of(context)
                                  //                 .secondaryBackground,
                                  //         icon: FaIcon(
                                  //           FontAwesomeIcons.wandMagicSparkles,
                                  //           color: FlutterFlowTheme.of(context)
                                  //               .primaryText,
                                  //           size: 25.0,
                                  //         ),
                                  //         onPressed: () async {
                                  //           final originalBytes = functions
                                  //               .base64ToFile(
                                  //                   _model.filteredImage!,
                                  //                   '${currentUserReference?.id}.jpg')
                                  //               .bytes;
                                  //
                                  //           if (originalBytes == null) return;
                                  //
                                  //           final editedBytes =
                                  //               await Navigator.push(
                                  //             context,
                                  //             MaterialPageRoute(
                                  //               builder: (_) =>
                                  //                   ProImageEditor.memory(
                                  //                 originalBytes,
                                  //                 configs:
                                  //                     ProImageEditorConfigs(
                                  //                         theme: ThemeData(
                                  //                   materialTapTargetSize:
                                  //                       MaterialTapTargetSize
                                  //                           .padded,
                                  //                 )),
                                  //                 callbacks:
                                  //                     ProImageEditorCallbacks(
                                  //                   onImageEditingComplete:
                                  //                       (editedBytes) async {
                                  //                     if (editedBytes != null) {
                                  //                       // Handle the edited image (e.g., upload or update state)
                                  //                       setState(() {
                                  //                         _model.filteredImage =
                                  //                             base64Encode(
                                  //                                 editedBytes);
                                  //                       });
                                  //                       Navigator.pop(context,
                                  //                           editedBytes); // Close the editor
                                  //                       print(
                                  //                           'Edited image completed!');
                                  //                     }
                                  //                   },
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           );
                                  //
                                  //           if (editedBytes != null) {
                                  //             setState(() {
                                  //               _model.filteredImage =
                                  //                   base64Encode(editedBytes);
                                  //             });
                                  //           }
                                  //         },
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
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
