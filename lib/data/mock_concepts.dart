import '../models/docker_concept.dart';

const List<DockerConcept> mockDockerConcepts = <DockerConcept>[
  DockerConcept(
    id: 'images',
    title: 'Images',
    summary: 'Le blueprint d\'une application et de son environnement.',
    description:
        'Une image Docker est une base immuable qui contient tout ce qu\'il faut pour lancer une application: code, dépendances et configuration.',
    keyPoints: <String>[
      'Versionnable avec des tags (ex: :latest, :1.0.0).',
      'Se construit depuis un Dockerfile.',
      'Une image peut servir à créer plusieurs containers.',
    ],
    beginnerAnalogy:
        'Pense a une image comme une recette de cuisine complete que tu peux reutiliser.',
    whenToUse:
        'Tu utilises une image quand tu veux distribuer ton application de facon stable et identique partout.',
  ),
  DockerConcept(
    id: 'containers',
    title: 'Containers',
    summary: 'Instance en cours d\'exécution d\'une image Docker.',
    description:
        'Un container isole une application et s\'exécute de manière reproductible sur n\'importe quelle machine compatible Docker.',
    keyPoints: <String>[
      'Démarrage rapide et léger.',
      'Isolation des processus.',
      'Peut être arrêté, supprimé, relancé facilement.',
    ],
    beginnerAnalogy:
        'Le container est le plat cuisine a partir de la recette (image).',
    whenToUse:
        'Tu lances un container quand tu veux faire tourner concretement ton application.',
  ),
  DockerConcept(
    id: 'volumes',
    title: 'Volumes',
    summary: 'Mécanisme de persistance des données hors container.',
    description:
        'Les volumes Docker permettent de conserver les données même si le container est supprimé, ce qui est essentiel pour les bases de données et fichiers utilisateurs.',
    keyPoints: <String>[
      'Découplent données et cycle de vie du container.',
      'Partage possible entre plusieurs containers.',
      'Pratique pour backup et migration.',
    ],
    beginnerAnalogy:
        'Le volume est un disque dur externe branche a ton container.',
    whenToUse:
        'Utilise un volume des que tu as des donnees a conserver (db, uploads, fichiers).',
  ),
  DockerConcept(
    id: 'networks',
    title: 'Networks',
    summary: 'Communication contrôlée entre containers.',
    description:
        'Les réseaux Docker permettent de connecter des services entre eux (API, base de données, cache) tout en contrôlant l\'exposition vers l\'extérieur.',
    keyPoints: <String>[
      'Bridge par défaut en local.',
      'Isolation de groupes de services.',
      'DNS interne entre containers sur le même réseau.',
    ],
    beginnerAnalogy:
        'Le reseau est un mini quartier prive ou les services se parlent.',
    whenToUse:
        'Tu crées un reseau quand plusieurs containers doivent communiquer entre eux.',
  ),
  DockerConcept(
    id: 'dockerfile',
    title: 'Dockerfile',
    summary: 'Recette textuelle pour construire une image.',
    description:
        'Le Dockerfile décrit étape par étape comment assembler l\'image: image de base, installation, copie de fichiers, commande de lancement.',
    keyPoints: <String>[
      'Utilise des instructions (FROM, RUN, COPY, CMD...).',
      'Facilite l\'automatisation CI/CD.',
      'Permet un build reproductible.',
    ],
    beginnerAnalogy:
        'Le Dockerfile est la fiche technique de fabrication de ton image.',
    whenToUse:
        'Tu ecris un Dockerfile pour construire une image personnalisee de ton application.',
  ),
  DockerConcept(
    id: 'compose',
    title: 'Docker Compose',
    summary: 'Orchestration locale multi-services avec un fichier YAML.',
    description:
        'Docker Compose permet de définir et démarrer plusieurs services ensemble (app, db, redis...) avec une seule commande.',
    keyPoints: <String>[
      'Configuration centralisée dans docker-compose.yml.',
      'Lancement avec docker compose up.',
      'Idéal pour environnements de dev.',
    ],
    beginnerAnalogy:
        'Compose est un chef d orchestre qui demarre plusieurs instruments ensemble.',
    whenToUse:
        'Utilise Compose quand ton projet a plusieurs services (app + db + cache).',
  ),
];
