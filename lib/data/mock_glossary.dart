import '../models/glossary_term.dart';

const List<GlossaryTerm> mockGlossaryTerms = <GlossaryTerm>[
  GlossaryTerm(
    id: 'g1',
    term: 'Image',
    definition:
        'Template immuable qui contient l\'application et ses dépendances.',
  ),
  GlossaryTerm(
    id: 'g2',
    term: 'Container',
    definition: 'Instance exécutable d\'une image Docker.',
  ),
  GlossaryTerm(
    id: 'g3',
    term: 'Registry',
    definition:
        'Service de stockage et distribution d\'images Docker (ex: Docker Hub).',
  ),
  GlossaryTerm(
    id: 'g4',
    term: 'Tag',
    definition:
        'Version textuelle appliquée à une image, comme `:latest` ou `:1.2.0`.',
  ),
  GlossaryTerm(
    id: 'g5',
    term: 'Volume',
    definition:
        'Stockage persistant géré par Docker pour conserver les données.',
  ),
  GlossaryTerm(
    id: 'g6',
    term: 'Bind Mount',
    definition: 'Montage d\'un dossier hôte dans un container.',
  ),
  GlossaryTerm(
    id: 'g7',
    term: 'Network',
    definition: 'Réseau virtuel permettant la communication entre containers.',
  ),
  GlossaryTerm(
    id: 'g8',
    term: 'Dockerfile',
    definition: 'Fichier décrivant les étapes de création d\'une image Docker.',
  ),
  GlossaryTerm(
    id: 'g9',
    term: 'Compose',
    definition:
        'Outil Docker pour orchestrer des applications multi-services en YAML.',
  ),
  GlossaryTerm(
    id: 'g10',
    term: 'Layer',
    definition:
        'Couche de build utilisée pour optimiser cache et distribution des images.',
  ),
];
