
import 'package:flutter/material.dart';

class FloatingButtonCustom extends StatelessWidget {

  final IconData icon;
  final void Function()? callback;

  const FloatingButtonCustom({
    super.key, required this.icon, this.callback
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: callback

    ,child: Icon(icon),);
  }
}