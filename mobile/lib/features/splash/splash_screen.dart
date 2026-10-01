import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/design_tokens.dart';

/// Startup animation: the logo pops out from the center (a quick
/// overshoot scale-in), holds briefly, then the whole thing fades away
/// into the app. Runs once per cold start, right after the native splash
/// (flutter_native_splash) hands off to the Flutter engine.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _logoOpacity;
  late final Animation<double> _fadeOut;

  static const _popEnd = 0.45; // pop-out finishes at 45% of the timeline
  static const _holdEnd = 0.65; // brief hold before fading
  // fade-out runs from _holdEnd to 1.0

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.15)
            .chain(CurveTween(curve: Curves.easeOutBack)),
        weight: _popEnd,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.15, end: 1.0).chain(CurveTween(curve: Curves.easeOut)),
        weight: _holdEnd - _popEnd,
      ),
      TweenSequenceItem(
        tween: ConstantTween(1.0),
        weight: 1 - _holdEnd,
      ),
    ]).animate(_controller);

    _logoOpacity = CurvedAnimation(
      parent: _controller,
      curve: Interval(0, _popEnd * 0.6, curve: Curves.easeOut),
    );

    _fadeOut = CurvedAnimation(
      parent: _controller,
      curve: Interval(_holdEnd, 1.0, curve: Curves.easeIn),
    );

    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        context.go('/today');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The app icon and this splash sit on the same deep-zinc canvas
      // (design/DESIGN.md); colorScheme.primary is a light "on-dark-surface"
      // role in this design system, not a background, so using it here
      // washed the logo out to near-white.
      backgroundColor: AppColors.canvas,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: 1 - _fadeOut.value,
            child: Center(
              child: Opacity(
                opacity: _logoOpacity.value,
                child: Transform.scale(
                  scale: _scale.value,
                  child: child,
                ),
              ),
            ),
          );
        },
        child: Image.asset('assets/icon/splash_logo.png', width: 160, height: 160),
      ),
    );
  }
}
