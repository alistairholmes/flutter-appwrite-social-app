class Post {
  Post(
      {this.username,
      this.caption,
      this.image,
      this.profile_image,
      this.id,
      this.collection});

  String username;
  String caption;
  String image;
  String profile_image;
  String collection;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
}
