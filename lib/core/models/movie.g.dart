// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      image: json['image'] as String?,
      subTitle: json['subTitle'] as String?,
      description: json['description'] as String?,
      genre: json['genre'] as String?,
      title: json['title'] as String?,
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'subTitle': instance.subTitle,
      'description': instance.description,
      'genre': instance.genre,
      'episodes': instance.episodes,
    };
