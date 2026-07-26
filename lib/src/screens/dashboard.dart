import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'package:portfolio/src/models/menu_item.dart';
import 'package:portfolio/src/screens/contacts.dart';
import 'package:portfolio/src/screens/experience.dart';
import 'package:portfolio/src/screens/footer.dart';
import 'package:portfolio/src/screens/intro.dart';
import 'package:portfolio/src/screens/my_works.dart';
import 'package:portfolio/src/screens/skills.dart';
import 'package:portfolio/src/utils/app_constants.dart';
import 'package:portfolio/src/utils/app_dimens.dart';
import 'package:portfolio/src/utils/screen_util.dart';
import 'package:portfolio/src/widgets/content_width.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    for (final MenuItem item in AppConstants.menuList) item.title: GlobalKey(),
  };

  bool _isFabVisible = false;
  String _activeSection = AppConstants.about;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final bool showFab = _scrollController.offset > 240;
    final String active = _visibleSection();

    if (showFab != _isFabVisible || active != _activeSection) {
      setState(() {
        _isFabVisible = showFab;
        _activeSection = active;
      });
    }
  }

  /// The last section whose top edge has scrolled past the app bar.
  String _visibleSection() {
    final double threshold =
        kToolbarHeight + MediaQuery.paddingOf(context).top + AppSpacing.xl;
    String active = AppConstants.about;

    for (final MapEntry<String, GlobalKey> entry in _sectionKeys.entries) {
      final BuildContext? sectionContext = entry.value.currentContext;
      if (sectionContext == null) continue;

      final RenderObject? renderObject = sectionContext.findRenderObject();
      if (renderObject is! RenderBox || !renderObject.hasSize) continue;

      if (renderObject.localToGlobal(Offset.zero).dy <= threshold) {
        active = entry.key;
      }
    }
    return active;
  }

  void _scrollToSection(String title) {
    final BuildContext? sectionContext = _sectionKeys[title]?.currentContext;
    if (sectionContext == null) return;

    Scrollable.ensureVisible(
      sectionContext,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDesktop = ScreenUtil.isDesktop(context);
    final double gap = ScreenUtil.sectionSpacing(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: ContentWidth(
          child: Row(
            children: [
              Flexible(child: _BrandMark(onTap: _scrollToTop)),
              const Spacer(),
              if (isDesktop)
                for (final MenuItem item in AppConstants.menuList)
                  _NavButton(
                    title: item.title,
                    isActive: _activeSection == item.title,
                    onPressed: () => _scrollToSection(item.title),
                  ),
              const SizedBox(width: AppSpacing.sm),
              const _ThemeToggle(),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: theme.colorScheme.outlineVariant),
        ),
      ),
      drawer: isDesktop ? null : _buildDrawer(context),
      floatingActionButton: IgnorePointer(
        ignoring: !_isFabVisible,
        child: AnimatedScale(
          scale: _isFabVisible ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          child: FloatingActionButton(
            onPressed: _scrollToTop,
            tooltip: AppConstants.backToTop,
            child: const Icon(Icons.keyboard_arrow_up_rounded),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: ContentWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: gap),
              Intro(
                key: _sectionKeys[AppConstants.about],
                onContactPressed: () => _scrollToSection(AppConstants.contact),
              ),
              SizedBox(height: gap),
              Experience(key: _sectionKeys[AppConstants.experience]),
              SizedBox(height: gap),
              MyWorks(key: _sectionKeys[AppConstants.myWorks]),
              SizedBox(height: gap),
              Skills(key: _sectionKeys[AppConstants.skills]),
              SizedBox(height: gap),
              Contacts(key: _sectionKeys[AppConstants.contact]),
              SizedBox(height: gap),
              const Footer(),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Text(
                  AppConstants.name,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              for (final MenuItem item in AppConstants.menuList)
                ListTile(
                  title: Text(item.title),
                  selected: _activeSection == item.title,
                  selectedColor: theme.colorScheme.primary,
                  selectedTileColor: theme.colorScheme.primaryContainer
                      .withValues(alpha: 0.35),
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(item.title);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The name in the app bar, doubling as a "scroll to top" link.
class _BrandMark extends StatelessWidget {
  const _BrandMark({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.sm),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        child: Text(
          AppConstants.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

/// A desktop nav item that underlines the section currently in view.
class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.title,
    required this.isActive,
    required this.onPressed,
  });

  final String title;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color color = isActive
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurfaceVariant;

    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: theme.textTheme.labelLarge?.copyWith(
              color: color,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          const SizedBox(height: 3),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 2,
            width: isActive ? 18 : 0,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(AppRadius.pill),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  const _ThemeToggle();

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return IconButton(
      tooltip: AppConstants.toggleTheme,
      onPressed: () => AdaptiveTheme.of(context).toggleThemeMode(
        useSystem: false,
      ),
      icon: Icon(
        isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
      ),
    );
  }
}
