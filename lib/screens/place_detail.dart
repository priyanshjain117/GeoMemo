import 'package:favourite_places/models/favourite_place.dart';
import 'package:flutter/material.dart';

class PlaceDetail extends StatelessWidget {
  const PlaceDetail({
    super.key,
    required this.place,
  });
  final FavouritePlace place;

  String get locationImage {
    final lat = place.location.latitude;
    final lng = place.location.longitude;
    final staticMapUrl = 'https://static-maps.yandex.ru/1.x/'
        '?ll=$lng,$lat'
        '&z=17' // zoom level
        '&size=600,300' // image size
        '&l=sat,skl' // satellite + labels
        '&pt=$lng,$lat,pm2rdl'; // marker style
    return staticMapUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          place.title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
      body: Stack(
        children: [
          Hero(
            tag: place.id,
            child: Image.file(
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              place.imageFile,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: const Color.fromARGB(110, 146, 115, 229), 
                  child: ClipOval(
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      locationImage,
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.broken_image,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromRGBO(0, 0, 0, 0),
                        Colors.black87,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Text(
                    place.location.address,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w100,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
