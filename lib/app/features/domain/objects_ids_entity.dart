class ObjectIds {
  ObjectIds({
    required this.movie,
  });
  late final String movie;

  ObjectIds.fromJson(Map<String, dynamic> json) {
    movie = json['movie:100402'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['movie:100402'] = movie;

    return _data;
  }
}
