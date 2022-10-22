import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';

class HttpClientError extends Failure {
  final String message;

  final StackTrace? stackTrace;
  final String? label;

  HttpClientError({
    this.message = 'HttpClient Error',
    this.stackTrace,
    this.label,
  }) : super(
          stackTrace: stackTrace,
          label: label,
        );
}

class Error implements Failure {
  @override
  String get message => throw UnimplementedError();
}
