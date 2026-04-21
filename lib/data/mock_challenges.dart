import '../models/practice_challenge.dart';

const List<PracticeChallenge> mockPracticeChallenges = <PracticeChallenge>[
  PracticeChallenge(
    id: 'challenge_1',
    title: 'Lancer un Nginx local',
    goal: 'Demarrer un serveur Nginx accessible en local.',
    difficulty: 'Facile',
    steps: <String>[
      'docker pull nginx',
      'docker run -d -p 8080:80 --name web nginx',
      'Verifier http://localhost:8080 puis docker ps',
    ],
  ),
  PracticeChallenge(
    id: 'challenge_2',
    title: 'Configurer des variables d environnement',
    goal: 'Passer une configuration runtime via -e.',
    difficulty: 'Facile',
    steps: <String>[
      'Lancer un container avec -e APP_MODE=dev',
      'Entrer dans le container avec docker exec -it',
      'Verifier que la variable est visible avec env',
    ],
  ),
  PracticeChallenge(
    id: 'challenge_3',
    title: 'Creer une image custom',
    goal: 'Ecrire un Dockerfile simple et builder une image.',
    difficulty: 'Moyen',
    steps: <String>[
      'Creer un Dockerfile base sur python:3.12-slim',
      'Copier un script applicatif',
      'docker build puis docker run',
    ],
  ),
  PracticeChallenge(
    id: 'challenge_4',
    title: 'Tester bind mount vs volume',
    goal: 'Comparer persistance et usage des deux approches.',
    difficulty: 'Moyen',
    steps: <String>[
      'Monter un dossier local avec -v ./data:/app/data',
      'Creer un volume nomme et le monter sur /var/lib/app',
      'Supprimer/recreer container et comparer les resultats',
    ],
  ),
  PracticeChallenge(
    id: 'challenge_5',
    title: 'Connecter app et base de donnees',
    goal: 'Faire dialoguer deux containers sur reseau dedie.',
    difficulty: 'Moyen',
    steps: <String>[
      'docker network create app_net',
      'Lancer db puis app sur app_net',
      'Verifier la resolution DNS interne par nom de service',
    ],
  ),
  PracticeChallenge(
    id: 'challenge_6',
    title: 'Ajouter un healthcheck',
    goal: 'Superviser la sante d un service containerise.',
    difficulty: 'Moyen',
    steps: <String>[
      'Ajouter HEALTHCHECK dans Dockerfile ou Compose',
      'Relancer le service',
      'Verifier l etat avec docker ps ou docker inspect',
    ],
  ),
  PracticeChallenge(
    id: 'challenge_7',
    title: 'Analyser la consommation',
    goal: 'Observer CPU/RAM et appliquer une limite.',
    difficulty: 'Avance',
    steps: <String>[
      'Lancer un service puis docker stats',
      'Relancer avec --memory et --cpus',
      'Comparer les metriques avant/apres',
    ],
  ),
  PracticeChallenge(
    id: 'challenge_8',
    title: 'Compose avec profil optionnel',
    goal: 'Activer un service supplementaire via profile.',
    difficulty: 'Avance',
    steps: <String>[
      'Ajouter un profile a un service dans compose',
      'Lancer sans profile puis avec --profile',
      'Comparer docker compose ps et les logs',
    ],
  ),
];
