import 'dart:io';

import 'package:favourite_places/models/favourite_place.dart';
import 'package:favourite_places/providers/user_places.dart';
import 'package:favourite_places/widgets/image_input.dart';
import 'package:favourite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final TextEditingController _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  void _onSelectingImage(File image) {
    _selectedImage = image;
    _validateForm();
  }

  void _onSelectingLocation(PlaceLocation location) {
    _selectedLocation = location;
    _validateForm();
  }

  void _validateForm() {
    final isValid = _titleController.text.trim().isNotEmpty &&
        _selectedImage != null &&
        _selectedLocation != null;
    ref.read(addBttnProvider.notifier).state = isValid;
  }

  @override
  void initState() {
    super.initState();
    _titleController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isButtonEnabled = ref.watch(addBttnProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add new Place",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ImageInput(
                  onSelecctingImage: _onSelectingImage,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: "Title",
                  ),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  controller: _titleController,
                ),
                const SizedBox(
                  height: 14,
                ),
                LocationInput(
                  onSelectLocation: _onSelectingLocation,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.add_task),
                  onPressed: isButtonEnabled
                      ? () {
                          ref.read(userPlacesProvider.notifier).addPlace(
                                title: _titleController.text,
                                imageFile: _selectedImage!,
                                location: _selectedLocation!,
                              );
                          Navigator.of(context).pop();
                        }
                      : null,
                  label: const Text(
                    "Add Place",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
