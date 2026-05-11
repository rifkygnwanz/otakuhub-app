import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../features/home/data/models/anime_model.dart';

class AnimeCard extends StatelessWidget {
  final AnimeModel anime;
  final VoidCallback? onTap;
  final double width;
  final double height;

  const AnimeCard({
    super.key,
    required this.anime,
    this.onTap,
    this.width = 140,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final imageUrl = anime.mainPicture?.large ?? anime.mainPicture?.medium;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  Hero(
                    tag: 'anime-${anime.id}',
                    child: CachedNetworkImage(
                      imageUrl: imageUrl ?? '',
                      width: width,
                      height: height,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: width,
                        height: height,
                        color: scheme.surfaceContainerHighest,
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: width,
                        height: height,
                        color: scheme.surfaceContainerHighest,
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          color: scheme.onSurfaceVariant,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  if (anime.mean != null)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.65),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Color(0xFFFFD700),
                              size: 12,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              anime.mean!.toStringAsFixed(1),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
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
            const SizedBox(height: 8),
            Text(
              anime.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
            ),
            if (anime.mediaType != null)
              Text(
                anime.mediaType!.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: scheme.primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
              ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.05, end: 0);
  }
}
