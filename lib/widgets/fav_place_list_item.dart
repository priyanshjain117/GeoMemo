import 'package:favourite_places/models/favourite_place.dart';
import 'package:favourite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';

class FavPlaceListItem extends StatelessWidget {
  const FavPlaceListItem({super.key, required this.place});
  final FavouritePlace place;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 25),
      leading: Hero(
        tag: place.id,
        child: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(place.imageFile),
        ),
      ),
      title: Text(
        place.title,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: Text(
        place.location.address,
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w100),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => PlaceDetail(
              place: place,
            ),
          ),
        );
      },
    );
  }
}
