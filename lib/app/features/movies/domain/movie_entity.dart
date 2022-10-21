enum MovieCategory {
  Series,
  Movies,
  Animation,
}

class MovieEntity {
  final int id;
  final String name;
  final String level;
  final MovieCategory category;
  final double evaluation;
  final String accent;
  final String image;
  final bool favorite;

  MovieEntity({
    required this.id,
    required this.name,
    required this.level,
    required this.evaluation,
    required this.accent,
    required this.image,
    required this.category,
    required this.favorite,
  });

  @override
  String toString() => 'Movie > id: $id, name: $name, category: $category';
}
