import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final void Function()? callback;

  const CustomButton({
    super.key, required this.child, this.callback
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                20.0), // Redondea los bordes del botón
          ),
          minimumSize:
              Size(100, 100), // Establece el tamaño mínimo del botón
        ),
        onPressed: callback,
        child: child);
  }
}
