import 'package:flutter/material.dart';

void showModalSheetCustom({required BuildContext context, required List<Widget> children}){
  showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return IntrinsicHeight(
                child: Column(
                  children: children,
                ),
              );
            },
          );

}