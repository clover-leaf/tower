// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';

/// {@template animated_progress_bar}
/// A [Widget] that renders a intrinsically animated progress bar.
///
/// [progress] should be between 0 and 1;
/// {@endtemplate}
class AnimatedProgressBar extends StatelessWidget {
  /// {@macro animated_progress_bar}
  const AnimatedProgressBar({
    super.key,
    required this.progress,
    required this.backgroundColor,
    required this.foregroundColor,
  }) : assert(
          progress >= 0.0 && progress <= 1.0,
          'Progress should be set between 0.0 and 1.0',
        );

  /// The background color of the progress bar.
  final Color backgroundColor;

  /// The foreground color of the progress bar.
  final Color foregroundColor;

  /// The current progress for the bar.
  final double progress;

  /// The duration of the animation on [AnimatedProgressBar]
  static const Duration intrinsicAnimationDuration =
      Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    // Outer bar
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: 3, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        height: 34,
        width: 320,
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: progress),
          duration: intrinsicAnimationDuration,
          builder: (BuildContext context, double progress, _) {
            // Inner bar
            return FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Container(
                decoration: BoxDecoration(
                  color: foregroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
