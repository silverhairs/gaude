import 'package:flutter/material.dart';

class CenteredCircledIndicator extends StatelessWidget {
  const CenteredCircledIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: kMinInteractiveDimension,
        width: kMinInteractiveDimension,
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
