class Comments {
  Comments({
    this.movie,
  });
  // ignore: prefer_typing_uninitialized_variables
  late final movie;

  Comments.fromJson(Map<String, dynamic> json) {
    movie = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['movie:100402'] = movie;

    return _data;
  }
}
