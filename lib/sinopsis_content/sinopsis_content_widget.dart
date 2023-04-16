import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sinopsis_content_model.dart';
export 'sinopsis_content_model.dart';

class SinopsisContentWidget extends StatefulWidget {
  const SinopsisContentWidget({
    Key? key,
    this.film,
  }) : super(key: key);

  final dynamic film;

  @override
  _SinopsisContentWidgetState createState() => _SinopsisContentWidgetState();
}

class _SinopsisContentWidgetState extends State<SinopsisContentWidget> {
  late SinopsisContentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SinopsisContentModel());
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
    final relative = height * 0.4;
    context.watch<FFAppState>();

    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: scaffoldKey,
          backgroundColor: Colors.white,
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
                          alignment: AlignmentDirectional(0.05, -0.90),
                          child: Container(
                            width: 120.0,
                            height: 120.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://media.licdn.com/dms/image/C4E03AQFjizfTcmtdiA/profile-displayphoto-shrink_200_200/0/1653989483405?e=1680739200&v=beta&t=9NbynXpQkd8VDFkcG_IoPgTEf7uknAvyJ47_UEKQGHo',
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
                              'Cines',
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              top: false,
              bottom: false,
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Color(0x00FCFCFC),
                  ),
                  child: Container(
                    height: height,
                    child: Stack(
                      children: [
                        Column(children: [
                          Row(
                            children: [
                              Image.network(
                                getJsonField(widget.film, r'''$.IMAGEN'''),
                                width: width,
                                height: height * 0.6,
                                fit: BoxFit.fitWidth,
                              )
                            ],
                          ),
                        ]),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.04),
                          child: Container(
                            width: 395.8,
                            height: relative,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.95, -0.95),
                                  child: Text(
                                    'Video',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Jura',
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.85, -0.95),
                                  child: Text(
                                    getJsonField(
                                      widget.film,
                                      r'''$.VALORACION''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.65, -1),
                                  child: Icon(
                                    Icons.star_sharp,
                                    color: FlutterFlowTheme.of(context).warning,
                                    size: 40.0,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.04, 0.90),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed('CinemaDisplay');

                                      FFAppState().idPeli = getJsonField(
                                        widget.film,
                                        r'''$.ID''',
                                      );
                                    },
                                    text: 'DÓNDE VER',
                                    options: FFButtonOptions(
                                      width: 363.1,
                                      height: 50,
                                      color: Colors.black,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                        fontFamily: 'Jura',
                                        color: Colors.white,
                                        fontSize: 25.0,
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
                                  alignment: AlignmentDirectional(-0.50, -1.05),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      Icons.video_label_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 40.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed(
                                        'ContentTrailer',
                                        queryParams: {
                                          'film': serializeParam(
                                            getJsonField(
                                              widget.film,
                                              r'''$''',
                                            ),
                                            ParamType.JSON,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -0.25),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      width: width,
                                      height: relative * 0.6,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                              child: SingleChildScrollView(
                                                child: Text(
                                                  getJsonField(
                                                    widget.film,
                                                    r'''$..SINOPSIS''',
                                                  ).toString(),
                                                  textAlign: TextAlign.justify,
                                                  style: FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.11, -1),
                                  child: InkWell(
                                    onTap: () async {
                                      await ListaFavTable().insert({
                                        'user_id': FFAppState().id,
                                        'ID_PELICULA': getJsonField(
                                          widget.film,
                                          r'''$..ID''',
                                        ),
                                      });
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '¡Película insertada en la lista!',
                                            style: TextStyle(
                                              color: FlutterFlowTheme.of(context)
                                                  .primaryBtnText,
                                            ),
                                          ),
                                          duration: Duration(milliseconds: 4000),
                                          backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .success,
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.add_circle,
                                      color: Colors.black,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.11, -1),
                                  child: InkWell(
                                    onTap: () async {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '¡Película insertada en la lista!',
                                            style: TextStyle(
                                              color: FlutterFlowTheme.of(context)
                                                  .primaryBtnText,
                                            ),
                                          ),
                                          duration: Duration(milliseconds: 4000),
                                          backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .success,
                                        ),
                                      );
                                      await ListaFavTable().insert({
                                        'user_id': FFAppState().id,
                                        'ID_PELICULA': getJsonField(
                                          widget.film,
                                          r'''$..ID''',
                                        ),
                                      });
                                    },
                                    child: Icon(
                                      Icons.add_circle,
                                      color: Colors.black,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.22, -1),
                                  child: InkWell(
                                    onTap: () async {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Película eliminada de la lista',
                                            style: TextStyle(
                                              color: FlutterFlowTheme.of(context)
                                                  .primaryBtnText,
                                            ),
                                          ),
                                          duration: Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFFFF0000),
                                        ),
                                      );
                                      await ListaFavTable().delete(
                                        matchingRows: (rows) => rows
                                            .eq(
                                          'user_id',
                                          FFAppState().id,
                                        )
                                            .eq(
                                          'ID_PELICULA',
                                          getJsonField(
                                            widget.film,
                                            r'''$..ID''',
                                          ),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.remove_circle,
                                      color: Colors.black,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.85, -0.88),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              context.pushNamed('MoviesDisplay');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          )
        ));
  }
}
