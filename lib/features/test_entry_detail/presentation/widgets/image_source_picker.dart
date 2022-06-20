import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:fictional_spork/core/core.dart';
import 'package:fictional_spork/features/test_entry_detail/presentation/bloc/upload_sample_image/upload_sample_image_cubit.dart';
import 'package:fictional_spork/features/test_entry_detail/presentation/bloc/upload_sample_image/upload_sample_image_state.dart';

class ImageSourcePicker extends StatefulWidget {
  const ImageSourcePicker({
    Key? key,
    required this.id,
    required this.onUpload,
  }) : super(key: key);
  final String id;
  final VoidCallback onUpload;

  @override
  State<ImageSourcePicker> createState() => _ImageSourcePickerState();
}

class _ImageSourcePickerState extends State<ImageSourcePicker> {
  bool permissionGranted = false;
  final _uploadImageCubit = UploadSampleImageCubit();

  @override
  void initState() {
    super.initState();
    [
      Permission.storage,
      Permission.camera,
    ].request().then((value) {
      setState(() {
        permissionGranted = true;
      });
    });
  }

  void chooseImage(
    BuildContext ctx,
    ImageSource imageSource,
    String id,
  ) async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(
      source: imageSource,
    );

    if (image != null) {
      _uploadImageCubit.upload(id, image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UploadSampleImageCubit, UploadSampleImageState>(
        bloc: _uploadImageCubit,
        listener: (context, state) {
          if (state is UploadSampleImageSuccess) {
            widget.onUpload();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Image uploaded successfully'),
              ),
            );
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          if (state is UploadSampleImageLoading) {
            return const Center(
              child: CustomLoadingIndicator(),
            );
          }

          if (permissionGranted) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                ElevatedButton(
                  onPressed: () {
                    //Choose from camera
                    // authProvider.uploadProfilePicture(source: ImageSource.camera);

                    chooseImage(context, ImageSource.camera, widget.id);
                  },
                  child: const Text('Camera'),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    chooseImage(context, ImageSource.gallery, widget.id);
                  },
                  child: const Text('Gallery'),
                ),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Asking for Permission..."),
              ],
            );
          }
        },
      ),
    );
  }
}
