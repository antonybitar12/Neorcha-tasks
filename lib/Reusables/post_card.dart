import 'package:flutter/material.dart';
import 'package:neorchatasks/Models/post_model.dart';
import 'package:neorchatasks/Reusables/custom_text.dart';
import 'package:neorchatasks/Views/details_screen.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        color: Color(0xFC000033),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(fontSize: 16, text: "Title : ${post.title}"),
                    const SizedBox(height: 8),
                    CustomText(
                      text: "Body : ${post.body}",
                      fontSize: 16,
                      maxLignes: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(post: post),
                    ),
                  );
                },
                icon: Icon(Icons.info, color: Colors.yellow, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
