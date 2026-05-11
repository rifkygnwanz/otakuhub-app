import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/anime_card.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../../shared/widgets/shimmer_card.dart';
import '../providers/home_provider.dart';
import '../../data/models/anime_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seasonal = ref.watch(seasonalAnimeProvider);
    final topRanking = ref.watch(topRankingProvider);
    final trending = ref.watch(trendingProvider);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: scheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'OtakuHub',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.5,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _SearchBarTile(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(title: 'trending'.tr()),
                  _HorizontalAnimeList(
                    asyncValue: trending,
                    onRetry: () => ref.refresh(trendingProvider),
                  ),
                  SectionHeader(title: 'top_ranking'.tr()),
                  _HorizontalAnimeList(
                    asyncValue: topRanking,
                    onRetry: () => ref.refresh(topRankingProvider),
                  ),
                  SectionHeader(title: 'seasonal'.tr()),
                  _HorizontalAnimeList(
                    asyncValue: seasonal,
                    onRetry: () => ref.refresh(seasonalAnimeProvider),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBarTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/search'),
      child: Hero(
        tag: 'search-bar',
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Icon(
                  Icons.search_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  'search_hint'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HorizontalAnimeList extends StatelessWidget {
  final AsyncValue<List<AnimeModel>> asyncValue;
  final VoidCallback? onRetry;

  const _HorizontalAnimeList({required this.asyncValue, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      loading: () => const ShimmerList(),
      error: (e, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: ErrorView(
          title: 'error_title'.tr(),
          subtitle: 'error_subtitle'.tr(),
          onRetry: onRetry,
          retryLabel: 'retry'.tr(),
        ),
      ),
      data: (items) => SizedBox(
        height: 256,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final anime = items[index];
            return AnimeCard(
              anime: anime,
              onTap: () => context.push('/anime/${anime.id}'),
            );
          },
        ),
      ),
    );
  }
}
