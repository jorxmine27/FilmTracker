import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'movies_display_model.dart';
export 'movies_display_model.dart';

class MoviesDisplayWidget extends StatefulWidget {
  const MoviesDisplayWidget({
    Key? key,
    this.films,
  }) : super(key: key);

  final dynamic films;

  @override
  _MoviesDisplayWidgetState createState() => _MoviesDisplayWidgetState();
}

class _MoviesDisplayWidgetState extends State<MoviesDisplayWidget> {
  late MoviesDisplayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoviesDisplayModel());

    _model.searchController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F1F1),
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
                        alignment: AlignmentDirectional(0.0, -0.29),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('MisPeliculas');
                          },
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
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.44),
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
                        alignment: AlignmentDirectional(0.0, -0.12),
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
                        alignment: AlignmentDirectional(-0.85, 0.71),
                        child: Text(
                          'Bienvenido,',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 19.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.52, 0.7),
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
                        textUsersRow?.name,
                        'usuario',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 19.0,
                          ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.42, 0.0),
                      child: Container(
                        width: 300.0,
                        child: TextFormField(
                          controller: _model.searchController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.searchController',
                            Duration(milliseconds: 500),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: '[Some hint text...]',
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
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xFF070707),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 32.0,
                                  ),
                          validator: _model.searchControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.97, -0.68),
                      child: InkWell(
                        onTap: () async {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        child: Icon(
                          Icons.format_list_bulleted_rounded,
                          color: Colors.black,
                          size: 60.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: width,
                  height: height * 0.88,
                  decoration: BoxDecoration(
                    color: Color(0x00FCFCFC),
                  ),
                  child: FutureBuilder<ApiCallResponse>(
                    future: PeliculasCall.call(),
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
                      final listViewPeliculasResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final pelicula = getJsonField(
                            listViewPeliculasResponse.jsonBody,
                            r'''$''',
                          ).toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: pelicula.length,
                            itemBuilder: (context, peliculaIndex) {
                              final peliculaItem = pelicula[peliculaIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (functions.searchEngine(
                                      getJsonField(
                                        peliculaItem,
                                        r'''$..NOMBRE''',
                                      ).toString(),
                                      _model.searchController.text))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 10.0, 5.0),
                                      child: InkWell(
                                        onTap: () async {
                                          context.pushNamed(
                                            'SinopsisContent',
                                            queryParams: {
                                              'film': serializeParam(
                                                getJsonField(
                                                  peliculaItem,
                                                  r'''$''',
                                                ),
                                                ParamType.JSON,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          height: 240.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(0.0, 2.0),
                                              )
                                            ],
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              context.pushNamed(
                                                'SinopsisContent',
                                                queryParams: {
                                                  'film': serializeParam(
                                                    getJsonField(
                                                      peliculaItem,
                                                      r'''$''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Text(
                                                        getJsonField(
                                                          peliculaItem,
                                                          r'''$..NOMBRE''',
                                                        ).toString(),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Image.network(
                                                            getJsonField(
                                                              peliculaItem,
                                                              r'''$..IMAGEN''',
                                                            ),
                                                            width: 145.0,
                                                            height: 190.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Image.asset(
                                                                'assets/images/_icon__star_.png',
                                                                width: 45.0,
                                                                height: 45.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              AutoSizeText(
                                                                getJsonField(
                                                                  peliculaItem,
                                                                  r'''$..VALORACION''',
                                                                ).toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: Text(
                                                                  ' / 10',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    peliculaItem,
                                                                    r'''$..DURACION''',
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            20.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        55.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'SinopsisContent',
                                                                        queryParams:
                                                                            {
                                                                          'film':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              peliculaItem,
                                                                              r'''$''',
                                                                            ),
                                                                            ParamType.JSON,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .info_sharp,
                                                                      color: Colors
                                                                          .black,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
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
