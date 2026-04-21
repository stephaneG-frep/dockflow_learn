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
                'Mode d emploi complet',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                'Objectif: te guider de debutant total a autonome Docker, sans verrouiller les ecrans.',
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
                'Nouveaux concepts ajoutes',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                'En plus des bases (images, containers, volumes, compose), tu trouveras maintenant:',
              ),
              const SizedBox(height: 6),
              const Text('- Ports mapping (-p hote:container)'),
              const Text('- Variables d environnement (-e, .env)'),
              const Text('- Bind mounts vs volumes'),
              const Text('- Multi-stage build'),
              const Text('- Healthcheck'),
              const Text('- Limites CPU/RAM'),
              const Text('- Securite de base (user non-root)'),
              const Text('- Compose profiles'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Comment naviguer',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ouvre le Drawer (menu en haut a gauche). Tout est accessible librement.',
              ),
              const SizedBox(height: 8),
              const Text('Sections utiles:'),
              const SizedBox(height: 6),
              const Text('1. Objectif quotidien: suivre ton avancee du jour.'),
              const Text('2. Parcours recommande: checklist non bloquante.'),
              const Text('3. Favoris: garder tes cartes importantes.'),
              const Text('4. Recherche globale: retrouver vite un terme.'),
              const Text('5. Statistiques: progression + badges.'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Parcours conseille (version enrichie)',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              const _StepLine(
                index: 1,
                text:
                    'Regle ton objectif quotidien (3 actions/jour pour commencer).',
              ),
              const _StepLine(
                index: 2,
                text:
                    'Lis les concepts de base puis les nouveaux concepts avances.',
              ),
              const _StepLine(
                index: 3,
                text:
                    'Passe aux commandes de base puis debug/inspection (inspect, stats, logs).',
              ),
              const _StepLine(
                index: 4,
                text: 'Fais le quiz enrichi pour valider les nouveaux themes.',
              ),
              const _StepLine(
                index: 5,
                text:
                    'Enchaine les defis pratiques (env, ports, reseau, healthcheck, profiles).',
              ),
              const _StepLine(
                index: 6,
                text:
                    'Utilise glossaire/recherche/favoris pour consolider les acquis.',
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
                'Important',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                'Aucun ecran n est verrouille. Tu peux ouvrir directement n importe quelle section. Le parcours reste un guide, pas une contrainte.',
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
