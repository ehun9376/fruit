import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class SimpleImagePickerViewModel extends ChangeNotifier {
  File? get image => _image;
  File? _image;
  void setNewImage(File? newValue) {
    _image = newValue;
    notifyListeners();
  }
}

class SimpleImagePicker extends StatelessWidget {
  SimpleImagePicker(
      {super.key,
      this.defaultImage,
      this.imagePickerSelected,
      required this.showAtSelf});

  final File? defaultImage;
  final bool showAtSelf;
  final Function(File? file)? imagePickerSelected;

  final SimpleImagePickerViewModel _viewModel = SimpleImagePickerViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SimpleImagePickerViewModel>.value(
      value: _viewModel,
      builder: (context, child) {
        return Consumer<SimpleImagePickerViewModel>(
          builder: (context, viewModel, child) {
            File? photo = viewModel.image ?? defaultImage;

            if (showAtSelf && photo != null) {
              return GestureDetector(
                onTap: () async {
                  var image =
                      await ImagePicker().pickImage(source: ImageSource.camera);

                  if (image != null) {
                    viewModel.setNewImage(File(image.path));
                  }
                  if (imagePickerSelected != null && viewModel.image != null) {
                    imagePickerSelected!(viewModel.image);
                  }
                },
                child: Image.file(
                  photo,
                ),
              );
            } else {
              return SimpleImage(
                icon: Icons.photo_camera_rounded,
                color: LayoutColor.pinkEC588A,
                iconSize: 40,
              ).inkWell(onTap: () async {
                var image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (image != null) {
                  viewModel.setNewImage(File(image.path));
                }
                if (imagePickerSelected != null && viewModel.image != null) {
                  imagePickerSelected!(viewModel.image);
                }
              });
            }
          },
        );
      },
    );
  }

  // Future<void> _getImageFromGallery() async {
  //   var image = await ImagePicker().pickImage(source: ImageSource.gallery);

  //   if (image != null) {
  //     viewModel.setNewImage(File(image.path));
  //   }
  //   if (imagePickerSelected != null && viewModel.image != null) {
  //     imagePickerSelected!(viewModel.image);
  //   }
  // }
}
