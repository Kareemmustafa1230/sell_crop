import 'package:flutter/material.dart';

class DividerApp extends StatelessWidget {
  const DividerApp({super.key, required this.color});
  final Color color ;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Divider(
        color: color,
        thickness: 1.2,
      ),
    );
  }
}
