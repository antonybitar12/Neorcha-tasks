import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neorchatasks/Event/post_event.dart';
import 'package:neorchatasks/Repository/post_repository.dart';
import 'package:neorchatasks/State/post_states.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;

  PostBloc({required this.repository}) : super(PostInitial()) {
    on<LoadPost>(_onLoadPosts);
  }

  Future<void> _onLoadPosts(LoadPost event, Emitter<PostState> emit) async {
    try {
      final allPosts = await repository.loadPosts();
      emit(PostLoadSuccess(posts: allPosts));
    } catch (e) {
      print(e);
      emit(PostLoadFailure(e.toString()));
    }
  }
}
