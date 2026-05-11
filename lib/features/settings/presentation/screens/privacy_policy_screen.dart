import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => context.pop(),
        ),
        title: Text('privacy_title'.tr()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'privacy_title'.tr(),
            style: GoogleFonts.lexend(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: scheme.onSurface,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'privacy_last_updated'.tr(),
            style: GoogleFonts.lexend(
              fontSize: 12,
              color: scheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          _PrivacySection(
            title: '',
            body: 'privacy_intro'.tr(),
            isIntro: true,
          ),
          _PrivacySection(
            title: 'privacy_data_title'.tr(),
            body: 'privacy_data_body'.tr(),
          ),
          _PrivacySection(
            title: 'privacy_third_party_title'.tr(),
            body: 'privacy_third_party_body'.tr(),
          ),
          _PrivacySection(
            title: 'privacy_contact_title'.tr(),
            body: 'privacy_contact_body'.tr(),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.primaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Icon(Icons.verified_user_outlined,
                    color: scheme.primary, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'MyAnimeList® is a registered trademark of MyAnimeList Co., Ltd.',
                    style: GoogleFonts.lexend(
                      fontSize: 11,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _PrivacySection extends StatelessWidget {
  final String title;
  final String body;
  final bool isIntro;

  const _PrivacySection({
    required this.title,
    required this.body,
    this.isIntro = false,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty) ...[
            Text(
              title,
              style: GoogleFonts.lexend(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: scheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
          ],
          Text(
            body,
            style: GoogleFonts.lexend(
              fontSize: 13,
              height: 1.7,
              color: isIntro ? scheme.onSurface : scheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
