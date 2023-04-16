import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'qr_scan_model.dart';
export 'qr_scan_model.dart';

class QrScanWidget extends StatefulWidget {
  const QrScanWidget({Key? key}) : super(key: key);

  @override
  _QrScanWidgetState createState() => _QrScanWidgetState();
}

class _QrScanWidgetState extends State<QrScanWidget> {
  late QrScanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QrScanModel());
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
        drawer: Drawer(
          elevation: 16.0,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 344.7,
                  height: 854.9,
                  decoration: BoxDecoration(
                    color: Color(0xFFE1E1E1),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.05, -0.92),
                        child: Container(
                          width: 120.0,
                          height: 120.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.36),
                        child: ListTile(
                          leading: Icon(
                            Icons.local_movies_rounded,
                            size: 50.0,
                          ),
                          title: Text(
                            'Películas para ver',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.23),
                        child: ListTile(
                          leading: Icon(
                            Icons.videocam_rounded,
                            size: 50.0,
                          ),
                          title: Text(
                            'Mis películas',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.47),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('MiPerfil');

                            setState(() {
                              FFAppState().email = FFAppState().email;
                            });
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.person,
                              size: 50.0,
                            ),
                            title: Text(
                              'Mi perfil',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.05, -0.56),
                        child: Text(
                          FFAppState().email,
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 13.0,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(  0.5, -0.12),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('QrScan');
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.qr_code,
                              size: 50.0,
                            ),
                            title: Text(
                              'QR Scan',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.94),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('LoginPageSupabase');
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.logout,
                              size: 50.0,
                            ),
                            title: Text(
                              'Cerrar Sesión',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.04, -0.63),
                        child: Text(
                          'Correo electrónico:',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.78),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('MoviesDisplay');
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.home_filled,
                              size: 50.0,
                            ),
                            title: Text(
                              'Home',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
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
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.13, 0.7),
                child: FFButtonWidget(
                  onPressed: () async {
                    await launchURL(_model.resultadoScan!);
                  },
                  text: 'Ir a la página cine',
                  options: FFButtonOptions(
                    width: 283.4,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.black,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -0.47),
                child: Icon(
                  Icons.qr_code_scanner,
                  color: Colors.black,
                  size: 400.0,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.13, 0.46),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.resultadoScan =
                        await FlutterBarcodeScanner.scanBarcode(
                      '#C62828', // scanning line color
                      'Cancel', // cancel button text
                      true, // whether to show the flash icon
                      ScanMode.QR,
                    );

                    setState(() {});
                  },
                  text: 'Scanear QR',
                  options: FFButtonOptions(
                    width: 283.4,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.black,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.85, -0.93),
                child: Text(
                  'Scaner QR',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        fontSize: 24.0,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.92, -0.95),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
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
                alignment: AlignmentDirectional(0.92, -0.95),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.04, 0.86),
                child: Text(
                  _model.resultadoScan!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        fontSize: 12.0,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.02, 0.79),
                child: Text(
                  'URL de la página web:',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
