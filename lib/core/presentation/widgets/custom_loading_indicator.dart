import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: LoadingIndicator(
          indicatorType: Indicator.lineScalePulseOutRapid,

          /// Required, The loading type of the widget
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.errorContainer,
            Theme.of(context).colorScheme.secondary,
          ],

          /// Optional, The color collections
          strokeWidth: 2,

          /// Optional, The stroke of the line, only applicable to widget which contains line
          backgroundColor: Colors.transparent,

          /// Optional, Background of the widget
          pathBackgroundColor: Colors.transparent

          /// Optional, the stroke backgroundColor
          ),
    );
  }
}
