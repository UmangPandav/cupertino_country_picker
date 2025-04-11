// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, file_names
import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart' show PlayAnimationBuilder;
import 'package:simple_animations/movie_tween/movie_tween.dart' show MovieTween;
import 'package:simple_animations/simple_animations.dart' show Movie;
import 'package:supercharged/supercharged.dart';

enum AniProps { opacity, translateX, translateY }

enum FadeFrom {
  topLeft,
  top,
  topRight,
  left,
  center,
  right,
  bottomLeft,
  bottom,
  bottomRight
}

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final FadeFrom fadeFrom;
  final double size;

  FadeAnimation(
      {super.key,
      this.delay = 0,
      required this.child,
      this.fadeFrom = FadeFrom.center,
      this.size = 30.0});

  @override
  Widget build(BuildContext context) {
    final Map<FadeFrom, Offset> positionOffsets = {
      FadeFrom.topLeft: Offset(-size, -size),
      FadeFrom.top: Offset(0.0, -size),
      FadeFrom.topRight: Offset(size, -size),
      FadeFrom.left: Offset(-size, 0.0),
      FadeFrom.center: Offset(0.0, 0.0),
      FadeFrom.right: Offset(size, 0.0),
      FadeFrom.bottomLeft: Offset(-size, size),
      FadeFrom.bottom: Offset(0.0, size),
      FadeFrom.bottomRight: Offset(size, size),
    };

    final Offset offset = positionOffsets[fadeFrom]!;
    final tween = MovieTween()
      ..tween(AniProps.opacity, 0.0.tweenTo(1.0), duration: 300.milliseconds)
      ..tween(AniProps.translateX, offset.dx.tweenTo(0.0),
          duration: 500.milliseconds, curve: Curves.easeOutBack)
      ..tween(AniProps.translateY, offset.dy.tweenTo(0.0),
          duration: 500.milliseconds, curve: Curves.easeOutBack);

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, value, child) => Opacity(
        opacity: value.get(AniProps.opacity),
        child: Transform.translate(
          offset: Offset(
              value.get(AniProps.translateX), value.get(AniProps.translateY)),
          child: child,
        ),
      ),
    );
  }
}
