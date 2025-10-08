import 'package:flutter/material.dart';
import 'package:frontend_chatbot/core/utils/context_extention.dart';

class CommonBackground extends StatelessWidget {
  const CommonBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight,
      width: context.screenWidth,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF3B21B7), // 0%
            Color(0xFF8B64DA), // 8%
            Color(0xFFD195EE), // 73%
            Color(0xFFCECBD3), // 100%
          ],
          stops: [0.0, 0.08, 0.73, 1.0],
        ),
      ),
      child: child,
    );
  }
}
