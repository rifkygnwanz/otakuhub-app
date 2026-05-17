import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../shared/widgets/anime_card.dart';
import '../../../../shared/widgets/empty_view.dart';
import '../providers/wishlist_provider.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(wishlistProvider);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 10),
                child: Text(
                  'wishlist'.tr(),
                  style: GoogleFonts.lexend(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: scheme.onSurface,
                  ),
                ),
              ),
            ),
            if (items.isEmpty)
              SliverFillRemaining(
                child: EmptyView(
                  icon: Icons.bookmarks_outlined,
                  title: 'wishlist_empty_title'.tr(),
                  subtitle: 'wishlist_empty_subtitle'.tr(),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final anime = items[index];
                      final uniqueHeroTag = 'wishlist-anime-${anime.id}';
                      return AnimeCard(
                        anime: anime,
                        width: double.infinity,
                        height: 180,
                        heroTag: uniqueHeroTag,
                        onTap: () =>
                            context.push('/anime/${anime.id}?heroTag=$uniqueHeroTag'),
                      );
                    },
                    childCount: items.length,
                  ),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.58,
                  ),
                ),
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}
