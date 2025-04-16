import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/edit_profile_component/edit_profile_component_widget.dart';
import 'package:flutter/material.dart';
import 'edit_profile_page_model.dart';
export 'edit_profile_page_model.dart';

class EditProfilePageWidget extends StatefulWidget {
  const EditProfilePageWidget({super.key});

  static String routeName = 'EditProfilePage';
  static String routePath = '/editProfile';

  @override
  State<EditProfilePageWidget> createState() => _EditProfilePageWidgetState();
}

class _EditProfilePageWidgetState extends State<EditProfilePageWidget> {
  late EditProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfilePageModel());

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
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 400.0,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 48.0, 0.0, 24.0),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).accent4,
                        borderRadius: 12.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).accent4,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 770.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: wrapWithModel(
                      model: _model.editProfileComponentModel,
                      updateCallback: () => safeSetState(() {}),
                      child: EditProfileComponentWidget(
                        title: 'Edit Profile',
                        confirmButtonText: 'Save Changes',
                        navigateAction: () async {
                          context.safePop();
                        },
                      ),
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
