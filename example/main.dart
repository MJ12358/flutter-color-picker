import 'package:flutter/material.dart';
import 'package:flutter_color_pickr/flutter_color_pickr.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  void _onTap(Color value) {}

  @override
  Widget build(BuildContext context) {
    return FlutterColorPickr(
      onTap: (Color value) => _onTap(value),
    );
  }
}
