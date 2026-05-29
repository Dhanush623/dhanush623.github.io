import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactIconButton extends StatelessWidget {
  const ContactIconButton(
      {super.key, required this.handle, required this.icon, this.size});
  final VoidCallback handle;
  final FaIconData icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: handle,
      icon: FaIcon(
        icon,
        size: size,
      ),
    );
  }
}
