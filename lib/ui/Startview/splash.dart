import 'package:flutter/material.dart';
//import 'package:provider_architecture/provider_architecture.dart';
import 'package:stacked/stacked.dart';
import 'StartViewModel.dart';
//import 'package:sprinkle/view/ui/Login_ui/Screens/Welcome/components/body.dart';
//import 'package:sprinkle/services/router.gr.dart';
/*import 'locator.dart';
import 'package:sprinkle/services/Firebase_core.dart';
//import 'splash.dart';
import 'package:sprinkle/ui/Login/login_view.dart';
import 'package:sprinkle/services/router.gr.dart';
import 'home.dart';
import 'package:stacked_services/stacked_services.dart';

final CoreService _coreservice = locator<CoreService>();
final NavigationService _navigationService = locator<NavigationService>();*/

/*
class Splash extends StatelessWidget {
  Future ass() async {
    var p = await _coreservice.getLogStatus();
    print(p);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //print(_coreservice.getLogStatus());
      future: ass(),
      builder: (ctx, userSnapshot) {
        print(userSnapshot.data);
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          print(userSnapshot.data);
          return Body();
        }
        if ((userSnapshot.data) == true) {
          print(userSnapshot.data);
          //return 
          _navigationService.replaceWith(Routes.home);
        }
        ass();
        //return 
        _navigationService.replaceWith(Routes.loginView);
      },
    );
  }
}
*/
//4555555899*++++++667979

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Splash------################### Rebuild");
    return ViewModelBuilder<StartUpViewmodel>.reactive(
      //viewModel: StartUpViewmodel(),

      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      viewModelBuilder: () => StartUpViewmodel(),
    );
  }
}
