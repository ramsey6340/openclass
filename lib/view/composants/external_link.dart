import 'package:flutter/material.dart';

/// Widget pour permettre de créer des liens externe comme par exemple le lien de la "Politique de confidentialité"

class ExternalLink extends StatelessWidget
{
  const ExternalLink({Key ? key, required this.color, required this.text, required this.destination}):super(key: key);

  final Color color;
  final String text;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(text, style: TextStyle(color: color,fontSize: 16,decoration: TextDecoration.underline)),
      onTap: () => Navigator.pushNamed(context, destination),
    );
  }
}