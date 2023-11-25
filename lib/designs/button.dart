import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.inputController,
    required this.text,
    required this.onTap,
  });

  final TextEditingController inputController;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      child: Text(
        text,
      ),
    );
  }
}
