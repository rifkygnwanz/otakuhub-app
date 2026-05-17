import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';
import '../models/anime_model.dart';

final animeRepositoryProvider = Provider<AnimeRepository>((ref) {
  return AnimeRepository(ref.watch(dioClientProvider).dio);
});

class AnimeRepository {
  final Dio _dio;

  AnimeRepository(this._dio);

  // Helper to clean HTML tags from descriptions
  String _cleanSynopsis(String? html) {
    if (html == null) return '';
    return html
        .replaceAll(RegExp(r'<br\s*/?>'), '\n')
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .trim();
  }

  // Helper to map AniList GraphQL Media node to AnimeModel
  AnimeModel _mapMediaToModel(Map<String, dynamic> media) {
    final titleInfo = media['title'] as Map<String, dynamic>?;
    final englishTitle = titleInfo?['english'] as String?;
    final romajiTitle = titleInfo?['romaji'] as String?;
    final nativeTitle = titleInfo?['native'] as String?;
    final userPreferredTitle = titleInfo?['userPreferred'] as String?;
    final displayTitle = englishTitle ?? romajiTitle ?? userPreferredTitle ?? 'Unknown Title';

    final coverImage = media['coverImage'] as Map<String, dynamic>?;
    final mediumCover = coverImage?['medium'] as String?;
    final largeCover = coverImage?['large'] as String?;
    final extraLargeCover = coverImage?['extraLarge'] as String?;

    final score = media['averageScore'] != null
        ? (media['averageScore'] as num).toDouble() / 10.0
        : null;

    final rawStatus = media['status'] as String?;
    String? mappedStatus;
    if (rawStatus == 'FINISHED') {
      mappedStatus = 'finished_airing';
    } else if (rawStatus == 'RELEASING') {
      mappedStatus = 'currently_airing';
    } else if (rawStatus == 'NOT_YET_RELEASED') {
      mappedStatus = 'not_yet_aired';
    } else {
      mappedStatus = rawStatus?.toLowerCase();
    }

    final format = media['format'] as String?;
    final mediaType = format?.toLowerCase();

    final genresList = media['genres'] as List<dynamic>?;
    final genres = genresList?.asMap().entries.map((entry) {
      return AnimeGenre(id: entry.key, name: entry.value.toString());
    }).toList();

    final studiosData = media['studios']?['nodes'] as List<dynamic>?;
    final studios = studiosData?.map((s) {
      final sMap = s as Map<String, dynamic>;
      return AnimeStudio(id: sMap['id'] as int, name: sMap['name'] as String);
    }).toList();

    // Map recommendations if present
    final recsData = media['recommendations']?['nodes'] as List<dynamic>?;
    final recommendations = recsData?.map((r) {
      final rMap = r as Map<String, dynamic>;
      final recMedia = rMap['mediaRecommendation'] as Map<String, dynamic>?;
      return AnimeRecommendation(
        node: recMedia != null ? _mapMediaToModel(recMedia) : null,
        numRecommendations: 1,
      );
    }).toList();

    final trailer = media['trailer'] as Map<String, dynamic>?;
    final trailerId = (trailer != null && trailer['site'] == 'youtube') ? trailer['id'] as String? : null;

    return AnimeModel(
      id: media['id'] as int,
      title: displayTitle,
      mainPicture: AnimeMainPicture(
        medium: mediumCover,
        large: extraLargeCover ?? largeCover,
      ),
      alternativeTitles: AnimeAlternativeTitles(
        en: englishTitle,
        ja: nativeTitle,
        synonyms: romajiTitle != null ? [romajiTitle] : null,
      ),
      synopsis: _cleanSynopsis(media['description'] as String?),
      mean: score,
      popularity: media['popularity'] as int?,
      numEpisodes: media['episodes'] as int?,
      status: mappedStatus,
      mediaType: mediaType,
      startSeason: AnimeSeason(
        year: media['seasonYear'] as int?,
        season: (media['season'] as String?)?.toLowerCase(),
      ),
      genres: genres,
      studios: studios,
      background: trailerId ?? media['bannerImage'] as String?,
      source: media['source'] as String?,
      averageEpisodeDuration: media['duration'] as int?,
      recommendations: recommendations,
    );
  }

  // GraphQL query helper
  Future<Map<String, dynamic>> _executeGraphQL(String query, Map<String, dynamic> variables) async {
    final response = await _dio.post(
      '',
      data: {
        'query': query,
        'variables': variables,
      },
    );
    return response.data['data'] as Map<String, dynamic>;
  }

