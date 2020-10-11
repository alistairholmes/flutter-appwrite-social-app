import 'package:flutter/material.dart';
import 'package:flutter_appwrite_demo/components/post_card/post_card.dart';
import 'package:flutter_appwrite_demo/data/models/post.dart';
import 'package:flutter_appwrite_demo/utils/posts/posts_state.dart';
import 'package:provider/provider.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<PostsState>(context).posts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Post> posts = snapshot.data;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              Post post = posts[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PostCard(
                  username: post.username,
                  caption: post.caption,
                  image: post.image,
                  profile_image: post.profile_image,
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
