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
  //DateTime createdAt;
  //DateTime updatedAt;

  Post.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    collection = json['$collection'];
    username = json['username'];
    caption = json['caption'];
    profile_image = json['profile_image'];
    image = json['image'];
    //createdAt = DateTime.fromMillisecondsSinceEpoch(json['created_at']);
    //updatedAt = DateTime.fromMillisecondsSinceEpoch(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['$collection'] = this.collection;
    data['username'] = this.username;
    data['caption'] = this.caption;
    data['profile_image'] = this.profile_image;
    data['image'] = this.image;
    return data;
  }
}
