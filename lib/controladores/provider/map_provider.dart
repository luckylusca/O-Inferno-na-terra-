import 'package:flutter/cupertino.dart';
import 'package:mobile_sistem/data/dummy_maps.dart';

import '../map.dart';

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
  }
}
