import '../models/docker_command.dart';

const List<DockerCommand> mockDockerCommands = <DockerCommand>[
  DockerCommand(
    id: 'docker_ps',
    command: 'docker ps',
    description: 'Liste les containers actifs.',
    usage: 'docker ps [OPTIONS]',
    example: 'docker ps -a',
    category: 'Inspection',
    whenToUse:
        'Quand tu veux verifier rapidement quels containers tournent ou sont arretes.',
    expectedResult:
        'Tu dois voir une table avec ID, image, statut, ports et nom du container.',
  ),
  DockerCommand(
    id: 'docker_images',
    command: 'docker images',
    description: 'Affiche les images locales disponibles.',
    usage: 'docker images [OPTIONS] [REPOSITORY[:TAG]]',
    example: 'docker images nginx',
    category: 'Inspection',
    whenToUse:
        'Quand tu veux savoir quelles images sont deja telechargees sur ta machine.',
    expectedResult:
        'Tu vois la liste des images avec repository, tag, ID et taille.',
  ),
  DockerCommand(
    id: 'docker_build',
    command: 'docker build',
    description: 'Construit une image à partir d\'un Dockerfile.',
    usage: 'docker build -t nom_image:tag chemin',
    example: 'docker build -t dockflow/api:1.0 .',
    category: 'Build',
    whenToUse:
        'Quand tu viens de modifier ton code ou ton Dockerfile et que tu veux une nouvelle image.',
    expectedResult:
        'Docker execute les etapes du Dockerfile puis annonce Successfully tagged.',
  ),
  DockerCommand(
    id: 'docker_run',
    command: 'docker run',
    description: 'Crée et démarre un container depuis une image.',
    usage: 'docker run [OPTIONS] IMAGE [COMMAND] [ARG...]',
    example: 'docker run -d -p 8080:80 nginx',
    category: 'Exécution',
    whenToUse:
        'Quand tu veux demarrer concretement une application contenue dans une image.',
    expectedResult:
        'Tu obtiens un identifiant de container puis le service devient accessible.',
  ),
  DockerCommand(
    id: 'docker_logs',
    command: 'docker logs',
    description: 'Affiche les logs d\'un container.',
    usage: 'docker logs [OPTIONS] CONTAINER',
    example: 'docker logs -f api_container',
    category: 'Debug',
    whenToUse: 'Quand ton application semble bloquee ou renvoie une erreur.',
    expectedResult:
        'Tu vois les messages de demarrage, erreurs, warnings et traces applicatives.',
  ),
  DockerCommand(
    id: 'docker_exec',
    command: 'docker exec',
    description: 'Exécute une commande dans un container actif.',
    usage: 'docker exec [OPTIONS] CONTAINER COMMAND [ARG...]',
    example: 'docker exec -it api_container sh',
    category: 'Debug',
    whenToUse:
        'Quand tu veux inspecter l interieur du container (fichiers, process, commandes).',
    expectedResult:
        'Un shell s ouvre dans le container ou la commande demandee est executee.',
  ),
  DockerCommand(
    id: 'docker_compose_up',
    command: 'docker compose up',
    description: 'Démarre les services définis dans Compose.',
    usage: 'docker compose up [OPTIONS] [SERVICE...]',
    example: 'docker compose up -d',
    category: 'Compose',
    whenToUse:
        'Quand tu veux lancer tout ton environnement local en une seule commande.',
    expectedResult:
        'Tous les services declares dans docker-compose.yml se lancent.',
  ),
  DockerCommand(
    id: 'docker_compose_down',
    command: 'docker compose down',
    description: 'Arrête et supprime les services Compose.',
    usage: 'docker compose down [OPTIONS]',
    example: 'docker compose down --volumes',
    category: 'Compose',
    whenToUse:
        'Quand tu veux arreter proprement tous les services d un projet Compose.',
    expectedResult: 'Les containers et reseaux du projet sont supprimes.',
  ),
];
