import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../view_models/user_vm.dart';
import '../helper/size_config.dart';

class UserImagePicker extends StatefulWidget {
  // const UserImagePicker({ Key? key }) : super(key: key);
  final Function(XFile? pickedImage) imagePickFn;
  final String showType;

  UserImagePicker(this.imagePickFn, this.showType);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  XFile? _pickedImage;
  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      XFile? img = XFile(image.path);
      _pickedImage = await _cropImage(imageFile: img);
      widget.imagePickFn(_pickedImage);
      Navigator.of(context).pop();
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<XFile?> _cropImage({required XFile imageFile}) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedImage == null) return null;
    return XFile(croppedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: getProportionateScreenWidth(112),
          width: getProportionateScreenWidth(112),
          child: Stack(
            children: [
              widget.showType == "propic"
                  ? Consumer<UserVM>(
                      builder: (context, userData, child) => Container(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: (_pickedImage != null)
                                ? Image.file(
                                    File(_pickedImage!.path),
                                  )
                                : Image.network(
                                    userData.myUser.img,
                                  ),
                          ),
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: (_pickedImage != null)
                            ? Image.file(
                                File(_pickedImage!.path),
                              )
                            : Image.asset('assets/images/my_profile.png'),
                      ),
                    ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(
                      getProportionateScreenWidth(8),
                    ),
                    decoration: ShapeDecoration(
                        shape: const CircleBorder(side: BorderSide.none),
                        color: Theme.of(context).colorScheme.primary),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return SizedBox(
                            height: 100,
                            child: Column(
                              children: [
                                TextButton.icon(
                                  onPressed: () =>
                                      _pickImage(ImageSource.camera),
                                  icon: const Icon(Icons.camera_alt),
                                  label: const Text("Take a picture"),
                                ),
                                TextButton.icon(
                                  onPressed: () =>
                                      _pickImage(ImageSource.gallery),
                                  icon: const Icon(Icons.image_outlined),
                                  label: const Text("Select from pictures"),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
