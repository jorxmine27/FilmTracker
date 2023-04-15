import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mi_perfil_model.dart';
export 'mi_perfil_model.dart';

class MiPerfilWidget extends StatefulWidget {
  const MiPerfilWidget({
    Key? key,
    this.id,
  }) : super(key: key);

  final UsersRow? id;

  @override
  _MiPerfilWidgetState createState() => _MiPerfilWidgetState();
}

class _MiPerfilWidgetState extends State<MiPerfilWidget> {
  late MiPerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiPerfilModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xE2F1F1F1),
        body: SafeArea(
          child: FutureBuilder<List<UsersRow>>(
            future: UsersTable().querySingleRow(
              queryFn: (q) => q.eq(
                'id',
                FFAppState().id,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitCubeGrid(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                );
              }
              List<UsersRow> stackUsersRowList = snapshot.data!;
              final stackUsersRow =
                  stackUsersRowList.isNotEmpty ? stackUsersRowList.first : null;
              return Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.04, 0.75),
                    child: FutureBuilder<List<UsersRow>>(
                      future: UsersTable().querySingleRow(
                        queryFn: (q) => q.eq(
                          'id',
                          FFAppState().id,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitCubeGrid(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<UsersRow> signInButtonUsersRowList =
                            snapshot.data!;
                        final signInButtonUsersRow =
                            signInButtonUsersRowList.isNotEmpty
                                ? signInButtonUsersRowList.first
                                : null;
                        return FFButtonWidget(
                          onPressed: () async {
                            await UsersTable().update(
                              data: {
                                'name': _model.cambiarNombreController.text,
                              },
                              matchingRows: (rows) => rows.eq(
                                'id',
                                FFAppState().id,
                              ),
                            );
                            context.safePop();
                          },
                          text: 'Guardar',
                          options: FFButtonOptions(
                            width: 283.4,
                            height: 60.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.black,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Jura',
                                  color: Colors.white,
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.09, -0.49),
                    child: Container(
                      width: 240.0,
                      height: 240.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.57, 0.03),
                    child: Text(
                      'Correo electrónico',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 25.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.92, -0.95),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.black,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      fillColor: Colors.black,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('MoviesDisplay');
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.04, -0.76),
                    child: Text(
                      'Foto de perfil',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 25.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.87, -0.92),
                    child: Text(
                      'Editar Perfil',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.01, 0.15),
                    child: FutureBuilder<List<UsersRow>>(
                      future: UsersTable().querySingleRow(
                        queryFn: (q) => q.eq(
                          'id',
                          FFAppState().id,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitCubeGrid(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<UsersRow> textUsersRowList = snapshot.data!;
                        final textUsersRow = textUsersRowList.isNotEmpty
                            ? textUsersRowList.first
                            : null;
                        return Text(
                          valueOrDefault<String>(
                            textUsersRow?.email,
                            'empty',
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.62, 0.34),
                    child: Text(
                      'Nombre usuario',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 25.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.11, 0.45),
                    child: FutureBuilder<List<UsersRow>>(
                      future: UsersTable().querySingleRow(
                        queryFn: (q) => q.eq(
                          'id',
                          FFAppState().id,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitCubeGrid(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<UsersRow> cambiarNombreUsersRowList =
                            snapshot.data!;
                        final cambiarNombreUsersRow =
                            cambiarNombreUsersRowList.isNotEmpty
                                ? cambiarNombreUsersRowList.first
                                : null;
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            controller: _model.cambiarNombreController ??=
                                TextEditingController(
                              text: cambiarNombreUsersRow?.name,
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Escribir el nombre...',
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.cambiarNombreControllerValidator
                                .asValidator(context),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
