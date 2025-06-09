import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favourite_places/providers/user_places.dart';
import 'package:favourite_places/models/favourite_place.dart';
import 'package:favourite_places/widgets/empty_screen_info.dart';
import 'package:favourite_places/widgets/fav_place_list_item.dart';
import 'package:favourite_places/screens/add_place_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Future<void> futureData;

  @override
  void initState() {
    super.initState();
    futureData = ref.read(userPlacesProvider.notifier).loadData();
  }

  @override
  Widget build(BuildContext context) {
    final List<FavouritePlace> favPlaces = ref.watch(userPlacesProvider);
    late Widget content;

    void addItem() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => AddPlaceScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GeoMemo - Fav Place App",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                addItem();
              },
              icon: const Icon(
                Icons.add,
              )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surfaceBright,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FutureBuilder(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                content = Center(
                  child: CircularProgressIndicator(),
                );
              } else if (favPlaces.isEmpty) {
                content = EmptyScreenInfo();
              } else {
                content = ListView.builder(
                  itemCount: favPlaces.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Dismissible(
                      key: ValueKey(favPlaces[index].id),
                      onDismissed: (direction) {
                        final removedPlace = favPlaces[index];
                        final removedIndex = index;

                        ref
                            .read(userPlacesProvider.notifier)
                            .removePlace(removedPlace);

                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Removed "${removedPlace.title}"'),
                            duration: Duration(seconds: 3),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                ref
                                    .read(userPlacesProvider.notifier)
                                    .insertPlaceAt(
                                      removedPlace,
                                      removedIndex,
                                    );
                              },
                            ),
                          ),
                        );
                      },
                      child: FavPlaceListItem(
                        place: favPlaces[index],
                      ),
                    ),
                  ),
                );
              }
              return content;
            }),
      ),
    );
  }
}
