import 'map_page_model.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'map_page_model.dart';
export 'map_page_model.dart';

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({
    Key? key,
    this.ubicaciones,
  }) : super(key: key);

  final dynamic ubicaciones;

  @override
  _MapPageWidgetState createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  late MapPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final PopupController _popupLayerController = PopupController();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapPageModel());
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
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme
            .of(context)
            .primaryBackground,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 589.4,
                height: 109.7,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.88, 0.03),
                      child: Text(
                        'MAP',
                        style: FlutterFlowTheme
                            .of(context)
                            .bodyMedium
                            .override(
                          fontFamily: 'Jura',
                          color: Colors.white,
                          fontSize: 38.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.92, 0.15),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 45.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<ApiCallResponse>(
                  future: CineByIdCall.call(
                    idCine: FFAppState().idCine
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitCubeGrid(
                            color: FlutterFlowTheme
                                .of(context)
                                .primary,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    final googleMapCineByIdResponse = snapshot.data!;
                    final Ubicaciones = functions.marcadores(googleMapCineByIdResponse);
                    return FlutterMap(
                      options: MapOptions(
                        center: functions.center(googleMapCineByIdResponse),
                        zoom: 17.0,
                        onTap: (_, __) =>
                            _popupLayerController.hideAllPopups(),
                      ),
                      nonRotatedChildren: [
                        AttributionWidget.defaultWidget(
                          source: 'OpenStreetMap contributors',
                          onSourceTapped: null,
                        ),
                      ],
                      children: [
                        TileLayer(
                          urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        PopupMarkerLayerWidget(
                          options: PopupMarkerLayerOptions(
                              popupController: _popupLayerController,
                              markers: [
                                Ubicaciones
                              ],
                          ),),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
