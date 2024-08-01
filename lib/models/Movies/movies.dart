

import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
class MoviesModel with _$MoviesModel {

  factory MoviesModel({
    @Default('') int total,
    @Default(0)int page,
    @Default(0)int pages,
    @Default([]) @JsonKey(name:'tv_shows') List<TvShows> tvShow,
}) = _MoviesModel;

   factory MoviesModel.fromJson(Map<dynamic,dynamic>json) => _$MoviesModelFromJson(json);

}


@freezed
class TvShows with _$TvShows {

  factory TvShows({
     @JsonKey(name: 'name') @Default('') dynamic name ,
     @JsonKey(name: 'permalink') @Default('') dynamic permalink,
     @JsonKey(name: 'end_date') @Default('') dynamic endDate,
     @JsonKey(name: 'network') @Default('') dynamic network,
     @JsonKey(name: 'image_thumbnail_path') @Default('') dynamic imageThumbnailPath,
     @JsonKey(name: 'status') @Default('') dynamic status,
  }) = _TvShows;

  factory TvShows.fromJson(Map<dynamic,dynamic>json) => _$TvShowsFromJson(json);

}