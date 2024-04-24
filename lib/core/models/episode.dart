import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable()

class Episode {

  String? title;
  String? image;
  String? description;

  Episode(
      {this.image,this.description,this.title});


  factory Episode.fromJson(Map<String,dynamic> json) => _$EpisodeFromJson(json);

  Map<String,dynamic> toJson() => _$EpisodeToJson(this);
}
