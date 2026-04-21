import '../models/learning_module.dart';

const List<LearningModule> mockLearningModules = <LearningModule>[
  LearningModule(
    id: 'module_guide',
    title: '1. Comprendre Docker',
    description: 'Lire le mode d emploi et cadrer ton parcours.',
    estimatedMinutes: 8,
    targetScreenIndex: 1,
    outcomes: <String>[
      'Comprendre l objectif de Docker.',
      'Connaitre la logique de navigation de l app.',
    ],
  ),
  LearningModule(
    id: 'module_core_concepts',
    title: '2. Fondamentaux',
    description: 'Images, containers, volumes, bind mounts, reseaux.',
    estimatedMinutes: 18,
    targetScreenIndex: 5,
    outcomes: <String>[
      'Comprendre les briques de base.',
      'Distinguer volume et bind mount.',
    ],
  ),
  LearningModule(
    id: 'module_runtime_config',
    title: '3. Runtime et configuration',
    description: 'Ports mapping, variables env, inspect, logs.',
    estimatedMinutes: 15,
    targetScreenIndex: 6,
    outcomes: <String>[
      'Exposer un service proprement.',
      'Configurer une app sans changer le code.',
    ],
  ),
  LearningModule(
    id: 'module_build_optimization',
    title: '4. Build optimise',
    description: 'Dockerfile, cache layers, multi-stage build.',
    estimatedMinutes: 16,
    targetScreenIndex: 5,
    outcomes: <String>[
      'Produire des images plus legeres.',
      'Ameliorer vitesse de build/deploiement.',
    ],
  ),
  LearningModule(
    id: 'module_security_resources',
    title: '5. Securite et ressources',
    description: 'User non-root, limites CPU/RAM, hygiene de base.',
    estimatedMinutes: 14,
    targetScreenIndex: 5,
    outcomes: <String>[
      'Appliquer les bases securite container.',
      'Maitriser les limites de ressources.',
    ],
  ),
  LearningModule(
    id: 'module_compose_advanced',
    title: '6. Compose avance',
    description: 'Compose up/down/logs et profiles optionnels.',
    estimatedMinutes: 14,
    targetScreenIndex: 6,
    outcomes: <String>[
      'Piloter un stack multi-services.',
      'Activer des services conditionnels avec profiles.',
    ],
  ),
  LearningModule(
    id: 'module_validation',
    title: '7. Verification',
    description: 'Quiz enrichi pour valider les acquis.',
    estimatedMinutes: 10,
    targetScreenIndex: 7,
    outcomes: <String>[
      'Mesurer ton niveau reel.',
      'Identifier les points a reviser.',
    ],
  ),
  LearningModule(
    id: 'module_practice',
    title: '8. Defis pratiques',
    description: 'Executer des scenarios progressifs en terminal.',
    estimatedMinutes: 24,
    targetScreenIndex: 8,
    outcomes: <String>[
      'Ancrer les commandes en pratique.',
      'Monter en autonomie operationnelle.',
    ],
  ),
  LearningModule(
    id: 'module_revision',
    title: '9. Revision continue',
    description: 'Glossaire + recherche globale + favoris.',
    estimatedMinutes: 8,
    targetScreenIndex: 9,
    outcomes: <String>[
      'Debloquer rapidement un terme inconnu.',
      'Consolider les notions sur la duree.',
    ],
  ),
];
