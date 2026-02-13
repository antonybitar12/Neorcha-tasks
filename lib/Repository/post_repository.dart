import 'package:neorchatasks/ApiProvider/post_api.dart';
import 'package:neorchatasks/Models/post_model.dart';

class PostRepository {
  final PostApi postApi;

  PostRepository(this.postApi);

  Future<List<Post>> loadPosts() async {
    dynamic map = await postApi.fetchPosts();
    List<Post> posts = (map as List)
        .map((j) => Post.fromJson(j as Map<String, dynamic>))
        .toList();
    return posts;
  }
}
