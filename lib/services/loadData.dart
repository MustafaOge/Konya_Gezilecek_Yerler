class LoadData {
  final String username;


  LoadData({this.username,});

  factory LoadData.fromJson(Map<String, dynamic> json) {
    return LoadData(
      username: json['username'],

    );
  }
}