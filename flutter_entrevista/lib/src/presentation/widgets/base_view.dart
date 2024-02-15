import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
   BaseView({required this.child, this.appBar,this.floatingActionButton,super.key});
  Widget child;
  AppBar? appBar;
  Widget? floatingActionButton;
  @override
  Widget build(BuildContext context) {
    final double padding = MediaQuery.paddingOf(context).top + MediaQuery.paddingOf(context).bottom;
    final double appBarHeight = appBar!=null ? appBar!.preferredSize.height : 0;
    final double height = MediaQuery.sizeOf(context).height;
    final double total = height - (padding+appBarHeight);

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(child: Container(height: total,child: SafeArea(bottom: false, top: false,child: child))),
      floatingActionButton: floatingActionButton,
    );
  }
}
