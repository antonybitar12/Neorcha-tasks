import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neorchatasks/ApiProvider/post_api.dart';
import 'package:neorchatasks/Bloc/post_bloc.dart';
import 'package:neorchatasks/Event/post_event.dart';
import 'package:neorchatasks/Repository/post_repository.dart';
import 'package:neorchatasks/Reusables/colors.dart';
import 'package:neorchatasks/Reusables/custom_text.dart';
import 'package:neorchatasks/Views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              RepositoryProvider(
                create: (_) => PostRepository(PostApi()),
                child: BlocProvider(
                  create: (context) => PostBloc(
                    repository: RepositoryProvider.of<PostRepository>(context),
                  )..add(LoadPost()),
                  child: PostsDisplay(),
                ),
              ),
          transitionDuration: Duration(milliseconds: 600),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Im a fade transition to avoid the default material route animation which make the animation looks wrong without it
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.deepNavy,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // This is a reusable text , im using it so i can reuse the the same style all over the application without rewriting it
          CustomText(text: "Welcome !"),
          Hero(
            tag: 'SerenaHotels',
            child: Image.asset(
              "assets/images/SerenaHotelsImage.png",
              height: 170,
              width: 220,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
