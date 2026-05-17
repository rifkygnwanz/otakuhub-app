import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../shared/widgets/anime_card.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../wishlist/presentation/providers/wishlist_provider.dart';
import '../providers/home_provider.dart';

class AnimeDetailScreen extends ConsumerStatefulWidget {
  final int animeId;
  final String? heroTag;
  const AnimeDetailScreen({super.key, required this.animeId, this.heroTag});

  @override
  ConsumerState<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends ConsumerState<AnimeDetailScreen> {
  late ScrollController _scrollController;
  bool _showAppBarTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      // 360 (expandedHeight) - kToolbarHeight = ~304. Fading in at 240 offsets creates a perfectly smooth crossover.
      if (_scrollController.offset > 240) {
        if (!_showAppBarTitle) {
          setState(() {
            _showAppBarTitle = true;
          });
        }
      } else {
        if (_showAppBarTitle) {
          setState(() {
            _showAppBarTitle = false;
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String _capitalizeString(String? val) {
    if (val == null || val.isEmpty) return 'n_a'.tr();
    return val
        .split('_')
        .map((w) => w.isEmpty ? '' : w[0].toUpperCase() + w.substring(1).toLowerCase())
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(animeDetailProvider(widget.animeId));
    final wishlist = ref.watch(wishlistProvider);
    final scheme = Theme.of(context).colorScheme;
    final isInWishlist = wishlist.any((a) => a.id == widget.animeId);

    return Scaffold(
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Scaffold(
          appBar: AppBar(),
          body: ErrorView(
            title: 'error_title'.tr(),
            subtitle: 'error_subtitle'.tr(),
            onRetry: () => ref.refresh(animeDetailProvider(widget.animeId)),
            retryLabel: 'retry'.tr(),
          ),
        ),
        data: (anime) {
          final imageUrl =
              anime.mainPicture?.large ?? anime.mainPicture?.medium ?? '';
          final genres = anime.genres ?? [];
          final studios = anime.studios ?? [];
          final recommendations = anime.recommendations ?? [];

          final List<({String label, String value})> infoData = [];
          if (anime.status != null && anime.status!.isNotEmpty) {
            infoData.add((label: 'status'.tr(), value: anime.status!.tr()));
          }
          if (anime.startSeason != null && anime.startSeason!.season != null) {
            infoData.add((
              label: 'season'.tr(),
              value: '${anime.startSeason!.season?.capitalize()} ${anime.startSeason!.year}'
            ));
          }
          if (studios.isNotEmpty) {
            infoData.add((
              label: 'studios'.tr(),
              value: studios.map((s) => s.name).join(', ')
            ));
          }
          if (anime.source != null && anime.source!.isNotEmpty) {
            infoData.add((
              label: 'source'.tr(),
              value: _capitalizeString(anime.source)
            ));
          }
          if (anime.averageEpisodeDuration != null && anime.averageEpisodeDuration! > 0) {
            infoData.add((
              label: 'duration'.tr(),
              value: '${anime.averageEpisodeDuration} min'
            ));
          }

          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 360,
                pinned: true,
                stretch: true,
                backgroundColor: scheme.surface,
                elevation: 0,
                scrolledUnderElevation: 0,
                leading: GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.white, size: 18),
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      ref.read(wishlistProvider.notifier).toggle(anime);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isInWishlist
                                ? 'removed_from_wishlist'.tr()
                                : 'added_to_wishlist'.tr(),
                          ),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isInWishlist
                            ? Icons.bookmark_rounded
                            : Icons.bookmark_border_rounded,
                        color: isInWishlist
                            ? const Color(0xFFFFD700)
                            : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
                // Fades title in dynamically as user scrolls down
                title: AnimatedOpacity(
                  opacity: _showAppBarTitle ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  child: Text(
                    anime.title,
                    style: GoogleFonts.lexend(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: scheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                  ],
                  background: Hero(
                    tag: widget.heroTag ?? 'anime-${widget.animeId}',
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (_, __) => Container(
                              color: scheme.surfaceContainerHighest),
                          errorWidget: (_, __, ___) =>
                              Container(color: scheme.surfaceContainerHighest),
                        ),
                        // Cloud-like gradient overlay to seamlessly blend the banner into the page surface
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.35),
                                Colors.transparent,
                                scheme.surface.withOpacity(0.5),
                                scheme.surface,
                              ],
                              stops: const [0.0, 0.4, 0.8, 1.0],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        anime.title,
                        style: GoogleFonts.lexend(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: scheme.onSurface,
                          height: 1.2,
                        ),
                      ).animate().fadeIn(delay: 100.ms),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (anime.mean != null)
                            _StatChip(
                              icon: Icons.star_rounded,
                              label: anime.mean!.toStringAsFixed(1),
                              iconColor: const Color(0xFFFFD700),
                            ),
                          if (anime.rank != null)
                            _StatChip(
                              icon: Icons.emoji_events_rounded,
                              label: '#${anime.rank}',
                              iconColor: scheme.primary,
                            ),
                          if (anime.numEpisodes != null &&
                              anime.numEpisodes! > 0)
                            _StatChip(
                              icon: Icons.movie_filter_rounded,
                              label: '${anime.numEpisodes} eps',
                              iconColor: scheme.secondary,
                            ),
                          if (anime.mediaType != null)
                            _StatChip(
                              icon: Icons.live_tv_rounded,
                              label: anime.mediaType!.toUpperCase(),
                              iconColor: scheme.tertiary,
                            ),
                        ],
                      ).animate().fadeIn(delay: 150.ms),
                      if (genres.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: genres
                              .map((g) => _GenreChip(label: g.name))
                              .toList(),
                        ).animate().fadeIn(delay: 200.ms),
                      ],
                      const SizedBox(height: 20),
                      
                      // Glowing Premium "Watch Trailer" Button
                      if (anime.background != null && anime.background!.isNotEmpty)
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: () => context.push(
                              '/watch/${anime.id}?title=${Uri.encodeComponent(anime.title)}&youtubeId=${anime.background}',
                            ),
                            icon: const Icon(Icons.play_circle_fill_rounded, size: 20),
                            label: Text(
                              'Watch Trailer',
                              style: GoogleFonts.lexend(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: scheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                              shadowColor: scheme.primary.withOpacity(0.4),
                            ),
                          ),
                        ).animate().fadeIn(delay: 220.ms).slideY(begin: 0.1, end: 0, duration: 300.ms),
                      if (anime.synopsis?.isNotEmpty == true) ...[
                        const SizedBox(height: 24),
                        Text(
                          'synopsis'.tr(),
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: scheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _ExpandableSynopsis(synopsis: anime.synopsis!),
                      ],
                      if (infoData.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Text(
                          'information'.tr(),
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: scheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          decoration: BoxDecoration(
                            color: scheme.surfaceContainerHighest.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: List.generate(infoData.length, (index) {
                              final item = infoData[index];
                              return _InfoRow(
                                label: item.label,
                                value: item.value,
                                isLast: index == infoData.length - 1,
                              );
                            }),
                          ),
                        ).animate().fadeIn(delay: 250.ms),
                      ],
                      if (recommendations.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Text(
                          'Recommendations',
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: scheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 256,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: recommendations
                                .take(10)
                                .length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              final rec = recommendations[index].node;
                              if (rec == null) return const SizedBox.shrink();
                              final uniqueHeroTag = 'recommendation-anime-${rec.id}';
                              return AnimeCard(
                                anime: rec,
                                heroTag: uniqueHeroTag,
                                onTap: () =>
                                    context.push('/anime/${rec.id}?heroTag=$uniqueHeroTag'),
                              );
                            },
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;

  const _StatChip(
      {required this.icon, required this.label, this.iconColor});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: iconColor ?? scheme.primary),
          const SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.lexend(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: scheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _GenreChip extends StatelessWidget {
  final String label;
  const _GenreChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: scheme.primaryContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: GoogleFonts.lexend(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: scheme.primary,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLast;

  const _InfoRow(
      {required this.label, required this.value, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  label,
                  style: GoogleFonts.lexend(
                    fontSize: 13,
                    color: scheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  value,
                  textAlign: TextAlign.end,
                  style: GoogleFonts.lexend(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: scheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (!isLast)
          Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
            color: scheme.outline.withOpacity(0.1),
          ),
      ],
    );
  }
}

class _ExpandableSynopsis extends StatefulWidget {
  final String synopsis;
  const _ExpandableSynopsis({required this.synopsis});

  @override
  State<_ExpandableSynopsis> createState() => _ExpandableSynopsisState();
}

class _ExpandableSynopsisState extends State<_ExpandableSynopsis> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          firstChild: Text(
            widget.synopsis,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lexend(
              fontSize: 13,
              height: 1.6,
              color: scheme.onSurfaceVariant,
            ),
          ),
          secondChild: Text(
            widget.synopsis,
            style: GoogleFonts.lexend(
              fontSize: 13,
              height: 1.6,
              color: scheme.onSurfaceVariant,
            ),
          ),
          crossFadeState:
              _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              _expanded ? 'Show less' : 'Read more',
              style: GoogleFonts.lexend(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: scheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

extension StringCapitalize on String {
  String capitalize() =>
      isEmpty ? this : this[0].toUpperCase() + substring(1);
}
