import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()

class Movie {

  String? image;
  String? subTitle;

  Movie(
      {this.image,this.subTitle});


  factory Movie.fromJson(Map<String,dynamic> json) => _$MovieFromJson(json);

  Map<String,dynamic> toJson() => _$MovieToJson(this);
}
