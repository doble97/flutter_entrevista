import 'package:flutter/material.dart';
import 'package:flutter_entrevista/src/infrastructure/datasources/remote_auth_datasource.dart';
import 'package:flutter_entrevista/src/infrastructure/repositories/remote_auth_repository.dart';
import 'package:flutter_entrevista/src/presentation/state/auth/auth_provider.dart';
import 'package:flutter_entrevista/src/presentation/widgets/base_view.dart';
import 'package:flutter_entrevista/src/presentation/widgets/snack_bar_custom.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String name = "Login Screen";
  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: LoginForm(),
      appBar: AppBar(
        title: const Text('Login'),
      ),
    );
  }
}

class LoginForm extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool enabledButton = true;
  LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authProvider, (previous, next){
      if(next.userStatus==UserStatus.notAuthenticated){
          enabledButton = true;
          showSnackBarCustom(context, next.message);
      }
    });
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'example@gmail.com',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes manejar la lógica para el inicio de sesión
                if(enabledButton){
                  String email = _emailController.text;
                String password = _passwordController.text;
                enabledButton= false;
                ref.read(authProvider.notifier).login(email: email, password: password);
                }                
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
