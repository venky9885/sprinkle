import 'package:stacked/stacked.dart';
import 'package:sprinkle/services/Firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:sprinkle/services/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:sprinkle/services/locator.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  Future navigateToSignUp() async {
    await _navigationService.navigateTo(Routes.signUpView);
  }

  Future login({@required String email, @required String password}) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
        email: email, password: password);

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.replaceWith(Routes.home);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'Couldn\'t login at this moment. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }
}
