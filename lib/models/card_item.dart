class CardItem {
  final int id;
  final String emoji;
  bool revelado;
  bool encontrou;

  CardItem({
    required this.id,
    required this.emoji,
    this.revelado = false,
    this.encontrou = false,
  });
}
