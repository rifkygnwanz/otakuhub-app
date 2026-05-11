import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_model.freezed.dart';
part 'anime_model.g.dart';

@freezed
class AnimeListResponse with _$AnimeListResponse {
  const factory AnimeListResponse({
    required List<AnimeDataNode> data,
    AnimeListPaging? paging,
  }) = _AnimeListResponse;

  factory AnimeListResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeListResponseFromJson(json);
}

@freezed
class AnimeDataNode with _$AnimeDataNode {
  const factory AnimeDataNode({
    required AnimeModel node,
    AnimeRanking? ranking,
  }) = _AnimeDataNode;

  factory AnimeDataNode.fromJson(Map<String, dynamic> json) =>
      _$AnimeDataNodeFromJson(json);
}

@freezed
class AnimeModel with _$AnimeModel {
  const factory AnimeModel({
    required int id,
    required String title,
    @JsonKey(name: 'main_picture') AnimeMainPicture? mainPicture,
    @JsonKey(name: 'alternative_titles') AnimeAlternativeTitles? alternativeTitles,
    String? synopsis,
    double? mean,
    int? rank,
    int? popularity,
    @JsonKey(name: 'num_episodes') int? numEpisodes,
    @JsonKey(name: 'num_list_users') int? numListUsers,
    String? status,
    @JsonKey(name: 'media_type') String? mediaType,
    @JsonKey(name: 'start_season') AnimeSeason? startSeason,
    List<AnimeGenre>? genres,
    List<AnimeStudio>? studios,
    String? rating,
    String? source,
    String? background,
    @JsonKey(name: 'average_episode_duration') int? averageEpisodeDuration,
    List<AnimeRecommendation>? recommendations,
  }) = _AnimeModel;

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);
}

@freezed
class AnimeMainPicture with _$AnimeMainPicture {
  const factory AnimeMainPicture({
    String? medium,
    String? large,
  }) = _AnimeMainPicture;

  factory AnimeMainPicture.fromJson(Map<String, dynamic> json) =>
      _$AnimeMainPictureFromJson(json);
}

@freezed
class AnimeAlternativeTitles with _$AnimeAlternativeTitles {
  const factory AnimeAlternativeTitles({
    String? en,
    String? ja,
    List<String>? synonyms,
  }) = _AnimeAlternativeTitles;

  factory AnimeAlternativeTitles.fromJson(Map<String, dynamic> json) =>
      _$AnimeAlternativeTitlesFromJson(json);
}

@freezed
class AnimeSeason with _$AnimeSeason {
  const factory AnimeSeason({
    int? year,
    String? season,
  }) = _AnimeSeason;

  factory AnimeSeason.fromJson(Map<String, dynamic> json) =>
      _$AnimeSeasonFromJson(json);
}

@freezed
class AnimeGenre with _$AnimeGenre {
  const factory AnimeGenre({
    required int id,
    required String name,
  }) = _AnimeGenre;

  factory AnimeGenre.fromJson(Map<String, dynamic> json) =>
      _$AnimeGenreFromJson(json);
}

@freezed
class AnimeStudio with _$AnimeStudio {
  const factory AnimeStudio({
    required int id,
    required String name,
  }) = _AnimeStudio;

  factory AnimeStudio.fromJson(Map<String, dynamic> json) =>
      _$AnimeStudioFromJson(json);
}

@freezed
class AnimeRanking with _$AnimeRanking {
  const factory AnimeRanking({
    int? rank,
  }) = _AnimeRanking;

  factory AnimeRanking.fromJson(Map<String, dynamic> json) =>
      _$AnimeRankingFromJson(json);
}

@freezed
class AnimeListPaging with _$AnimeListPaging {
  const factory AnimeListPaging({
    String? previous,
    String? next,
  }) = _AnimeListPaging;

  factory AnimeListPaging.fromJson(Map<String, dynamic> json) =>
      _$AnimeListPagingFromJson(json);
}

@freezed
class AnimeRecommendation with _$AnimeRecommendation {
  const factory AnimeRecommendation({
    @JsonKey(name: 'node') AnimeModel? node,
    @JsonKey(name: 'num_recommendations') int? numRecommendations,
  }) = _AnimeRecommendation;

  factory AnimeRecommendation.fromJson(Map<String, dynamic> json) =>
      _$AnimeRecommendationFromJson(json);
}
