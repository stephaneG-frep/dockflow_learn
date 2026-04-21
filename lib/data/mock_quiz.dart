import '../models/quiz_question.dart';

const List<QuizQuestion> mockQuizQuestions = <QuizQuestion>[
  QuizQuestion(
    id: 'q1',
    question: 'Quel fichier decrit la construction d une image Docker ?',
    options: <String>[
      'docker-compose.yml',
      'Dockerfile',
      '.dockerignore',
      'container.json',
    ],
    correctIndex: 1,
    explanation: 'Dockerfile decrit les etapes de build d une image.',
  ),
  QuizQuestion(
    id: 'q2',
    question: 'Quelle commande liste les containers actifs ?',
    options: <String>[
      'docker images',
      'docker start',
      'docker ps',
      'docker inspect',
    ],
    correctIndex: 2,
    explanation: 'docker ps affiche les containers en execution.',
  ),
  QuizQuestion(
    id: 'q3',
    question: 'Quel mecanisme persiste les donnees apres suppression ?',
    options: <String>['Networks', 'Tags', 'Volumes', 'Layers'],
    correctIndex: 2,
    explanation: 'Les volumes gardent les donnees hors cycle container.',
  ),
  QuizQuestion(
    id: 'q4',
    question: 'A quoi sert principalement Docker Compose ?',
    options: <String>[
      'Creer des users Linux',
      'Orchestrer plusieurs services',
      'Compiler le noyau',
      'Remplacer Kubernetes',
    ],
    correctIndex: 1,
    explanation: 'Compose lance un stack multi-services via YAML.',
  ),
  QuizQuestion(
    id: 'q5',
    question: 'Quelle commande affiche les logs d un container ?',
    options: <String>[
      'docker log',
      'docker logs',
      'docker ps -l',
      'docker attach --logs',
    ],
    correctIndex: 1,
    explanation: 'docker logs lit la sortie standard/erreur du container.',
  ),
  QuizQuestion(
    id: 'q6',
    question: 'Que fait le mapping -p 8080:80 ?',
    options: <String>[
      'Expose le port 80 hote vers 8080 container',
      'Expose le port 8080 hote vers 80 container',
      'Cree deux ports internes',
      'Change le nom du container',
    ],
    correctIndex: 1,
    explanation:
        'Format hote:container, donc 8080 hote pointe vers 80 interne.',
  ),
  QuizQuestion(
    id: 'q7',
    question: 'Quelle option passe une variable d environnement ?',
    options: <String>['-v', '-e', '-p', '--cpus'],
    correctIndex: 1,
    explanation: '-e definit une variable au demarrage du container.',
  ),
  QuizQuestion(
    id: 'q8',
    question: 'Quel est l interet principal d un build multi-stage ?',
    options: <String>[
      'Avoir plus de processus dans le container',
      'Reduire la taille de l image finale',
      'Eviter le Dockerfile',
      'Remplacer docker compose',
    ],
    correctIndex: 1,
    explanation: 'Multi-stage separe build/runtime pour image plus legere.',
  ),
  QuizQuestion(
    id: 'q9',
    question: 'A quoi sert un healthcheck ?',
    options: <String>[
      'Changer le tag d une image',
      'Verifier periodiquement la sante du service',
      'Sauvegarder un volume',
      'Supprimer un container',
    ],
    correctIndex: 1,
    explanation: 'Le healthcheck detecte si le service est healthy/unhealthy.',
  ),
  QuizQuestion(
    id: 'q10',
    question: 'Quelle commande donne des details JSON complets ?',
    options: <String>[
      'docker exec',
      'docker inspect',
      'docker logs',
      'docker stop',
    ],
    correctIndex: 1,
    explanation: 'docker inspect renvoie la configuration detaillee.',
  ),
  QuizQuestion(
    id: 'q11',
    question: 'Quelle commande montre CPU/RAM en temps reel ?',
    options: <String>[
      'docker top',
      'docker stats',
      'docker info',
      'docker config',
    ],
    correctIndex: 1,
    explanation: 'docker stats affiche les metriques runtime par container.',
  ),
  QuizQuestion(
    id: 'q12',
    question: 'Pourquoi utiliser un utilisateur non-root en container ?',
    options: <String>[
      'Pour accelerer docker pull',
      'Pour securiser l execution',
      'Pour eviter les volumes',
      'Pour desactiver les logs',
    ],
    correctIndex: 1,
    explanation: 'Limiter les privileges reduit les risques de securite.',
  ),
];
