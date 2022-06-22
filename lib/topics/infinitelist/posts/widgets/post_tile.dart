import 'package:bloc_cubit/topics/infinitelist/posts/model/post.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  const PostTile({Key? key, required this.post}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Text('${post.id}'),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  post.body,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
