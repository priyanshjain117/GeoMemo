import 'dart:io';

import 'package:favourite_places/models/favourite_place.dart';

import 'package:riverpod/riverpod.dart';

import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<sql.Database> get _getDataBase async {
  final String dbPath = await sql.getDatabasesPath();
  final Database db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      print("hello database");
      print(db);
      print(version);
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY , title TEXT ,image TEXT ,lat REAL,lng REAL,address TEXT )');
    },
    version: 1,
  );
  return db;
}

class UserPlacesNotifier extends StateNotifier<List<FavouritePlace>> {
  UserPlacesNotifier() : super(const []);

  Future<void> loadData() async {
    final db = await _getDataBase;
    final data = await db.query(
      'user_places',
    );

    final loadedData = data
        .map(
          (row) => FavouritePlace(
            idProvided: row['id'] as String,
            title: row['title'] as String,
            imageFile: File(row['image'] as String),
            location: PlaceLocation(
              latitude: row['lat'] as double,
              longitude: row['lng'] as double,
              address: row['address'] as String,
            ),
          ),
        )
        .toList();

    state = loadedData;
  }

  void addPlace({
    required String title,
    required File imageFile,
    required PlaceLocation location,
  }) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(imageFile.path);

    final copiedImage = await imageFile.copy('${appDir.path}/$filename');

    FavouritePlace place = FavouritePlace(
        title: title, imageFile: copiedImage, location: location);

    final Database db = await _getDataBase;

    db.insert(
      'user_places',
      {
        'id': place.id,
        'title': title,
        'image': copiedImage.path,
        'lat': place.location.latitude,
        'lng': place.location.longitude,
        'address': place.location.address,
      },
    );
    state = [
      place,
      ...state,
    ];
  }

  void removePlace(FavouritePlace item) async {
    final db = await _getDataBase;
    await db.delete(
      'user_places',
      where: 'id = ?',
      whereArgs: [item.id],
    );

    state = state.where((p) => p.id != item.id).toList();
  }

  void insertPlaceAt(FavouritePlace place, int index) async {

    final db = await _getDataBase;

    await db.insert(
      'user_places',
      {
        'id': place.id,
        'title': place.title,
        'image': place.imageFile.path,
        'lat': place.location.latitude,
        'lng': place.location.longitude,
        'address': place.location.address,
      },
      conflictAlgorithm: sql.ConflictAlgorithm.replace, 
    );

    final updatedList = [...state];
    updatedList.insert(index, place);
    state = updatedList;

  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<FavouritePlace>>(
  (ref) => UserPlacesNotifier(),
);

final addBttnProvider = StateProvider<bool>(
  (ref) => false,
);
