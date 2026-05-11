import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../home/data/models/anime_model.dart';
import '../../../../core/theme/theme_provider.dart';

const _wishlistKey = 'local_wishlist';

final wishlistProvider =
    StateNotifierProvider<WishlistNotifier, List<AnimeModel>>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return WishlistNotifier(prefs);
});

class WishlistNotifier extends StateNotifier<List<AnimeModel>> {
  final SharedPreferences _prefs;

  WishlistNotifier(this._prefs) : super([]) {
    _load();
  }

  void _load() {
    final raw = _prefs.getStringList(_wishlistKey) ?? [];
    state = raw
        .map((s) => AnimeModel.fromJson(jsonDecode(s) as Map<String, dynamic>))
        .toList();
  }

  bool isInWishlist(int id) => state.any((a) => a.id == id);

  Future<void> toggle(AnimeModel anime) async {
    if (isInWishlist(anime.id)) {
      state = state.where((a) => a.id != anime.id).toList();
    } else {
      state = [...state, anime];
    }
    await _save();
  }

  Future<void> remove(int id) async {
    state = state.where((a) => a.id != id).toList();
    await _save();
  }

  Future<void> _save() async {
    final encoded = state.map((a) => jsonEncode(a.toJson())).toList();
    await _prefs.setStringList(_wishlistKey, encoded);
  }
}
