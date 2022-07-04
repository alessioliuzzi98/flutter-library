// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookData _$$BookDataFromJson(Map<String, dynamic> json) => _$BookData(
      id: json['id'] as int,
      name: json['name'] as String,
      author: json['author'] as String?,
      copies: json['copies'] as int?,
      genre: json['genre'] as String?,
    );

Map<String, dynamic> _$$BookDataToJson(_$BookData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'copies': instance.copies,
      'genre': instance.genre,
    };
