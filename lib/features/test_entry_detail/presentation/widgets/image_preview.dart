import 'package:cached_network_image/cached_network_image.dart';
import 'package:fictional_spork/core/core.dart';
import 'package:flutter/material.dart';

import 'package:fictional_spork/features/home/domain/value_objects/test_status.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          CachedNetworkImage(
            imageUrl: '$imageUrl?${DateTime.now().microsecondsSinceEpoch}',
            placeholder: (_, __) => const CustomLoadingIndicator(),
            fit: BoxFit.contain,
            width: double.infinity,
            height: 350,
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
