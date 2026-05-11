import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/anime_model.dart';
import '../../data/repositories/anime_repository.dart';

int _currentYear() => DateTime.now().year;
String _currentSeason() {
  final month = DateTime.now().month;
  if (month <= 3) return 'winter';
  if (month <= 6) return 'spring';
  if (month <= 9) return 'summer';
  return 'fall';
}

final seasonalAnimeProvider = FutureProvider<List<AnimeModel>>((ref) async {
  final repo = ref.watch(animeRepositoryProvider);
  final response = await repo.getSeasonalAnime(
    year: _currentYear(),
    season: _currentSeason(),
  );
  return response.data.map((n) => n.node).toList();
});

final topRankingProvider = FutureProvider<List<AnimeModel>>((ref) async {
  final repo = ref.watch(animeRepositoryProvider);
  final response = await repo.getRankingAnime(rankingType: 'all');
  return response.data.map((n) => n.node).toList();
});

final trendingProvider = FutureProvider<List<AnimeModel>>((ref) async {
  final repo = ref.watch(animeRepositoryProvider);
  final response = await repo.getRankingAnime(rankingType: 'airing');
  return response.data.map((n) => n.node).toList();
});

final animeDetailProvider =
    FutureProvider.family<AnimeModel, int>((ref, id) async {
  final repo = ref.watch(animeRepositoryProvider);
  return repo.getAnimeDetail(id);
});
