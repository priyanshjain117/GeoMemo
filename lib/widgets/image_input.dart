import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({
    super.key,
    required this.onSelecctingImage,
  });
  final void Function(File image) onSelecctingImage;

  @override
  createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      imageQuality: 100,
      source: ImageSource.camera,
      // maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
    widget.onSelecctingImage(_selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(61, 255, 255, 255),
        ),
        color: const Color.fromARGB(66, 0, 0, 0),
      ),
      height: 250,
      width: double.infinity,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: TextButton.icon(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // ← your radius here
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          icon: const Icon(
            Icons.photo_camera,
          ),
          onPressed: _takePicture,
          label: Text('Add a Pic'),
        ),
      ),
    );

    if (_selectedImage != null) {
      content = Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(61, 255, 255, 255),
              ),
            ),
            height: 250,
            width: double.infinity,
            child: Image.file(
              _selectedImage!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            bottom: 3,
            left: 0,
            right: 0,
            child: Center(
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black26,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // ← your radius here
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                icon: const Icon(
                  Icons.replay_rounded,
                ),
                onPressed: _takePicture,
                label: Text(
                  'Retake',
                ),
              ),
            ),
          ),
        ],
      );
    }
    return content;
  }
}
