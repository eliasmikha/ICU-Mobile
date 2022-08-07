import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../../../../core/navigation/nav.dart';
import '../../screen/person_details/person_details_screen.dart';

class PersonDetailsScreenNotifier extends ScreenNotifier {
  /// Constructors
  PersonDetailsScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final PersonDetailsScreenParam param;
  final imagePicker = ImagePicker();
  File? _image;

  /// Getters and Setters
  File? get image => _image;
  set image(File? value) {
    _image = value;
    notifyListeners();
  }

  /// Methods
  void pickImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    Timer(const Duration(seconds: 3), Nav.pop);
    await showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Generating Face Features...'),
          content: FittedBox(
            fit: BoxFit.scaleDown,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
    if (_image == null) {
      await showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Failed!'),
            content: Text(
                'This image does\'t have a face! please upload a valid image'),
            actions: [
              TextButton(
                onPressed: Nav.pop,
                child: Text('ok'),
              ),
            ],
          );
        },
      );
      _image = image == null ? null : File(image.path);
    } else {
      Timer(const Duration(seconds: 3), Nav.pop);
      await showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Uploading...'),
            content: FittedBox(
              fit: BoxFit.scaleDown,
              child: CircularProgressIndicator(),
            ),
          );
        },
      );
      _image = image == null ? null : File(image.path);
      notifyListeners();
    }
  }

  @override
  void closeNotifier() {
    this.dispose();
  }
}
