import 'package:stacked/stacked.dart';
import 'package:sprinkle/model/post.dart';
//import 'package:sprinkle/services/router.gr.dart';
//import 'package:stacked_services/stacked_services.dart';
import 'package:sprinkle/services/post_service.dart';
import 'package:sprinkle/services/locator.dart';

class PostsViewModel extends FutureViewModel<List<Post>> {
  final PostsService _postsservice = locator<PostsService>();

  // List<Post> _posts;
  // List<Post> get posts => _posts;

  // bool get hasPosts => _posts != null && _posts.isNotEmpty;

  // Future<List<Post>> getPostsForUser(int userId) async {
  //   _posts = await _api.getPostsForUser(userId);
  //   return _posts;
  // }
  @override
  Future<List<Post>> futureToRun() {
    return _postsservice.getPostsForUser(3);
  }
  //FutureViewModel.futureToRun

}
