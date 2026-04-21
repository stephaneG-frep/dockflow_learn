import '../models/practice_challenge.dart';

const List<PracticeChallenge> mockPracticeChallenges = <PracticeChallenge>[
  PracticeChallenge(
    id: 'challenge_1',
    title: 'Lancer un Nginx local',
    goal: 'Démarrer un serveur Nginx dans un container accessible en local.',
    difficulty: 'Facile',
    steps: <String>[
      'Télécharger l\'image Nginx.',
      'Lancer un container avec mapping de port 8080:80.',
      'Vérifier dans le navigateur.',
    ],
  ),
  PracticeChallenge(
    id: 'challenge_2',
    title: 'Créer une image custom',
    goal: 'Écrire un Dockerfile simple et builder une image personnalisée.',
    difficulty: 'Moyen',
    steps: <String>[
      'Créer un Dockerfile basé sur `python:3.12-slim`.',
      'Copier un script applicatif.',
      'Build et exécuter l\'image localement.',
    ],
  ),
  PracticeChallenge(
    id: 'challenge_3',
    title: 'Persister des données',
    goal: 'Monter un volume Docker pour garder des données entre redémarrages.',
    difficulty: 'Moyen',
    steps: <String>[
      'Créer un volume nommé.',
      'Monter ce volume dans un container.',
      'Redémarrer et vérifier la persistance.',
    ],
  ),
  PracticeChallenge(
    id: 'challenge_4',
    title: 'Connecter deux services',
    goal: 'Faire communiquer deux containers sur un réseau dédié.',
    difficulty: 'Avancé',
    steps: <String>[
      'Créer un réseau bridge personnalisé.',
      'Lancer les containers sur ce réseau.',
      'Tester la communication via nom de service.',
    ],
  ),
];
