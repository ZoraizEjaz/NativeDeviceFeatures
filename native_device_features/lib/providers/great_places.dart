import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [
      ..._items
    ]; // we add [] while returning the list so that we can return the copy
  }

  void addPlace(
    String pickedTitle,
    File pickedmage,
  ) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        address: null,
        image: pickedmage);

    _items.add(newPlace);
    notifyListeners();
  }
}
