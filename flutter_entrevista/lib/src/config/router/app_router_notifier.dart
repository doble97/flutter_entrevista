import 'package:flutter/material.dart';
import 'package:flutter_entrevista/src/presentation/state/auth/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final goRouterNotifierProvider = Provider((ref) {
  final authNotifier = ref.read(authProvider.notifier);
  return GoRouterNotifier(authNotifier); 
});

class GoRouterNotifier extends ChangeNotifier {
  final AuthNotifier _authNotifier;
  bool isAuthenticated = false;
  GoRouterNotifier(this._authNotifier) {
    _authNotifier.addListener((state) {
      makeAuthentication(state.userStatus == UserStatus.authenticated);
    });
  }

  void makeAuthentication(bool value) {
    isAuthenticated = value;
    notifyListeners();
  }
}
