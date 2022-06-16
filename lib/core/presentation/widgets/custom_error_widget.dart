import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomErrorWidget extends StatelessWidget {
  final VoidCallback onRetryPressed;

  const CustomErrorWidget({
    Key? key,
    required this.onRetryPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Text(
            'Something went wrong',
            style: GoogleFonts.pacifico(
              color: Theme.of(context).colorScheme.primary,
              textStyle: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Please try again',
            style: GoogleFonts.abel(
              color: Theme.of(context).colorScheme.secondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: onRetryPressed,
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
