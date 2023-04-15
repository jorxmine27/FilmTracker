import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'content_trailer_model.dart';
export 'content_trailer_model.dart';

class ContentTrailerWidget extends StatefulWidget {
  const ContentTrailerWidget({
    Key? key,
    this.film,
    this.filmMedia,
  }) : super(key: key);

  final dynamic film;
  final dynamic filmMedia;

  @override
  _ContentTrailerWidgetState createState() => _ContentTrailerWidgetState();
}

class _ContentTrailerWidgetState extends State<ContentTrailerWidget> {
  late ContentTrailerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContentTrailerModel());
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
                        alignment: AlignmentDirectional(0.05, -0.92),
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
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 842.6,
                decoration: BoxDecoration(
                  color: Color(0x00FCFCFC),
                ),
                child: Container(
                  height: 184.1,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.04),
                        child: Container(
                          width: 395.8,
                          height: 371.5,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.98, -0.83),
                                child: Text(
                                  'Sinopsis',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Jura',
                                        fontSize: 25.0,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 402.4,
                                  height: 235.8,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: FlutterFlowYoutubePlayer(
                                    url: getJsonField(
                                      widget.film,
                                      r'''$.TRAILER''',
                                    ),
                                    autoPlay: false,
                                    looping: true,
                                    mute: false,
                                    showControls: true,
                                    showFullScreen: false,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.85, -0.8),
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
                                alignment: AlignmentDirectional(-0.39, -0.91),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.video_label_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed(
                                      'SinopsisContent',
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
                                alignment: AlignmentDirectional(-0.11, -0.84),
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
                                    size: 35.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.22, -0.84),
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
                                    size: 35.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.65, -0.89),
                                child: ToggleIcon(
                                  onPressed: () async {
                                    setState(() => FFAppState().toggle =
                                        !FFAppState().toggle);
                                  },
                                  value: FFAppState().toggle,
                                  onIcon: Icon(
                                    Icons.star_sharp,
                                    color: FlutterFlowTheme.of(context).warning,
                                    size: 40.0,
                                  ),
                                  offIcon: Icon(
                                    Icons.star_sharp,
                                    color: FlutterFlowTheme.of(context).warning,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.04, 0.91),
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
                                    height: 49.8,
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
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          child: Image.network(
                            getJsonField(
                              widget.film,
                              r'''$.IMAGEN''',
                            ),
                            width: 405.2,
                            height: 500.7,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.87, -0.88),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 60.0,
                          fillColor: Colors.transparent,
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
            ],
          ),
        ),
      ),
    );
  }
}
