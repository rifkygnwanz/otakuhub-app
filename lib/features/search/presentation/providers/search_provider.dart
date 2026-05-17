import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

final searchHistoryProvider =
    StateNotifierProvider<SearchHistoryNotifier, List<String>>((ref) {
  return SearchHistoryNotifier();
});

class SearchHistoryNotifier extends StateNotifier<List<String>> {
  SearchHistoryNotifier() : super([]) {
    _loadHistory();
  }

  static const _key = 'search_history_queries';

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getStringList(_key) ?? [];
  }

  Future<void> addQuery(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;

    final updated = List<String>.from(state);
    updated.remove(trimmed); // Put duplicate queries at the front
    updated.insert(0, trimmed);

    if (updated.length > 10) {
      updated.removeLast(); // Cap at top 10 historical queries
    }

    state = updated;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, updated);
  }

  Future<void> removeQuery(String query) async {
    final updated = List<String>.from(state);
    if (updated.remove(query)) {
      state = updated;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_key, updated);
    }
  }

  Future<void> clearHistory() async {
    state = [];
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
