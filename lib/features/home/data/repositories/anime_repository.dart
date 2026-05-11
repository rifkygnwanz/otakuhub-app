import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/anime_model.dart';

final animeRepositoryProvider = Provider<AnimeRepository>((ref) {
  return AnimeRepository(ref.watch(dioClientProvider).dio);
});

class AnimeRepository {
  final Dio _dio;

  AnimeRepository(this._dio);

  Future<AnimeListResponse> getSeasonalAnime({
    required int year,
    required String season,
    int limit = ApiConstants.seasonalLimit,
  }) async {
    final response = await _dio.get(
      '/anime/season/$year/$season',
      queryParameters: {
        'fields': ApiConstants.animeBaseFields,
        'limit': limit,
        'sort': 'anime_num_list_users',
      },
    );
    return AnimeListResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<AnimeListResponse> getRankingAnime({
    String rankingType = 'all',
    int limit = ApiConstants.rankingLimit,
  }) async {
    final response = await _dio.get(
      '/anime/ranking',
      queryParameters: {
        'ranking_type': rankingType,
        'fields': ApiConstants.animeBaseFields,
        'limit': limit,
      },
    );
    return AnimeListResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<AnimeListResponse> searchAnime({
    required String query,
    int limit = ApiConstants.searchLimit,
  }) async {
    final response = await _dio.get(
      '/anime',
      queryParameters: {
        'q': query,
        'fields': ApiConstants.animeBaseFields,
        'limit': limit,
      },
    );
    return AnimeListResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<AnimeModel> getAnimeDetail(int animeId) async {
    final response = await _dio.get(
      '/anime/$animeId',
      queryParameters: {'fields': ApiConstants.animeDetailFields},
    );
    return AnimeModel.fromJson(response.data as Map<String, dynamic>);
  }
}
