import 'package:flutter/material.dart';
import 'package:flutter_appwrite_demo/components/post_list/post_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: PostList(),
        ),
      ),
    );
  }
}
