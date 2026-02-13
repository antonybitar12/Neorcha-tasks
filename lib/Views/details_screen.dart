import 'package:flutter/material.dart';
import 'package:neorchatasks/Models/post_model.dart';
import 'package:neorchatasks/Reusables/colors.dart';
import 'package:neorchatasks/Reusables/custom_text.dart';

class DetailsScreen extends StatelessWidget {
  final Post post;

  const DetailsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepNavy,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const CustomText(
          text: 'Post Details',
          color: AppColors.deepNavy,
          fontSize: 22,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Title : ${post.title}", fontSize: 20),
              const SizedBox(height: 20),
              CustomText(fontSize: 20, text: "Body : ${post.body}"),
            ],
          ),
        ),
      ),
    );
  }
}
