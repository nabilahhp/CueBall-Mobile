import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgorundColor;
  final Color iconColor;
  final double size;
  AppIcon({
    Key? key,
    required this.icon,
    this.backgorundColor = const Color(0xfffcf4e4),
    this.iconColor = const Color(0xff756d54),
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgorundColor),
      child: Icon(
        icon,
        color: iconColor,
        size: 16,
      ),
    );
  }
}
