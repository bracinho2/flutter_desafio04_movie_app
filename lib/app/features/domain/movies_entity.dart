import 'package:flutter_desafio04_movie_app/app/features/domain/comments_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/domain/created_by_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/domain/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/domain/objects_ids_entity.dart';

class Movies {
  Movies({
    required this.posterPath,
    required this.id,
    required this.backdropPath,
    required this.totalResults,
    required this.public,
    required this.revenue,
    required this.page,
    required this.listMovies,
    required this.objectIds,
    required this.iso_639_1,
    required this.totalPages,
    required this.description,
    required this.createdBy,
    required this.iso_3166_1,
    required this.averageRating,
    required this.runtime,
    required this.name,
    required this.comments,
  });
  late final String posterPath;
  late final int id;
  late final String backdropPath;
  late final int totalResults;
  late final bool public;
  late final String revenue;
  late final int page;
  late final List<Movie> listMovies;
  late final ObjectIds objectIds;
  late final String iso_639_1;
  late final int totalPages;
  late final String description;
  late final CreatedBy createdBy;
  late final String iso_3166_1;
  late final double averageRating;
  late final int runtime;
  late final String name;
  late final Comments comments;

  Movies copyWith({
    String? posterPath,
    int? id,
    String? backdropPath,
    int? totalResults,
    bool? public,
    String? revenue,
    int? page,
    List<Movie>? listMovies,
    ObjectIds? objectIds,
    String? iso_639_1,
    int? totalPages,
    String? description,
    CreatedBy? createdBy,
    String? iso_3166_1,
    double? averageRating,
    int? runtime,
    String? name,
    Comments? comments,
  }) {
    return Movies(
      posterPath: posterPath ?? this.posterPath,
      id: id ?? this.id,
      backdropPath: backdropPath ?? this.backdropPath,
      totalResults: totalResults ?? this.totalResults,
      public: public ?? this.public,
      revenue: revenue ?? this.revenue,
      page: page ?? this.page,
      listMovies: listMovies ?? this.listMovies,
      objectIds: objectIds ?? this.objectIds,
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      totalPages: totalPages ?? this.totalPages,
      description: description ?? this.description,
      createdBy: createdBy ?? this.createdBy,
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      averageRating: averageRating ?? this.averageRating,
      runtime: runtime ?? this.runtime,
      name: name ?? this.name,
      comments: comments ?? this.comments,
    );
  }

  @override
  String toString() {
    return 'Movies(posterPath: $posterPath, id: $id, backdropPath: $backdropPath, totalResults: $totalResults, public: $public, revenue: $revenue, page: $page, listMovies: $listMovies, objectIds: $objectIds, iso_639_1: $iso_639_1, totalPages: $totalPages, description: $description, createdBy: $createdBy, iso_3166_1: $iso_3166_1, averageRating: $averageRating, runtime: $runtime, name: $name, comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movies &&
        other.posterPath == posterPath &&
        other.id == id &&
        other.backdropPath == backdropPath &&
        other.totalResults == totalResults &&
        other.public == public &&
        other.revenue == revenue &&
        other.page == page &&
        other.listMovies == listMovies &&
        other.objectIds == objectIds &&
        other.iso_639_1 == iso_639_1 &&
        other.totalPages == totalPages &&
        other.description == description &&
        other.createdBy == createdBy &&
        other.iso_3166_1 == iso_3166_1 &&
        other.averageRating == averageRating &&
        other.runtime == runtime &&
        other.name == name &&
        other.comments == comments;
  }

  @override
  int get hashCode {
    return posterPath.hashCode ^
        id.hashCode ^
        backdropPath.hashCode ^
        totalResults.hashCode ^
        public.hashCode ^
        revenue.hashCode ^
        page.hashCode ^
        listMovies.hashCode ^
        objectIds.hashCode ^
        iso_639_1.hashCode ^
        totalPages.hashCode ^
        description.hashCode ^
        createdBy.hashCode ^
        iso_3166_1.hashCode ^
        averageRating.hashCode ^
        runtime.hashCode ^
        name.hashCode ^
        comments.hashCode;
  }
}
