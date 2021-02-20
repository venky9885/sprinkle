import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'Firebase_auth.dart';
import 'Firebase_core.dart';
import 'Firestore_service.dart';
import 'Firebase_messaging.dart';
import '../ui/Posts/post_view_model.dart';
import 'api.dart';
import 'post_service.dart';

@module
abstract class ThirdPartyServicesModules {
  @lazySingleton
  NavigationService get navigationservice;
  @lazySingleton
  DialogService get dialogservice;
  @lazySingleton
  AuthenticationService get authenticationService;
  @lazySingleton
  CoreService get coreservice;
  @lazySingleton
  FirestoreService get firestroreservice;
  @lazySingleton
  PushNotificationService get pushnotificationservice;
  @lazySingleton
  PostsViewModel get postviewmodel;
  @lazySingleton
  Api get api;
  @lazySingleton
  PostsService get postservice;
}
