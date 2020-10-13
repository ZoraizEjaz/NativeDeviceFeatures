import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/place.dart';
import '../helpers/db_helper.dart';

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
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    print(dataList);
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            address: null,
          ),
        )
        .toList();

    print(_items);

    notifyListeners();
  }
}
