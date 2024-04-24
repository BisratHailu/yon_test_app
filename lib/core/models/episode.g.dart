// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      image: json['image'] as String?,
      description: json['description'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
    };
