import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double width;
  const LoadingWidget({
    Key? key,
    this.width = 32,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: SizedBox(
            width: width,
            height: width,
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
              strokeWidth: width / 8,
            ),
          ),
        ),
      ),
    );
  }
}
