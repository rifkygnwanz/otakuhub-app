import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final upcoming = ref.watch(upcomingAnimeProvider);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Top App Brand Title and Modern Search Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [scheme.primary, scheme.secondary],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: scheme.primary.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'OtakuHub',
                          style: GoogleFonts.lexend(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.6,
                            color: scheme.onSurface,
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

            // Premium Dynamic Spotlight Swiper (Banner Carousel)
            SliverToBoxAdapter(
              child: trending.when(
                data: (items) => Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: _FeaturedCarousel(items: items.take(5).toList()),
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),

            // Anime Shelf / Row sections
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  SectionHeader(title: 'trending'.tr()),
                  _HorizontalAnimeList(
                    asyncValue: trending,
                    heroTagPrefix: 'trending',
                    onRetry: () => ref.refresh(trendingProvider),
                  ),
                  SectionHeader(title: 'top_ranking'.tr()),
                  _HorizontalAnimeList(
                    asyncValue: topRanking,
                    heroTagPrefix: 'topRanking',
                    onRetry: () => ref.refresh(topRankingProvider),
                  ),
                  SectionHeader(title: 'seasonal'.tr()),
                  _HorizontalAnimeList(
                    asyncValue: seasonal,
                    heroTagPrefix: 'seasonal',
                    onRetry: () => ref.refresh(seasonalAnimeProvider),
                  ),
                  SectionHeader(title: 'upcoming'.tr()),
                  _HorizontalAnimeList(
                    asyncValue: upcoming,
                    heroTagPrefix: 'upcoming',
                    onRetry: () => ref.refresh(upcomingAnimeProvider),
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
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => context.go('/search'),
      child: Hero(
        tag: 'home-search-bar',
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHighest.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: scheme.outline.withOpacity(0.15),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Icon(
                  Icons.search_rounded,
                  color: scheme.onSurfaceVariant,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  'search_hint'.tr(),
                  style: GoogleFonts.lexend(
                    color: scheme.onSurfaceVariant,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
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

class _FeaturedCarousel extends StatefulWidget {
  final List<AnimeModel> items;
  const _FeaturedCarousel({required this.items});

  @override
  State<_FeaturedCarousel> createState() => _FeaturedCarouselState();
}

class _FeaturedCarouselState extends State<_FeaturedCarousel> {
  int _currentPage = 0;
  late final PageController _pageController;
  Timer? _autoPlayTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    // Dynamic periodic autoplay slider
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 6), (timer) {
      if (mounted && widget.items.isNotEmpty) {
        final nextPage = (_currentPage + 1) % widget.items.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) return const SizedBox.shrink();

    final scheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        SizedBox(
          height: 220,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final anime = widget.items[index];
              final imageUrl = anime.mainPicture?.large ?? anime.mainPicture?.medium ?? '';
              final genres = anime.genres ?? [];

              return GestureDetector(
                onTap: () => context.push(
                  '/anime/${anime.id}?heroTag=featured-banner-${anime.id}',
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Banner Background Image
                      CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        alignment: const Alignment(0, -0.3),
                        placeholder: (_, __) => Container(color: scheme.surfaceContainerHighest),
                        errorWidget: (_, __, ___) => Container(color: scheme.surfaceContainerHighest),
                      ),

                      // Premium Dual Gradient Dark Overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.black.withOpacity(0.95),
                              Colors.black.withOpacity(0.55),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.45, 1.0],
                          ),
                        ),
                      ),

                      // Spotlight Card Content
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // "SPOTLIGHT" Accent Tag
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: scheme.primary.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'SPOTLIGHT',
                                style: GoogleFonts.lexend(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Title
                            Text(
                              anime.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lexend(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                height: 1.25,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Star and Genres Row
                            Row(
                              children: [
                                if (anime.mean != null) ...[
                                  const Icon(
                                    Icons.star_rounded,
                                    color: Color(0xFFFFD700),
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    anime.mean!.toStringAsFixed(1),
                                    style: GoogleFonts.lexend(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                ],
                                if (genres.isNotEmpty)
                                  Expanded(
                                    child: Text(
                                      genres.take(2).map((g) => g.name).join(' • '),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.lexend(
                                        color: Colors.white60,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        // Modern Swiper Dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.items.length, (index) {
            final isActive = _currentPage == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 6,
              width: isActive ? 18 : 6,
              decoration: BoxDecoration(
                color: isActive ? scheme.primary : scheme.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _HorizontalAnimeList extends StatelessWidget {
  final AsyncValue<List<AnimeModel>> asyncValue;
  final VoidCallback? onRetry;
  final String heroTagPrefix;

  const _HorizontalAnimeList({
    required this.asyncValue,
    required this.heroTagPrefix,
    this.onRetry,
  });

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
            final uniqueHeroTag = '$heroTagPrefix-anime-${anime.id}';
            return AnimeCard(
              anime: anime,
              heroTag: uniqueHeroTag,
              onTap: () => context.push('/anime/${anime.id}?heroTag=$uniqueHeroTag'),
            );
          },
        ),
      ),
    );
  }
}
