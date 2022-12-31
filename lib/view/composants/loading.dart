import 'package:flutter/material.dart';

/// Widget pour afficher un CircularProgressIndicator (widget circulaire qui indique un chargement)

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
        )
    );
  }
}
