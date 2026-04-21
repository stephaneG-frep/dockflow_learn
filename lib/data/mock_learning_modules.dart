import '../models/learning_module.dart';

const List<LearningModule> mockLearningModules = <LearningModule>[
  LearningModule(
    id: 'module_guide',
    title: '1. Comprendre Docker',
    description: 'Lire le mode d emploi pour visualiser l objectif global.',
    estimatedMinutes: 8,
    targetScreenIndex: 1,
    outcomes: <String>[
      'Comprendre a quoi sert Docker.',
      'Connaitre le parcours de l application.',
    ],
  ),
  LearningModule(
    id: 'module_concepts',
    title: '2. Concepts essentiels',
    description: 'Images, containers, volumes, networks, Dockerfile, Compose.',
    estimatedMinutes: 15,
    targetScreenIndex: 3,
    outcomes: <String>[
      'Savoir nommer les briques principales.',
      'Savoir quand utiliser chaque concept.',
    ],
  ),
  LearningModule(
    id: 'module_commands',
    title: '3. Commandes de base',
    description: 'Revoir les commandes incontournables du quotidien.',
    estimatedMinutes: 12,
    targetScreenIndex: 4,
    outcomes: <String>[
      'Lister, lancer, inspecter et depanner un container.',
      'Identifier les commandes Compose utiles.',
    ],
  ),
  LearningModule(
    id: 'module_quiz',
    title: '4. Verification rapide',
    description: 'Passer le quiz pour valider les acquis.',
    estimatedMinutes: 6,
    targetScreenIndex: 5,
    outcomes: <String>[
      'Mesurer son niveau actuel.',
      'Revoir les explications en cas d erreur.',
    ],
  ),
  LearningModule(
    id: 'module_challenges',
    title: '5. Pratique terminal',
    description: 'Executer des mini defis pour ancrer les reflexes.',
    estimatedMinutes: 20,
    targetScreenIndex: 6,
    outcomes: <String>[
      'Passer de la theorie a la pratique.',
      'Gagner en autonomie sur le terminal.',
    ],
  ),
  LearningModule(
    id: 'module_glossary',
    title: '6. Revision continue',
    description: 'Utiliser le glossaire comme support anti-blocage.',
    estimatedMinutes: 5,
    targetScreenIndex: 7,
    outcomes: <String>[
      'Retrouver rapidement les definitions.',
      'Renforcer le vocabulaire technique.',
    ],
  ),
];
