import 'package:flutter/material.dart';

class SizeTransitionAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  const SizeTransitionAnimation({super.key, required this.child, this.duration = const Duration(milliseconds: 300)});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: duration,
      curve: Curves.fastOutSlowIn,
      child: child,
    );
  }
}