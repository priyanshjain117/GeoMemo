import 'package:flutter/material.dart';

class EmptyScreenInfo extends StatelessWidget {
  const EmptyScreenInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          "No place added yet..",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      );
  }
}