import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../models/card_item.dart';
import '../widgets/game_card.dart';
import 'result_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;

  List<CardItem> cartas = [];
  List<int> selecionadas = [];
  int movimentos = 0;
  int paresEncontrados = 0;
  bool bloqueado = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1, end: 1.06).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    iniciarJogo();
  }

  void iniciarJogo() {
    final emojis = ['🐶', '🚗', '🍔', '⚽', '🎧', '⌚'];
    final lista = <CardItem>[];

    for (int i = 0; i < emojis.length; i++) {
      lista.add(CardItem(id: i, emoji: emojis[i]));
      lista.add(CardItem(id: i, emoji: emojis[i]));
    }

    lista.shuffle(Random());
    cartas = lista;
  }

  Future<void> revelarCarta(int index) async {
    if (bloqueado || cartas[index].revelado || cartas[index].encontrou) return;

    setState(() {
      cartas[index].revelado = true;
      selecionadas.add(index);
    });

    if (selecionadas.length == 2) {
      movimentos++;
      bloqueado = true;

      final primeira = cartas[selecionadas[0]];
      final segunda = cartas[selecionadas[1]];

      if (primeira.id == segunda.id) {
        await Future.delayed(const Duration(milliseconds: 400));
        setState(() {
          primeira.encontrou = true;
          segunda.encontrou = true;
          paresEncontrados++;
          selecionadas.clear();
          bloqueado = false;
        });

        if (paresEncontrados == 6 && mounted) {
          await Future.delayed(const Duration(milliseconds: 450));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => ResultScreen(movimentos: movimentos),
            ),
          );
        }
      } else {
        await Future.delayed(const Duration(milliseconds: 850));
        setState(() {
          primeira.revelado = false;
          segunda.revelado = false;
          selecionadas.clear();
          bloqueado = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Memory Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: tema.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _InfoBox(label: 'Movimentos', value: '$movimentos'),
                  _InfoBox(label: 'Pares', value: '$paresEncontrados/6'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: AnimatedBuilder(
                animation: _pulseAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _pulseAnimation.value,
                    child: child,
                  );
                },
                child: GridView.builder(
                  itemCount: cartas.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.82,
                  ),
                  itemBuilder: (context, index) {
                    return GameCard(
                      item: cartas[index],
                      onTap: () => revelarCarta(index),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String label;
  final String value;

  const _InfoBox({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Column(
      children: [
        Text(
          label,
          style: tema.textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: tema.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
