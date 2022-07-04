import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

/// The Book model
@freezed
class Book with _$Book {
  /// The helper factory method to generate the Book constructor
  factory Book({
    required int id,
    required String name,
    String? author,
    int? copies,
    String? genre,
  }) = BookData;

  /// Factory method to generate a Book object starting from a json map of string,value
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}