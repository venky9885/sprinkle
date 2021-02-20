import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart' as a;
import 'Firestore_service.dart';
import 'package:sprinkle/services/locator.dart';
import 'package:sprinkle/model/user.dart';
import 'package:sprinkle/services/Firebase_core.dart';
//import 'package:injectable/injectable.dart';

//@lazySingleton
class AuthenticationService {
  final a.FirebaseAuth _firebaseAuth = a.FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final CoreService _coreservice = locator<CoreService>();

  User _currentUser;
  User get currentUser => _currentUser;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var j = await _coreservice.getLogStatus();
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if ((user != null) == true) {
        if (j == false) {
          //logic for cache delete Startup logic
          _coreservice.addEmail(email);
        }
      }
      return user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String fullName,
    @required String role,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      _currentUser = User(
        id: authResult.user.uid,
        email: email,
        fullName: fullName,
        userRole: role,
      );
      await _coreservice.addEmail(email);
      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    a.User userd = _firebaseAuth.currentUser;
    await _populateCurrentUser(userd);
    return userd != null;
  }

  Future _populateCurrentUser(a.User user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
  // Future loginWithEmail({@required String email, @required String password}) {
  //   // TODO: implement loginWithEmail
  //   return null;
  // }

  // Future signUpWithEmail({@required String email, @required String password}) {
  //   // TODO: implement signUpWithEmail
  //   return null;
  // }
}
