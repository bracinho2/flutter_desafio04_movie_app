import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';

class UsecaseError extends Failure {
  final String message;

  final StackTrace? stackTrace;
  final String? label;

  UsecaseError({
    this.message = 'Usecase Error',
    this.stackTrace,
    this.label,
  }) : super(
          stackTrace: stackTrace,
          label: label,
        );
}
