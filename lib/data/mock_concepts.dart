import '../models/docker_concept.dart';

const List<DockerConcept> mockDockerConcepts = <DockerConcept>[
  DockerConcept(
    id: 'images',
    title: 'Images',
    summary: 'Template immutable d une application.',
    description:
        'Une image Docker contient le code, les dependances et la configuration de base. Elle ne change pas une fois construite.',
    keyPoints: <String>[
      'Versionnable avec des tags (ex: latest, 1.0.0).',
      'Construite a partir d un Dockerfile.',
      'Une image peut lancer plusieurs containers.',
    ],
    beginnerAnalogy:
        'Une image est comme une recette de cuisine en lecture seule.',
    whenToUse:
        'Quand tu veux distribuer la meme base applicative partout sans ecart.',
  ),
  DockerConcept(
    id: 'containers',
    title: 'Containers',
    summary: 'Instance en execution d une image.',
    description:
        'Le container execute concretement l application a partir de l image, avec isolation des processus et reproductibilite.',
    keyPoints: <String>[
      'Demarrage rapide.',
      'Isolation par processus.',
      'Suppression/recreation facile.',
    ],
    beginnerAnalogy:
        'Le container est le plat cuisine a partir de la recette image.',
    whenToUse: 'Quand tu veux faire tourner ton service reellement.',
  ),
  DockerConcept(
    id: 'volumes',
    title: 'Volumes',
    summary: 'Persistance des donnees hors container.',
    description:
        'Un volume garde les donnees meme si le container est supprime. C est indispensable pour les bases de donnees et uploads.',
    keyPoints: <String>[
      'Decouple donnees et cycle de vie du container.',
      'Partage possible entre containers.',
      'Backup plus simple.',
    ],
    beginnerAnalogy: 'Un volume est un disque externe branche au container.',
    whenToUse: 'Des que des donnees doivent survivre aux redeploiements.',
  ),
  DockerConcept(
    id: 'bind_mounts',
    title: 'Bind Mounts',
    summary: 'Montage direct d un dossier hote dans le container.',
    description:
        'Le bind mount mappe un chemin local vers un chemin container. Tres pratique en developpement pour voir les changements en direct.',
    keyPoints: <String>[
      'Ideal en dev local.',
      'Dependant de l arborescence machine.',
      'Moins portable qu un volume.',
    ],
    beginnerAnalogy: 'Comme partager un dossier Dropbox entre deux machines.',
    whenToUse: 'Quand tu developpes et veux editer le code sans rebuild.',
  ),
  DockerConcept(
    id: 'networks',
    title: 'Networks',
    summary: 'Communication controlee entre containers.',
    description:
        'Les reseaux Docker permettent aux services de dialoguer par nom et d isoler proprement les flux internes.',
    keyPoints: <String>[
      'Bridge par defaut.',
      'Isolation entre groupes de services.',
      'Resolution DNS interne.',
    ],
    beginnerAnalogy: 'Un reseau Docker est un quartier prive pour services.',
    whenToUse: 'Quand app, db, cache doivent communiquer proprement.',
  ),
  DockerConcept(
    id: 'ports_mapping',
    title: 'Ports Mapping',
    summary: 'Expose un port container vers l exterieur.',
    description:
        'Le mapping de ports (-p hote:container) rend un service accessible depuis ton poste ou un autre systeme.',
    keyPoints: <String>[
      'Format courant: -p 8080:80.',
      'Sans mapping, service non expose.',
      'Attention aux conflits de ports.',
    ],
    beginnerAnalogy:
        'Comme brancher un adaptateur entre une prise interne et externe.',
    whenToUse: 'Quand tu dois acceder au service depuis ton navigateur.',
  ),
  DockerConcept(
    id: 'env_vars',
    title: 'Variables d environnement',
    summary: 'Configuration dynamique sans recompiler.',
    description:
        'Les variables d environnement permettent d injecter des parametres (URL DB, mode debug, port) au demarrage.',
    keyPoints: <String>[
      'Passees via -e ou fichier .env.',
      'Separent config et code.',
      'Ne pas stocker les secrets en clair.',
    ],
    beginnerAnalogy: 'Comme des interrupteurs de configuration au lancement.',
    whenToUse: 'Pour adapter l app selon dev, test, production.',
  ),
  DockerConcept(
    id: 'dockerfile',
    title: 'Dockerfile',
    summary: 'Recette de construction d image.',
    description:
        'Le Dockerfile definit les etapes de build: image de base, dependances, copie de fichiers, commande de lancement.',
    keyPoints: <String>[
      'Instructions FROM/RUN/COPY/CMD/ENTRYPOINT.',
      'Cache de build par couche.',
      'Automatisation CI/CD.',
    ],
    beginnerAnalogy: 'Fiche de fabrication de ton image logicielle.',
    whenToUse: 'Quand tu veux un build reproductible et versionne.',
  ),
  DockerConcept(
    id: 'multi_stage',
    title: 'Multi-stage Build',
    summary: 'Construire leger en separant build et runtime.',
    description:
        'Les Dockerfiles multi-stage compilent dans une etape puis copient seulement le necessaire dans une image finale plus petite.',
    keyPoints: <String>[
      'Reduit la taille d image.',
      'Diminue la surface d attaque.',
      'Accellere pulls/deploiements.',
    ],
    beginnerAnalogy:
        'Comme cuisiner en cuisine complete puis servir dans une assiette epuree.',
    whenToUse: 'Pour optimiser performance et securite en production.',
  ),
  DockerConcept(
    id: 'healthcheck',
    title: 'Healthcheck',
    summary: 'Verifier automatiquement la sante du service.',
    description:
        'Un healthcheck execute une commande periodique pour savoir si le container est vraiment operationnel.',
    keyPoints: <String>[
      'Etat healthy/unhealthy.',
      'Aide a detecter les pannes silencieuses.',
      'Utile avec Compose et orchestration.',
    ],
    beginnerAnalogy:
        'Comme prendre le pouls regulierement d un service applicatif.',
    whenToUse: 'Des que tu veux du monitoring minimal fiable.',
  ),
  DockerConcept(
    id: 'resource_limits',
    title: 'Limites CPU/RAM',
    summary: 'Controler la consommation de ressources.',
    description:
        'Docker permet de fixer des limites memoire/CPU pour eviter qu un service monopolise la machine.',
    keyPoints: <String>[
      'Exemples: --memory, --cpus.',
      'Stabilise un poste de dev ou serveur partage.',
      'Aide a reproduire un contexte prod.',
    ],
    beginnerAnalogy: 'Mettre un budget de ressources a chaque container.',
    whenToUse: 'Quand plusieurs services tournent en parallele.',
  ),
  DockerConcept(
    id: 'security_basics',
    title: 'Securite de base',
    summary: 'Bonnes pratiques minimales en conteneurisation.',
    description:
        'Executer en utilisateur non-root, limiter privileges et eviter les secrets en clair sont des fondamentaux Docker.',
    keyPoints: <String>[
      'USER non-root dans Dockerfile.',
      'Images officielles/minimales.',
      'Secrets hors image.',
    ],
    beginnerAnalogy: 'Comme fermer les portes meme dans un petit immeuble.',
    whenToUse: 'Toujours, surtout avant mise en production.',
  ),
  DockerConcept(
    id: 'compose',
    title: 'Docker Compose',
    summary: 'Orchestration locale multi-services en YAML.',
    description:
        'Compose decrit et demarre plusieurs services ensemble (app, db, cache) avec une seule commande.',
    keyPoints: <String>[
      'Centralise dans docker-compose.yml.',
      'Commandes up/down/logs/ps.',
      'Parfait pour dev et tests integration.',
    ],
    beginnerAnalogy: 'Chef d orchestre pour demarrer tout un stack.',
    whenToUse: 'Quand ton projet depasse un seul container.',
  ),
  DockerConcept(
    id: 'compose_profiles',
    title: 'Compose Profiles',
    summary: 'Activer des services optionnels selon le contexte.',
    description:
        'Les profiles Compose permettent de lancer seulement certains services (ex: observabilite en local).',
    keyPoints: <String>[
      'Active avec --profile.',
      'Evite de surcharger l environnement.',
      'Facilite les variantes dev/test/demo.',
    ],
    beginnerAnalogy: 'Comme des presets differents pour un meme projet.',
    whenToUse: 'Quand tu veux des stacks modulaires selon besoins.',
  ),
];
