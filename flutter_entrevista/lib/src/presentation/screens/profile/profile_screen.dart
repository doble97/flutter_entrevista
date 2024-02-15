import 'package:flutter/material.dart';
import 'package:flutter_entrevista/src/domain/entities/user.dart';
import 'package:flutter_entrevista/src/presentation/state/auth/auth_provider.dart';
import 'package:flutter_entrevista/src/presentation/widgets/base_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends StatelessWidget {
  static String name = 'Profile Screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: AppBar(title: Text(name)),
      child: _UserWidget(),
    );
  }
}

class _UserWidget extends ConsumerWidget {
  const _UserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.read(authProvider).auth?.user;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ListTile(
          title: Text(
            'Id de empleado',
            textAlign: TextAlign.center,
          ),
          subtitle: Text(user?.id.toString() ?? 'Nothing', textAlign: TextAlign.center),
        ),
        ListTile(
          title: Text(
            'Nombre',
            textAlign: TextAlign.center,
          ),
          subtitle: Text(user?.name ?? 'Nothing', textAlign: TextAlign.center),
        ),
        ListTile(
          title: Text(
            'email',
            textAlign: TextAlign.center,
          ),
          subtitle: Text(user?.email ?? 'Nothing', textAlign: TextAlign.center),
        ),
        ListTile(
          title: Text(
            'Fecha de alta',
            textAlign: TextAlign.center,
          ),
          subtitle: Text(user?.createdAt.toString() ?? 'Nothing', textAlign: TextAlign.center),
        ),
        
      ],
    );
  }
}
