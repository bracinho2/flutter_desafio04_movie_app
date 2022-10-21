class CreatedBy {
  CreatedBy({
    required this.gravatarHash,
    required this.name,
    required this.username,
  });
  late final String gravatarHash;
  late final String name;
  late final String username;

  CreatedBy.fromJson(Map<String, dynamic> json) {
    gravatarHash = json['gravatar_hash'];
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['gravatar_hash'] = gravatarHash;
    _data['name'] = name;
    _data['username'] = username;
    return _data;
  }
}
