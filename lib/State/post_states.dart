import 'package:neorchatasks/Models/post_model.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoadSuccess extends PostState {
  List<Post> posts;

  PostLoadSuccess({required this.posts});
}

class PostLoadFailure extends PostState {
  final String error;

  PostLoadFailure(this.error);
}
