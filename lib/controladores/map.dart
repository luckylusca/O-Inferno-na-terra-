import 'package:flutter/material.dart';

class Mapa {
  final String id;
  final String relato;
  final String locationLatitude;
  final String locationLongitude;

  const Mapa(
      {this.id,
      @required this.relato,
      @required this.locationLatitude,
      @required this.locationLongitude});
}
