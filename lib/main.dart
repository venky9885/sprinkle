import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
//import 'ui/views/home/home_view.dart';
import 'services/router.gr.dart' as k;
import 'package:sprinkle/services/locator.dart';

/*import 'package:sprinkle/services/Firebase_core.dart';
import 'splash.dart';
import 'package:sprinkle/ui/Login/login_view.dart';

import 'home.dart';

final CoreService _coreservice = locator<CoreService>();*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupLoactor();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final NavigationService _navigationService = locator<NavigationService>();
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: _initialization,
    //   builder: (context, appSnapshot) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: ExtendedNavigator.builder<k.Router>(
        router: k.Router(),
        initialRoute: k.Routes.splash,
        navigatorKey: StackedService.navigatorKey,
        //locator<NavigationService>().navigatorKey,
      ),
      onGenerateRoute: k.Router(),
      //home: Splash(),
      /*home: FutureBuilder(
          future: _coreservice.getLogStatus(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return Splash();
            }
            if (userSnapshot.hasData) {
              return Home();
            }
            return LoginView();
          }),*/
      //initialRoute: Routes.startupView,
      //onGenerateRoute: Router().onGenerateRoute,
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home: appSnapshot.connectionState != ConnectionState.done
      //     ? Container(
      //         child: Text('cont'),
      //       )
      //     : Container(
      //         child: Text('con5t'),
      //       ));
      //_navigationService.navigateTo(k.Routes.splash));
    );
    // },
    // );
  }
}

/*return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, appSnapshot) {
          return MaterialApp(
            title: 'FlutterChat',
            theme: ThemeData(
              primarySwatch: Colors.pink,
              backgroundColor: Colors.pink,
              accentColor: Colors.deepPurple,
              accentColorBrightness: Brightness.dark,
              buttonTheme: ButtonTheme.of(context).copyWith(
                buttonColor: Colors.pink,
                textTheme: ButtonTextTheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            home: appSnapshot.connectionState != ConnectionState.done
                ? SplashScreen()
                : StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (ctx, userSnapshot) {
                      if (userSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return SplashScreen();
                      }
                      if (userSnapshot.hasData) {
                        return ChatScreen();
                      }
                      return AuthScreen();
                    }),
          );
        });
*/
