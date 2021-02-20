import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:animations/animations.dart';
//import 'package:sprinkle/services/router.gr.dart';
//import 'package:stacked_services/stacked_services.dart';
//import 'package:sprinkle/services/locator.dart';
import '../page/page.dart';
import '../Posts/post_view.dart';
import 'home_view_model.dart';

class Home extends StatelessWidget {
  //final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[800],
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              label: 'Posts',
              icon: Icon(Icons.art_track),
            ),
            BottomNavigationBarItem(
              label: 'Todo List',
              icon: Icon(Icons.list),
            ),
          ],
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: model.reverse,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
            );
          },
          child: getViewForIndex(model.currentIndex),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return SecondPage();
      case 1:
        return PostsView();
      default:
        return SecondPage();
    }
  }
}

// Container(
//           child: Center(
//               child: RaisedButton(
//             child: Text('Navigate'),
//             onPressed: () async {
//               await _navigationService.navigateWithTransition(
//                 SecondPage(),
//                 transition: 'rotate',
//                 duration: Duration(milliseconds: 500),
//               );
//             },
//           )),
//         ),
