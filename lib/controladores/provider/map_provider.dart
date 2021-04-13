import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mobile_sistem/data/dummy_maps.dart';
import 'package:mobile_sistem/controladores/mapa.dart';

class Maps with ChangeNotifier {
  final Map<String, Mapa> _items = {...DUMMY_MAPAS};

  List<Mapa> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Mapa byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Mapa mapa) {
    if (mapa == null) {
      return;
    }

    if (mapa.id != null &&
        mapa.id.trim().isNotEmpty &&
        _items.containsKey(mapa.id)) {
      _items.update(
          mapa.id,
          (_) => Mapa(
              id: mapa.id,
              relato: mapa.relato,
              locationLatitude: mapa.locationLatitude,
              locationLongitude: mapa.locationLongitude));
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => Mapa(
              id: id,
              relato: mapa.relato,
              locationLatitude: mapa.locationLatitude,
              locationLongitude: mapa.locationLongitude));
    }
    notifyListeners();
  }

  void remove(Mapa mapa) {
    if (mapa != null && mapa.id != null) {
      _items.remove(mapa.id);
      notifyListeners();
    }
  }
}
