import 'package:json_annotation/json_annotation.dart';

import 'episode.dart';

part 'movie.g.dart';

@JsonSerializable()

class Movie {

  String? title;
  String? image;
  String? subTitle;
  String? description;
  String? genre;
  List<Episode>? episodes;

  Movie(
      {this.image,this.subTitle,this.description,this.genre,this.title,this.episodes});


  factory Movie.fromJson(Map<String,dynamic> json) => _$MovieFromJson(json);

  Map<String,dynamic> toJson() => _$MovieToJson(this);
}
