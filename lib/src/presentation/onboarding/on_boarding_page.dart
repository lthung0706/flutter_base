import 'package:app_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/app_assets.dart';
import '../app/bloc/global_app_bloc.dart';
import '../app/widgets/app_language_popup_button.dart';
import '../app/widgets/app_settings_provider.dart';

// ─── Data model ──────────────────────────────────────────────────────────────
class _OnboardingData {
  final String tag;
  final Color tagColor;
  final Color tagBg;
  final String title; // plain part
  final String titleEm; // italic/colored part
  final String desc;
  final Widget illustration;

  const _OnboardingData({
    required this.tag,
    required this.tagColor,
    required this.tagBg,
    required this.title,
    required this.titleEm,
    required this.desc,
    required this.illustration,
  });
}

// ─── Main Screen ─────────────────────────────────────────────────────────────
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _ctrl;
  int _cur = 0;
  static const int _total = 4;
  Locale? _lastLocale;

  @override
  void initState() {
    super.initState();
    _ctrl = PageController(initialPage: _cur);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Watch AppSettingsProvider so we rebuild and restore PageView on language switch
    final locale = AppSettingsProvider.of(context).resolvedLocale;
    if (_lastLocale != null && _lastLocale != locale) {
      // Recreate controller with current page so the new PageView
      // (forced by ValueKey) starts at the correct page index.
      _ctrl.dispose();
      _ctrl = PageController(initialPage: _cur);
    }
    _lastLocale = locale;
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _goTo(int n) {
    if (n < 0 || n >= _total) return;
    _ctrl.animateToPage(
      n,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeInOutCubic,
    );
  }

  void _onNext() {
    if (_cur < _total - 1) {
      _goTo(_cur + 1);
    } else {
      _completeOnBoarding();
    }
  }

  void _completeOnBoarding() {
    BlocProvider.of<GlobalAppBloc>(context).add(GlobalAppContinueOnBoarding());
  }

  @override
  Widget build(BuildContext context) {
    // Rely on AppSettingsProvider for explicit language updates
    final appSettings = AppSettingsProvider.of(context);
    final currentLanguageCode = appSettings.resolvedLocale.languageCode;

    final isLast = _cur == _total - 1;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // ── Language popup (top-right) ────────────────────
            const Padding(
              padding: EdgeInsets.only(top: 8, right: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: AppLanguagePopupButton(),
              ),
            ),

            // ── Pages ──────────────────────────────────────────
            Expanded(
              child: PageView.builder(
                key: ValueKey(
                  currentLanguageCode,
                ), // Force rebuild on language change
                controller: _ctrl,
                itemCount: _total,
                onPageChanged: (i) => setState(() => _cur = i),
                itemBuilder: (_, i) => _OnboardingPage(
                  index: i,
                  languageCode: currentLanguageCode,
                ),
              ),
            ),

            // ── Bottom nav ─────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _total,
                      (i) => _Dot(active: i == _cur),
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Buttons
                  AnimatedSwitcher(
                    switchInCurve: Curves.easeInOutBack,
                    switchOutCurve: Curves.easeInOutBack,
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    duration: const Duration(milliseconds: 300),
                    child: !isLast
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () => _goTo(_total - 1),
                                child: Text(
                                  context.l10n.onboardingSkip,
                                  style: TextStyle(color: colorScheme.outline),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: _onNext,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorScheme.primary,
                                  foregroundColor: colorScheme.onPrimary,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(context.l10n.onboardingNext),
                                    const SizedBox(width: 8),
                                    const Icon(Icons.arrow_forward, size: 18),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : SizedBox(
                            width: double.infinity,
                            height: 54,
                            child: ElevatedButton(
                              onPressed: _onNext,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.secondary,
                                foregroundColor: colorScheme.onSecondary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Text(
                                context.l10n.onboardingStartNow,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Single page ─────────────────────────────────────────────────────────────
class _OnboardingPage extends StatelessWidget {
  final int index;
  final String? languageCode;
  const _OnboardingPage({required this.index, this.languageCode});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    late final _OnboardingData data;
    switch (index) {
      case 0:
        data = _OnboardingData(
          tag: l10n.onboardingSstripTag,
          tagColor: colorScheme.primary,
          tagBg: colorScheme.primary.withValues(alpha: 0.1),
          title: l10n.onboardingSstripTitle,
          titleEm: l10n.onboardingSstripTitleEm,
          desc: l10n.onboardingSstripDesc,
          illustration: const _Page1Illustration(),
        );
        break;
      case 1:
        data = _OnboardingData(
          tag: l10n.onboardingFeatureTag,
          tagColor: colorScheme.primary,
          tagBg: colorScheme.primary.withValues(alpha: 0.1),
          title: l10n.onboardingFeatureTitle,
          titleEm: l10n.onboardingFeatureTitleEm,
          desc: l10n.onboardingFeatureDesc,
          illustration: const _Page2Illustration(),
        );
        break;
      case 2:
        data = _OnboardingData(
          tag: l10n.onboardingStartTag,
          tagColor: colorScheme.primary,
          tagBg: colorScheme.primary.withValues(alpha: 0.1),
          title: l10n.onboardingStartTitle,
          titleEm: l10n.onboardingStartTitleEm,
          desc: l10n.onboardingStartDesc,
          illustration: const _Page3Illustration(),
        );
        break;
      case 3:
      default:
        data = _OnboardingData(
          tag: l10n.onboardingReadyTag,
          tagColor: colorScheme.secondary,
          tagBg: colorScheme.secondary.withValues(alpha: 0.1),
          title: l10n.onboardingReadyTitle,
          titleEm: l10n.onboardingReadyTitleEm,
          desc: l10n.onboardingReadyDesc,
          illustration: const _Page4Illustration(),
        );
        break;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 0, 28, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Illustration
          Expanded(child: Center(child: data.illustration)),

          // Tag
          _Tag(label: data.tag, color: data.tagColor, bg: data.tagBg),
          const SizedBox(height: 12),

          // Title
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 26,
                height: 1.22,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              children: [
                TextSpan(text: data.title),
                TextSpan(
                  text: data.titleEm,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: data.tagColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Description
          Text(
            data.desc,
            style: TextStyle(
              fontSize: 13,
              height: 1.65,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

// ─── Dot indicator ────────────────────────────────────────────────────────────
class _Dot extends StatelessWidget {
  final bool active;
  const _Dot({required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeInOutCubic,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: active ? 20 : 5,
      height: 5,
      decoration: BoxDecoration(
        color: active
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

// ─── Tag badge ────────────────────────────────────────────────────────────────
class _Tag extends StatelessWidget {
  final String label;
  final Color color;
  final Color bg;
  const _Tag({required this.label, required this.color, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.08 * 10,
          color: color,
        ),
      ),
    );
  }
}

// ─── Next button ─────────────────────────────────────────────────────────────
class _NextButton extends StatefulWidget {
  final bool isLast;
  final VoidCallback onTap;
  const _NextButton({required this.isLast, required this.onTap});

  @override
  State<_NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<_NextButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bg = widget.isLast ? colorScheme.secondary : colorScheme.primary;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 50,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Text(
                  widget.isLast
                      ? context.l10n.onboardingStartNow
                      : context.l10n.onboardingNext,
                  key: ValueKey(widget.isLast),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(width: 7),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Text(
                  widget.isLast ? '✓' : '→',
                  key: ValueKey('arrow_${widget.isLast}'),
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
//  ILLUSTRATIONS
// ══════════════════════════════════════════════════════════════════════════════

// ─── Page 1 ───────────────────────────────────────────────────────────────────
class _Page1Illustration extends StatelessWidget {
  const _Page1Illustration();

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.onboarding1, fit: BoxFit.contain);
  }
}

// ─── Page 2 ───────────────────────────────────────────────────────────────────
class _Page2Illustration extends StatelessWidget {
  const _Page2Illustration();

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.onboarding2, fit: BoxFit.contain);
  }
}

// ─── Page 3 ───────────────────────────────────────────────────────────────────
class _Page3Illustration extends StatelessWidget {
  const _Page3Illustration();

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.onboarding3, fit: BoxFit.contain);
  }
}

// ─── Page 4 ───────────────────────────────────────────────────────────────────
class _Page4Illustration extends StatelessWidget {
  const _Page4Illustration();

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.onboarding4, fit: BoxFit.contain);
  }
}
