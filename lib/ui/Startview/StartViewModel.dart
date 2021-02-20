//import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sprinkle/services/Firebase_core.dart';
import 'package:sprinkle/services/locator.dart';
//import 'package:sprinkle/services/Third_party_services.dart';
import 'package:sprinkle/services/Firebase_auth.dart';
import 'package:sprinkle/services/Firebase_messaging.dart';
import 'package:sprinkle/services/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewmodel extends BaseViewModel {
  final PushNotificationService _pushNotificationService =
      locator<PushNotificationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final CoreService _coreservice = locator<CoreService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  // Future handlestart() async{
  //   await _coreservice.intialise();

  // }
  Future handleStartUpLogic() async {
    await _pushNotificationService.initialise();
    print("######################HandleStartUp@@@@@@@@@@@@@@@@@@@@@@@@@@");
    var p = await _coreservice.getLogStatus();
    print(p);

    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (p == true) {
      //_navigationService.navigateTo(HomeViewRoute);
      return _navigationService.replaceWith(Routes.home);
      //_navigationService.navigateTo(Routes.home);
      //return Routes.home;
    } else if (hasLoggedInUser) {
      return _navigationService.replaceWith(Routes.home);
    } else {
      return _navigationService.replaceWith(Routes.loginView);
      //_navigationService.navigateTo(Routes.home);
      //return Routes.loginView;
      //_navigationService.navigateTo(Routes.loginView);
      //_navigationService.navigateTo(LoginViewRoute);
      //}
    }
  }
}
