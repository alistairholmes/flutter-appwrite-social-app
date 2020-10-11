import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appwrite_demo/data/models/post.dart';

class PostsState extends ChangeNotifier {
  final String collectionId = '5f820a08b78e9';
  Client client = Client();
  Database db;
  String _error;

  String get error => _error;

  PostsState() {
    _init();
  }

  _init() {
    client
        .setEndpoint('http://192.168.1.103:4003/v1')
        .setProject('5f71b0a937fe4');
    db = Database(client);
  }

  Future<List<Post>> posts() async {
    try {
      Response res = await db.listDocuments(collectionId: collectionId);
      if (res.statusCode == 200) {
        return List<Post>.from(
            res.data["documents"].map((pos) => Post.fromJson(pos)));
      } else {
        return null;
      }
    } catch (e) {
      print(e.message);
      return null;
    }
  }
}
