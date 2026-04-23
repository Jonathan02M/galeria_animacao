import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../models/card_item.dart';

class GameCard extends StatelessWidget {
  final CardItem item;
  final VoidCallback onTap;

  const GameCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return GestureDetector(
      onTap: item.revelado || item.encontrou ? null : onTap,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: item.revelado || item.encontrou ? 1 : 0),
        duration: const Duration(milliseconds: 350),
        builder: (context, value, child) {
          final angle = value * math.pi;
          final frontVisible = value < 0.5;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(angle),
            child: Container(
              decoration: BoxDecoration(
                color: frontVisible
                    ? tema.colorScheme.primaryContainer
                    : tema.colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: item.encontrou
                      ? tema.colorScheme.primary
                      : tema.colorScheme.outlineVariant,
                  width: item.encontrou ? 2 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: frontVisible
                    ? Icon(
                        Icons.question_mark_rounded,
                        size: 36,
                        color: tema.colorScheme.onPrimaryContainer,
                      )
                    : Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateY(math.pi),
                        child: Text(
                          item.emoji,
                          style: const TextStyle(fontSize: 34),
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
