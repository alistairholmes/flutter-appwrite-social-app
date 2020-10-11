import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  PostCard(
      {@required this.username,
      @required this.caption,
      @required this.profile_image,
      @required this.image});

  final String username;
  final String caption;
  final String profile_image;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      width: 370,
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.network(
                    profile_image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(username),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 350,
                height: 300,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(caption)
          ],
        ),
      ),
    );
  }
}
