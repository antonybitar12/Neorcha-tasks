import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neorchatasks/Bloc/post_bloc.dart';
import 'package:neorchatasks/Reusables/colors.dart';
import 'package:neorchatasks/Reusables/custom_text.dart';
import 'package:neorchatasks/Reusables/post_card.dart';
import 'package:neorchatasks/State/post_states.dart';

class PostsDisplay extends StatelessWidget {
  const PostsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: CustomText(
          text: "Posts",
          color: AppColors.deepNavy,
          fontSize: 22,
        ),
      ),
      backgroundColor: AppColors.deepNavy,
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                  tag: 'SerenaHotels',
                  child: Image.asset(
                    "assets/images/SerenaHotelsImage.png",
                    height: 170,
                    width: 220,
                    fit: BoxFit.contain,
                  ),
                ),
                Center(child: CircularProgressIndicator(color: Colors.yellow)),
              ],
            );
          } else if (state is PostLoadSuccess) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return PostCard(post: state.posts[index]);
              },
            );
          } else if (state is PostLoadFailure) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CustomText(
                  fontSize: 18,
                  text: 'Error: ${state.error}',
                  color: Colors.red,
                ),
              ),
            );
          }
          return Center(
            child: CustomText(
              fontSize: 18,
              text: 'No data',
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
