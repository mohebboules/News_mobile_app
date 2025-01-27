import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "News ",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        Text(
          "Cloud",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
