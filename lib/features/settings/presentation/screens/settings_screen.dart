import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/l10n/locale_provider.dart';
import '../../../../core/theme/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                child: Text(
                  'settings'.tr(),
                  style: GoogleFonts.lexend(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: scheme.onSurface,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SectionLabel(label: 'theme'.tr()),
                    _SettingsCard(
                      children: [
                        _ThemeOption(
                          label: 'theme_system'.tr(),
                          icon: Icons.brightness_auto_rounded,
                          selected: themeMode == ThemeMode.system,
                          onTap: () => ref
                              .read(themeModeProvider.notifier)
                              .setTheme(ThemeMode.system),
                        ),
                        _Divider(),
                        _ThemeOption(
                          label: 'theme_light'.tr(),
                          icon: Icons.light_mode_rounded,
                          selected: themeMode == ThemeMode.light,
                          onTap: () => ref
                              .read(themeModeProvider.notifier)
                              .setTheme(ThemeMode.light),
                        ),
                        _Divider(),
                        _ThemeOption(
                          label: 'theme_dark'.tr(),
                          icon: Icons.dark_mode_rounded,
                          selected: themeMode == ThemeMode.dark,
                          onTap: () => ref
                              .read(themeModeProvider.notifier)
                              .setTheme(ThemeMode.dark),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _SectionLabel(label: 'language'.tr()),
                    _SettingsCard(
                      children: [
                        _LanguageOption(
                          label: 'language_en'.tr(),
                          flag: '🇺🇸',
                          selected: locale.languageCode == 'en',
                          onTap: () {
                            ref
                                .read(localeProvider.notifier)
                                .setLocale(const Locale('en'));
                            context.setLocale(const Locale('en'));
                          },
                        ),
                        _Divider(),
                        _LanguageOption(
                          label: 'language_id'.tr(),
                          flag: '🇮🇩',
                          selected: locale.languageCode == 'id',
                          onTap: () {
                            ref
                                .read(localeProvider.notifier)
                                .setLocale(const Locale('id'));
                            context.setLocale(const Locale('id'));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _SectionLabel(label: 'about'.tr()),
                    _SettingsCard(
                      children: [
                        _SettingsTile(
                          icon: Icons.privacy_tip_outlined,
                          label: 'privacy_policy'.tr(),
                          onTap: () => context.push('/privacy'),
                          trailing: const Icon(
                              Icons.chevron_right_rounded,
                              size: 20),
                        ),
                        _Divider(),
                        _SettingsTile(
                          icon: Icons.info_outline_rounded,
                          label: 'version'.tr(),
                          trailing: Text(
                            '1.0.0',
                            style: GoogleFonts.lexend(
                              fontSize: 13,
                              color: scheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 10),
      child: Text(
        label.toUpperCase(),
        style: GoogleFonts.lexend(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final List<Widget> children;
  const _SettingsCard({required this.children});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: scheme.outline.withOpacity(0.1)),
      ),
      child: Column(children: children),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      indent: 16,
      endIndent: 16,
      color: Theme.of(context).colorScheme.outline.withOpacity(0.12),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon,
                size: 20,
                color: selected ? scheme.primary : scheme.onSurfaceVariant),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.lexend(
                  fontSize: 14,
                  fontWeight:
                      selected ? FontWeight.w600 : FontWeight.w400,
                  color: selected ? scheme.primary : scheme.onSurface,
                ),
              ),
            ),
            if (selected)
              Icon(Icons.check_circle_rounded,
                  color: scheme.primary, size: 18),
          ],
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String label;
  final String flag;
  final bool selected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.label,
    required this.flag,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.lexend(
                  fontSize: 14,
                  fontWeight:
                      selected ? FontWeight.w600 : FontWeight.w400,
                  color: selected ? scheme.primary : scheme.onSurface,
                ),
              ),
            ),
            if (selected)
              Icon(Icons.check_circle_rounded,
                  color: scheme.primary, size: 18),
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.icon,
    required this.label,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 20, color: scheme.onSurfaceVariant),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.lexend(
                  fontSize: 14,
                  color: scheme.onSurface,
                ),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
