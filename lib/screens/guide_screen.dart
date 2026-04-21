import 'package:flutter/material.dart';

import '../widgets/app_card.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: <Widget>[
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Mode d emploi debutant',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                'Cette application est pensee pour toi si tu ne connais rien a Docker. Tu peux suivre un parcours simple, pas a pas.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Docker en une phrase',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                'Docker sert a lancer une application de la meme maniere partout (ton PC, un serveur, le cloud) sans surprise de configuration.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Parcours recommande (45 min)',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              const _StepLine(
                index: 1,
                text:
                    'Lis Concepts Docker en premier pour comprendre le vocabulaire de base.',
              ),
              const _StepLine(
                index: 2,
                text:
                    'Passe ensuite aux Commandes Docker et ouvre chaque fiche detail.',
              ),
              const _StepLine(
                index: 3,
                text:
                    'Fais le Quiz pour verifier ce que tu as retenu et lire les explications.',
              ),
              const _StepLine(
                index: 4,
                text:
                    'Teste un ou deux Defis pratiques pour passer de la theorie a la pratique.',
              ),
              const _StepLine(
                index: 5,
                text:
                    'Utilise le Glossaire des que tu bloques sur un terme technique.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Bonnes pratiques pour debuter',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text('1. Avance doucement: 1 concept = 1 exemple concret.'),
              const SizedBox(height: 6),
              const Text(
                '2. Si une commande te parait abstraite, lis le bloc "Quand l utiliser".',
              ),
              const SizedBox(height: 6),
              const Text(
                '3. Tu n as pas besoin de tout memoriser: l objectif est de comprendre la logique globale.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StepLine extends StatelessWidget {
  const _StepLine({required this.index, required this.text});

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 22,
            height: 22,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              '$index',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