  static const String _baseFieldsFragment = '''
    fragment BaseFields on Media {
      id
      title {
        romaji
        english
        native
        userPreferred
      }
      coverImage {
        medium
        large
        extraLarge
      }
      averageScore
      popularity
      episodes
      status
      format
      season
      seasonYear
      genres
    }
  ''';

  Future<AnimeListResponse> getSeasonalAnime({
    required int year,
    required String season,
    int limit = 20,
  }) async {
    const query = '''
      $_baseFieldsFragment
      query (\$season: MediaSeason, \$seasonYear: Int, \$limit: Int) {
        Page(page: 1, perPage: \$limit) {
          media(season: \$season, seasonYear: \$seasonYear, type: ANIME, sort: POPULARITY_DESC) {
            ...BaseFields
          }
        }
      }
    ''';

    final data = await _executeGraphQL(query, {
      'season': season.toUpperCase(),
      'seasonYear': year,
      'limit': limit,
    });

    final mediaList = data['Page']['media'] as List<dynamic>;
    final nodes = mediaList.map((m) {
      return AnimeDataNode(node: _mapMediaToModel(m as Map<String, dynamic>));
    }).toList();

    return AnimeListResponse(data: nodes);
  }

  Future<AnimeListResponse> getRankingAnime({
    String rankingType = 'all',
    int limit = 20,
  }) async {
    const query = '''
      $_baseFieldsFragment
      query (\$sort: [MediaSort], \$status: MediaStatus, \$limit: Int) {
        Page(page: 1, perPage: \$limit) {
          media(type: ANIME, sort: \$sort, status: \$status) {
            ...BaseFields
          }
        }
      }
    ''';

    List<String> sort = ['SCORE_DESC'];
    String? status;

    if (rankingType == 'airing') {
      sort = ['POPULARITY_DESC'];
      status = 'RELEASING';
    } else if (rankingType == 'upcoming') {
      sort = ['POPULARITY_DESC'];
      status = 'NOT_YET_RELEASED';
    } else if (rankingType == 'bypopularity') {
      sort = ['POPULARITY_DESC'];
    } else if (rankingType == 'favorite') {
      sort = ['FAVOURITES_DESC'];
    }

    final data = await _executeGraphQL(query, {
      'sort': sort,
      if (status != null) 'status': status,
      'limit': limit,
    });

    final mediaList = data['Page']['media'] as List<dynamic>;
    final nodes = mediaList.map((m) {
      return AnimeDataNode(node: _mapMediaToModel(m as Map<String, dynamic>));
    }).toList();

    return AnimeListResponse(data: nodes);
  }

  Future<AnimeListResponse> searchAnime({
    required String query,
    int limit = 20,
  }) async {
    const graphqlQuery = '''
      $_baseFieldsFragment
      query (\$search: String, \$limit: Int) {
        Page(page: 1, perPage: \$limit) {
          media(search: \$search, type: ANIME, sort: POPULARITY_DESC) {
            ...BaseFields
          }
        }
      }
    ''';

    final data = await _executeGraphQL(graphqlQuery, {
      'search': query,
      'limit': limit,
    });

    final mediaList = data['Page']['media'] as List<dynamic>;
    final nodes = mediaList.map((m) {
      return AnimeDataNode(node: _mapMediaToModel(m as Map<String, dynamic>));
    }).toList();

    return AnimeListResponse(data: nodes);
  }

  Future<AnimeModel> getAnimeDetail(int animeId) async {
    const query = '''
      query (\$id: Int) {
        Media(id: \$id, type: ANIME) {
          id
          title {
            romaji
            english
            native
            userPreferred
          }
          coverImage {
            medium
            large
            extraLarge
          }
          bannerImage
          description
          averageScore
          popularity
          episodes
          status
          format
          season
          seasonYear
          genres
          duration
          source
          studios(isMain: true) {
            nodes {
              id
              name
            }
          }
          recommendations(perPage: 10) {
            nodes {
              mediaRecommendation {
                id
                title {
                  romaji
                  english
                  native
                  userPreferred
                }
                coverImage {
                  medium
                  large
                  extraLarge
                }
                averageScore
                popularity
              }
            }
          }
          trailer {
            id
            site
          }
        }
      }
    ''';

    final data = await _executeGraphQL(query, {
      'id': animeId,
    });

    return _mapMediaToModel(data['Media'] as Map<String, dynamic>);
  }
}
