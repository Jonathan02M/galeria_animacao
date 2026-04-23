import 'package:flutter/material.dart';

class Bolinha extends StatefulWidget {
  final VoidCallback onTap;

  const Bolinha({super.key, required this.onTap});

  @override
  State<Bolinha> createState() => _BolinhaState();
}

class _BolinhaState extends State<Bolinha> {
  double tamanho = 40;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) setState(() => tamanho = 70);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: tamanho,
        height: tamanho,
        decoration: const BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
      ),
    );
  }
}
