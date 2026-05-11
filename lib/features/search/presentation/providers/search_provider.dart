import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../home/data/models/anime_model.dart';
import '../../../home/data/repositories/anime_repository.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider =
    FutureProvider.autoDispose<List<AnimeModel>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.trim().isEmpty) return [];
  await Future.delayed(const Duration(milliseconds: 500));
  final currentQuery = ref.read(searchQueryProvider);
  if (currentQuery != query) return [];
  final repo = ref.watch(animeRepositoryProvider);
  final response = await repo.searchAnime(query: query);
  return response.data.map((n) => n.node).toList();
});
