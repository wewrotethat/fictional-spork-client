import 'package:flutter/material.dart';

import 'package:fictional_spork/features/home/domain/value_objects/test_status.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({
    Key? key,
    required this.specimenOnly,
    required this.testStatus,
  }) : super(key: key);

  final bool specimenOnly;
  final TestStatus testStatus;

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
          if (testStatus != TestStatus.resultReady || specimenOnly)
            Image.network(
              'https://pixnio.com/free-images/science/microscopy-images'
              '/malaria-plasmodium/plasmodium-falciparum-malarial-parasite'
              '-which-was-found-in-a-blood-sample-from-a-patient-850x565.jpg',
              height: 200,
            ),
          if (testStatus == TestStatus.resultReady && !specimenOnly)
            Image.network(
              'https://www.researchgate.net/profile/Courosh-Mehanian/publication'
              '/322649628/figure/fig5/AS:631599410454566@1527596442591/An-FoV-'
              'image-of-a-negative-sample-ie-with-no-malaria-parasites-WBCs-are-'
              'indicated.png',
              height: 200,
            ),
          const SizedBox(
            height: 40,
          ),
          if (testStatus == TestStatus.queued) _buildReUploadButton(context)
        ],
      ),
    );
  }

  Widget _buildReUploadButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.secondary),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 40),
        ),
      ),
      child: const Text('Change Specimen Image'),
    );
  }
}
