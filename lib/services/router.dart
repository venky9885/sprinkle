import 'package:auto_route/auto_route_annotations.dart';
import 'package:sprinkle/ui/Login/login_view.dart';
import 'package:sprinkle/ui/Sign_up/sign_up_view.dart';
//import 'package:stacked/stacked.dart';
//import '../ui/views/startup/startup_view.dart';
//import 'package:sprinkle/view/ui/Login_ui/Screens/Login/login_screen.dart';
//import 'package:sprinkle/view/ui/Login_ui/Screens/Signup/signup_screen.dart';
import 'package:sprinkle/ui/Home/home_view.dart';
import 'package:sprinkle/ui/Startview/splash.dart';
import 'package:sprinkle/ui/page/page.dart';
//import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: SecondPage),
  MaterialRoute(page: Home),
  MaterialRoute(page: Splash, initial: true),
])
class $Router {
  //@initial
  //StartupView start;
  //HomeView home;
}
