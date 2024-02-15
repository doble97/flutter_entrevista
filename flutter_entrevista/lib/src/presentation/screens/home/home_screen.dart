import 'package:flutter/material.dart';
import 'package:flutter_entrevista/src/presentation/screens/office/office_screen.dart';
import 'package:flutter_entrevista/src/presentation/screens/profile/profile_screen.dart';
import 'package:flutter_entrevista/src/presentation/state/auth/auth_provider.dart';
import 'package:flutter_entrevista/src/presentation/widgets/base_view.dart';
import 'package:flutter_entrevista/src/presentation/widgets/custom_button.dart';
import 'package:flutter_entrevista/src/presentation/widgets/floating_button_custom.dart';
import 'package:flutter_entrevista/src/presentation/widgets/modal_bottom_sheet_custom.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  static String name = 'Home Screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseView(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        floatingActionButton: FloatingButtonCustom(
          icon: Icons.menu,
          callback: () {
            showModalSheetCustom(context: context, children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Ver perfil'),
                onTap: () {
                  GoRouter.of(context).pushNamed(ProfileScreen.name);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Cerrar cesión'),
                onTap: () {
                  ref.read(authProvider.notifier).logout();
                },
              ),
            ]);
          },
        ),
        child:  Padding(
          padding: EdgeInsets.symmetric(horizontal:16.0),
          child: Column(
          
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(child: Text('Oficinas'), callback:(){
                context.pushNamed(OfficeScreen.name);
              },),
              CustomButton(child: Text('Reportes')),
              CustomButton(child: Text('Otros')),
            ],
          ),
        ));
  }
}

