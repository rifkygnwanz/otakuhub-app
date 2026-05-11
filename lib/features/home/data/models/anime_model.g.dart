// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimeListResponseImpl _$$AnimeListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AnimeListResponseImpl(
  data: (json['data'] as List<dynamic>)
      .map((e) => AnimeDataNode.fromJson(e as Map<String, dynamic>))
      .toList(),
  paging: json['paging'] == null
      ? null
      : AnimeListPaging.fromJson(json['paging'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AnimeListResponseImplToJson(
  _$AnimeListResponseImpl instance,
) => <String, dynamic>{'data': instance.data, 'paging': instance.paging};

_$AnimeDataNodeImpl _$$AnimeDataNodeImplFromJson(Map<String, dynamic> json) =>
    _$AnimeDataNodeImpl(
      node: AnimeModel.fromJson(json['node'] as Map<String, dynamic>),
      ranking: json['ranking'] == null
          ? null
          : AnimeRanking.fromJson(json['ranking'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AnimeDataNodeImplToJson(_$AnimeDataNodeImpl instance) =>
    <String, dynamic>{'node': instance.node, 'ranking': instance.ranking};

_$AnimeModelImpl _$$AnimeModelImplFromJson(
  Map<String, dynamic> json,
) => _$AnimeModelImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  mainPicture: json['main_picture'] == null
      ? null
      : AnimeMainPicture.fromJson(json['main_picture'] as Map<String, dynamic>),
  alternativeTitles: json['alternative_titles'] == null
      ? null
      : AnimeAlternativeTitles.fromJson(
          json['alternative_titles'] as Map<String, dynamic>,
        ),
  synopsis: json['synopsis'] as String?,
  mean: (json['mean'] as num?)?.toDouble(),
  rank: (json['rank'] as num?)?.toInt(),
  popularity: (json['popularity'] as num?)?.toInt(),
  numEpisodes: (json['num_episodes'] as num?)?.toInt(),
  numListUsers: (json['num_list_users'] as num?)?.toInt(),
  status: json['status'] as String?,
  mediaType: json['media_type'] as String?,
  startSeason: json['start_season'] == null
      ? null
      : AnimeSeason.fromJson(json['start_season'] as Map<String, dynamic>),
  genres: (json['genres'] as List<dynamic>?)
      ?.map((e) => AnimeGenre.fromJson(e as Map<String, dynamic>))
      .toList(),
  studios: (json['studios'] as List<dynamic>?)
      ?.map((e) => AnimeStudio.fromJson(e as Map<String, dynamic>))
      .toList(),
  rating: json['rating'] as String?,
  source: json['source'] as String?,
  background: json['background'] as String?,
  averageEpisodeDuration: (json['average_episode_duration'] as num?)?.toInt(),
  recommendations: (json['recommendations'] as List<dynamic>?)
      ?.map((e) => AnimeRecommendation.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$AnimeModelImplToJson(_$AnimeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'main_picture': instance.mainPicture,
      'alternative_titles': instance.alternativeTitles,
      'synopsis': instance.synopsis,
      'mean': instance.mean,
      'rank': instance.rank,
      'popularity': instance.popularity,
      'num_episodes': instance.numEpisodes,
      'num_list_users': instance.numListUsers,
      'status': instance.status,
      'media_type': instance.mediaType,
      'start_season': instance.startSeason,
      'genres': instance.genres,
      'studios': instance.studios,
      'rating': instance.rating,
      'source': instance.source,
      'background': instance.background,
      'average_episode_duration': instance.averageEpisodeDuration,
      'recommendations': instance.recommendations,
    };

_$AnimeMainPictureImpl _$$AnimeMainPictureImplFromJson(
  Map<String, dynamic> json,
) => _$AnimeMainPictureImpl(
  medium: json['medium'] as String?,
  large: json['large'] as String?,
);

Map<String, dynamic> _$$AnimeMainPictureImplToJson(
  _$AnimeMainPictureImpl instance,
) => <String, dynamic>{'medium': instance.medium, 'large': instance.large};

_$AnimeAlternativeTitlesImpl _$$AnimeAlternativeTitlesImplFromJson(
  Map<String, dynamic> json,
) => _$AnimeAlternativeTitlesImpl(
  en: json['en'] as String?,
  ja: json['ja'] as String?,
  synonyms: (json['synonyms'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$AnimeAlternativeTitlesImplToJson(
  _$AnimeAlternativeTitlesImpl instance,
) => <String, dynamic>{
  'en': instance.en,
  'ja': instance.ja,
  'synonyms': instance.synonyms,
};

_$AnimeSeasonImpl _$$AnimeSeasonImplFromJson(Map<String, dynamic> json) =>
    _$AnimeSeasonImpl(
      year: (json['year'] as num?)?.toInt(),
      season: json['season'] as String?,
    );

Map<String, dynamic> _$$AnimeSeasonImplToJson(_$AnimeSeasonImpl instance) =>
    <String, dynamic>{'year': instance.year, 'season': instance.season};

_$AnimeGenreImpl _$$AnimeGenreImplFromJson(Map<String, dynamic> json) =>
    _$AnimeGenreImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$AnimeGenreImplToJson(_$AnimeGenreImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_$AnimeStudioImpl _$$AnimeStudioImplFromJson(Map<String, dynamic> json) =>
    _$AnimeStudioImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$AnimeStudioImplToJson(_$AnimeStudioImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_$AnimeRankingImpl _$$AnimeRankingImplFromJson(Map<String, dynamic> json) =>
    _$AnimeRankingImpl(rank: (json['rank'] as num?)?.toInt());

Map<String, dynamic> _$$AnimeRankingImplToJson(_$AnimeRankingImpl instance) =>
    <String, dynamic>{'rank': instance.rank};

_$AnimeListPagingImpl _$$AnimeListPagingImplFromJson(
  Map<String, dynamic> json,
) => _$AnimeListPagingImpl(
  previous: json['previous'] as String?,
  next: json['next'] as String?,
);

Map<String, dynamic> _$$AnimeListPagingImplToJson(
  _$AnimeListPagingImpl instance,
) => <String, dynamic>{'previous': instance.previous, 'next': instance.next};

_$AnimeRecommendationImpl _$$AnimeRecommendationImplFromJson(
  Map<String, dynamic> json,
) => _$AnimeRecommendationImpl(
  node: json['node'] == null
      ? null
      : AnimeModel.fromJson(json['node'] as Map<String, dynamic>),
  numRecommendations: (json['num_recommendations'] as num?)?.toInt(),
);

Map<String, dynamic> _$$AnimeRecommendationImplToJson(
  _$AnimeRecommendationImpl instance,
) => <String, dynamic>{
  'node': instance.node,
  'num_recommendations': instance.numRecommendations,
};
