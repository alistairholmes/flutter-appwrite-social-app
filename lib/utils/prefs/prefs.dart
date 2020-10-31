class Prefs {
  final String profileURL;
  final String pic;

  Prefs({this.profileURL, this.pic});

  Prefs.fromJson(Map<String, dynamic> json)
      : pic = json['pic'],
        profileURL = json['profile_url'];
}
