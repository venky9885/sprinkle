import 'package:stacked/stacked.dart';

import 'package:flutter/foundation.dart';
import 'package:sprinkle/services/locator.dart';
import 'package:sprinkle/services/Firebase_auth.dart';
import 'package:sprinkle/services/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _selectedRole = 'Select a User Role';
  String get selectedRole => _selectedRole;

  void setSelectedRole(dynamic role) {
    _selectedRole = role;
    notifyListeners();
  }

  Future navigateToLogin() async {
    await _navigationService.navigateTo(Routes.loginView);
  }

  Future signUp({
    @required String email,
    @required String password,
    @required String fullName,
  }) async {
    setBusy(true);
    print(email.toString() + password.toString());
    var result = await _authenticationService.signUpWithEmail(
        email: email,
        password: password,
        fullName: fullName,
        role: _selectedRole);

    setBusy(false);
    if (result is bool) {
      if (result) {
        _navigationService.replaceWith(Routes.home);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
          dialogPlatform: DialogPlatform.Cupertino,
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
}
