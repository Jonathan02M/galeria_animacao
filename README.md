🎮 Jogo da Memória Animado (Flutter)
📱 Sobre o Projeto
Este aplicativo foi desenvolvido em Flutter com o objetivo de demonstrar o uso de animações implícitas, explícitas e componentes personalizados, seguindo os princípios do Material Design 3.
O app consiste em um jogo da memória interativo, onde o usuário deve encontrar pares de cartas com animações suaves e feedback visual.
🚀 Funcionalidades
🎯 Jogo da memória com lógica de pares
🔄 Cartas com animação de virar (flip)
📊 Contador de movimentos
🏆 Tela de resultado ao finalizar o jogo
🎨 Interface moderna com Material Design 3
🎬 Animações Implementadas
✅ Animação Implícita
Uso de AnimatedContainer para transições suaves de layout
TweenAnimationBuilder para animação de rotação das cartas
✅ Animação Explícita
AnimationController com CurvedAnimation
Efeito de pulsação no grid de cartas usando AnimatedBuilder
✅ Hero Animation
Transição animada entre a tela inicial e a tela de resultado
🧩 Widget Customizado
Foi criado um widget reutilizável:
GameCard
Representa cada carta do jogo
Recebe dados dinâmicos (emoji, estado)
Possui animação própria
🎨 Material Design 3
useMaterial3: true
ColorScheme.fromSeed() para definição de cores
Uso de componentes modernos como:
FilledButton
AppBar atualizado
Layout com padrões atuais
🧠 Lógica do Jogo
As cartas são embaralhadas
O usuário seleciona duas cartas
Se forem iguais:
Permanecem abertas
Se forem diferentes:
Voltam ao estado inicial com animação
O jogo termina ao encontrar todos os pares
📂 Estrutura do Projeto
lib/
 ├── main.dart
 ├── models/
 │    └── card_item.dart
 ├── screens/
 │    ├── home_screen.dart
 │    ├── game_screen.dart
 │    └── result_screen.dart
 ├── widgets/
 │    └── game_card.dart
⚙️ Como Executar
Instale o Flutter
Clone ou extraia o projeto
Execute os comandos:
flutter pub get
flutter run
📌 Requisitos Atendidos
✔ Animação Implícita
✔ Animação Explícita
✔ Hero Animation
✔ Material Design 3
✔ Widget Customizado
✔ Código organizado e funcional
👨‍💻 Autor
Projeto desenvolvido para fins acadêmicos na disciplina de Desenvolvimento para Dispositivos Móveis.
💡 Observações
O aplicativo foi testado em ambiente Flutter
Todas as animações foram implementadas com foco em performance e fluidez
O projeto pode ser expandido com novos níveis, sons e ranking
🔥 Projeto desenvolvido com foco em experiência do usuário e animações modernas