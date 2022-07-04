// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return BookData.fromJson(json);
}

/// @nodoc
class _$BookTearOff {
  const _$BookTearOff();

  BookData call(
      {required int id,
      required String name,
      String? author,
      int? copies,
      String? genre}) {
    return BookData(
      id: id,
      name: name,
      author: author,
      copies: copies,
      genre: genre,
    );
  }

  Book fromJson(Map<String, Object?> json) {
    return Book.fromJson(json);
  }
}

/// @nodoc
const $Book = _$BookTearOff();

/// @nodoc
mixin _$Book {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  int? get copies => throw _privateConstructorUsedError;
  String? get genre => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res>;
  $Res call({int id, String name, String? author, int? copies, String? genre});
}

/// @nodoc
class _$BookCopyWithImpl<$Res> implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  final Book _value;
  // ignore: unused_field
  final $Res Function(Book) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? author = freezed,
    Object? copies = freezed,
    Object? genre = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      copies: copies == freezed
          ? _value.copies
          : copies // ignore: cast_nullable_to_non_nullable
              as int?,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class $BookDataCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory $BookDataCopyWith(BookData value, $Res Function(BookData) then) =
      _$BookDataCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String? author, int? copies, String? genre});
}

/// @nodoc
class _$BookDataCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res>
    implements $BookDataCopyWith<$Res> {
  _$BookDataCopyWithImpl(BookData _value, $Res Function(BookData) _then)
      : super(_value, (v) => _then(v as BookData));

  @override
  BookData get _value => super._value as BookData;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? author = freezed,
    Object? copies = freezed,
    Object? genre = freezed,
  }) {
    return _then(BookData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      copies: copies == freezed
          ? _value.copies
          : copies // ignore: cast_nullable_to_non_nullable
              as int?,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookData implements BookData {
  _$BookData(
      {required this.id,
      required this.name,
      this.author,
      this.copies,
      this.genre});

  factory _$BookData.fromJson(Map<String, dynamic> json) =>
      _$$BookDataFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? author;
  @override
  final int? copies;
  @override
  final String? genre;

  @override
  String toString() {
    return 'Book(id: $id, name: $name, author: $author, copies: $copies, genre: $genre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.copies, copies) &&
            const DeepCollectionEquality().equals(other.genre, genre));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(copies),
      const DeepCollectionEquality().hash(genre));

  @JsonKey(ignore: true)
  @override
  $BookDataCopyWith<BookData> get copyWith =>
      _$BookDataCopyWithImpl<BookData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookDataToJson(this);
  }
}

abstract class BookData implements Book {
  factory BookData(
      {required int id,
      required String name,
      String? author,
      int? copies,
      String? genre}) = _$BookData;

  factory BookData.fromJson(Map<String, dynamic> json) = _$BookData.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get author;
  @override
  int? get copies;
  @override
  String? get genre;
  @override
  @JsonKey(ignore: true)
  $BookDataCopyWith<BookData> get copyWith =>
      throw _privateConstructorUsedError;
}
