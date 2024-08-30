import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/blocs/blocs.dart';

import 'package:maps_app/themes/uber.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {

  final LocationBloc locationBloc;
  GoogleMapController? _mapController;

  MapBloc({required this.locationBloc}) : super(MapState()) { // estado inicial
    on<MapEvent/* cuando se ejecuta el evento */ >((event, emit) {

    });

    on<OnMapInitialzedEvent /* cuando se ejecuta el evento */>(_onInitMap);

    locationBloc.stream.listen((locationState){ /* escucha los cambios */
      if( !state.followUser) return;
      if( locationState.lastKnownLocation == null ) return;

      moveCamera(locationState.lastKnownLocation!);
    });

  }

  void _onInitMap( OnMapInitialzedEvent event, Emitter<MapState> emit){
    _mapController = event.controller;
    _mapController!.setMapStyle(  jsonEncode(uberMapTheme) );

    emit( state.copyWith(isMapInitialized: true)); /* emite el evento */
  }


  void moveCamera(LatLng newLocation){
    final cameraUpdate = CameraUpdate.newLatLng( newLocation );
    _mapController?.animateCamera(cameraUpdate);
  }

}
