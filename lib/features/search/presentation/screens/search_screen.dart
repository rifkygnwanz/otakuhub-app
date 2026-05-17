import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/empty_view.dart';
import '../../../../shared/widgets/shimmer_card.dart';
import '../../../home/data/models/anime_model.dart';
import '../providers/search_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(searchQueryProvider);
    final resultsAsync = ref.watch(searchResultsProvider);
    final history = ref.watch(searchHistoryProvider);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Premium Header search bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: Hero(
                tag: 'search-search-bar',
                child: Material(
                  color: Colors.transparent,
                  child: TextField(
                    controller: _controller,
                    autofocus: false,
                    onChanged: (v) =>
                        ref.read(searchQueryProvider.notifier).state = v,
                    onSubmitted: (val) {
                      ref.read(searchHistoryProvider.notifier).addQuery(val);
                    },
                    decoration: InputDecoration(
                      hintText: 'search_hint'.tr(),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: scheme.onSurfaceVariant,
                        size: 20,
                      ),
                      suffixIcon: query.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear_rounded,
                                  color: scheme.onSurfaceVariant, size: 18),
                              onPressed: () {
                                _controller.clear();
                                ref
                                    .read(searchQueryProvider.notifier)
                                    .state = '';
                              },
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ),
            // Expanded content: History vs Results vs Empty States
            Expanded(
              child: query.isEmpty
                  ? (history.isNotEmpty
                      ? _SearchHistoryList(
                          history: history,
                          controller: _controller,
                        )
                      : EmptyView(
                          icon: Icons.manage_search_rounded,
                          title: 'search_empty_title'.tr(),
                          subtitle: 'search_empty_subtitle'.tr(),
                        ))
                  : resultsAsync.when(
                      loading: () => GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.55,
                        ),
                        itemCount: 12,
                        itemBuilder: (_, __) => const ShimmerCard(
                          width: double.infinity,
                          height: 160,
                        ),
                      ),
                      error: (e, _) => ErrorView(
                        title: 'error_title'.tr(),
                        subtitle: 'error_subtitle'.tr(),
                        onRetry: () => ref.refresh(searchResultsProvider),
                        retryLabel: 'retry'.tr(),
                      ),
                      data: (items) => items.isEmpty
                          ? EmptyView(
                              icon: Icons.search_off_rounded,
                              title: 'search_no_results'.tr(),
                              subtitle: 'search_no_results_subtitle'.tr(),
                            )
                          : GridView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 12,
                                childAspectRatio: 0.55,
                              ),
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final anime = items[index];
                                final uniqueHeroTag = 'search-anime-${anime.id}';
                                return _SearchResultCard(
                                  anime: anime,
                                  heroTag: uniqueHeroTag,
                                  onTap: () {
                                    // Save query to history upon clicking result
                                    ref
                                        .read(searchHistoryProvider.notifier)
                                        .addQuery(query);
                                    context.push('/anime/${anime.id}?heroTag=$uniqueHeroTag');
                                  },
                                );
                              },
                            ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchHistoryList extends ConsumerWidget {
  final List<String> history;
  final TextEditingController controller;

  const _SearchHistoryList({
    required this.history,
    required this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'riwayat_pencarian'.tr(),
                style: GoogleFonts.lexend(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: scheme.onSurface,
                ),
              ),
              TextButton.icon(
                onPressed: () =>
                    ref.read(searchHistoryProvider.notifier).clearHistory(),
                icon: Icon(Icons.delete_sweep_rounded,
                    color: scheme.primary, size: 16),
                label: Text(
                  'hapus_semua'.tr(),
                  style: GoogleFonts.lexend(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: scheme.primary,
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 0.5, indent: 20, endIndent: 20),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: history.length,
            separatorBuilder: (_, __) =>
                const Divider(height: 1, thickness: 0.3, indent: 20, endIndent: 20),
            itemBuilder: (context, index) {
              final queryStr = history[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                leading: Icon(
                  Icons.history_rounded,
                  color: scheme.onSurfaceVariant.withOpacity(0.5),
                  size: 20,
                ),
                title: Text(
                  queryStr,
                  style: GoogleFonts.lexend(
                    fontSize: 14,
                    color: scheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    color: scheme.onSurfaceVariant.withOpacity(0.5),
                    size: 18,
                  ),
                  onPressed: () {
                    ref
                        .read(searchHistoryProvider.notifier)
                        .removeQuery(queryStr);
                  },
                ),
                onTap: () {
                  controller.text = queryStr;
                  ref.read(searchQueryProvider.notifier).state = queryStr;
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SearchResultCard extends StatelessWidget {
  final AnimeModel anime;
  final String heroTag;
  final VoidCallback onTap;

  const _SearchResultCard({
    required this.anime,
    required this.heroTag,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final imageUrl =
        anime.mainPicture?.large ?? anime.mainPicture?.medium ?? '';

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: heroTag,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => Container(
                          color: scheme.surfaceContainerHighest),
                      errorWidget: (_, __, ___) => Container(
                        color: scheme.surfaceContainerHighest,
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          color: scheme.onSurfaceVariant,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  if (anime.mean != null)
                    Positioned(
                      top: 6,
                      left: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.65),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star_rounded,
                                color: Color(0xFFFFD700), size: 10),
                            const SizedBox(width: 2),
                            Text(
                              anime.mean!.toStringAsFixed(1),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            anime.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lexend(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: scheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
