import '../models/quiz_question.dart';

const List<QuizQuestion> mockQuizQuestions = <QuizQuestion>[
  QuizQuestion(
    id: 'q1',
    question:
        'Quel fichier sert à décrire la construction d\'une image Docker ?',
    options: <String>[
      'docker-compose.yml',
      'Dockerfile',
      '.dockerignore',
      'container.json',
    ],
    correctIndex: 1,
    explanation: 'Le Dockerfile est la recette de build d\'une image.',
  ),
  QuizQuestion(
    id: 'q2',
    question: 'Quelle commande affiche les containers en cours ?',
    options: <String>[
      'docker images',
      'docker start',
      'docker ps',
      'docker inspect',
    ],
    correctIndex: 2,
    explanation: '`docker ps` liste les containers actifs.',
  ),
  QuizQuestion(
    id: 'q3',
    question:
        'Quel mécanisme permet de conserver des données après suppression d\'un container ?',
    options: <String>['Networks', 'Tags', 'Volumes', 'Layers'],
    correctIndex: 2,
    explanation:
        'Les volumes persistent les données hors du cycle de vie du container.',
  ),
  QuizQuestion(
    id: 'q4',
    question: 'Docker Compose sert principalement à...',
    options: <String>[
      'Créer des utilisateurs Linux',
      'Orchestrer plusieurs services',
      'Compiler le noyau Linux',
      'Remplacer Kubernetes en production',
    ],
    correctIndex: 1,
    explanation:
        'Compose est idéal pour orchestrer plusieurs services en local.',
  ),
  QuizQuestion(
    id: 'q5',
    question: 'Quelle commande permet de voir les logs d\'un container ?',
    options: <String>[
      'docker log',
      'docker logs',
      'docker ps -l',
      'docker attach --logs',
    ],
    correctIndex: 1,
    explanation:
        '`docker logs` affiche les sorties standard et erreurs du container.',
  ),
];
