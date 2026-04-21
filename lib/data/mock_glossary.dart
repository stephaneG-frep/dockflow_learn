import '../models/glossary_term.dart';

const List<GlossaryTerm> mockGlossaryTerms = <GlossaryTerm>[
  GlossaryTerm(
    id: 'g1',
    term: 'Image',
    definition: 'Template immutable avec application et dependances.',
  ),
  GlossaryTerm(
    id: 'g2',
    term: 'Container',
    definition: 'Instance executable d une image Docker.',
  ),
  GlossaryTerm(
    id: 'g3',
    term: 'Registry',
    definition: 'Service de stockage/distribution d images (Docker Hub).',
  ),
  GlossaryTerm(
    id: 'g4',
    term: 'Tag',
    definition: 'Version textuelle d image (ex: latest, 1.2.0).',
  ),
  GlossaryTerm(
    id: 'g5',
    term: 'Volume',
    definition: 'Stockage persistant gere par Docker.',
  ),
  GlossaryTerm(
    id: 'g6',
    term: 'Bind Mount',
    definition: 'Montage direct d un dossier hote dans un container.',
  ),
  GlossaryTerm(
    id: 'g7',
    term: 'Network',
    definition: 'Reseau virtuel pour communication entre containers.',
  ),
  GlossaryTerm(
    id: 'g8',
    term: 'Dockerfile',
    definition: 'Fichier de build qui decrit comment creer une image.',
  ),
  GlossaryTerm(
    id: 'g9',
    term: 'Compose',
    definition: 'Outil YAML pour lancer plusieurs services ensemble.',
  ),
  GlossaryTerm(
    id: 'g10',
    term: 'Layer',
    definition: 'Couche de build reutilisable/cachable dans une image.',
  ),
  GlossaryTerm(
    id: 'g11',
    term: 'Port Mapping',
    definition: 'Exposition d un port container vers l hote (ex: -p 8080:80).',
  ),
  GlossaryTerm(
    id: 'g12',
    term: 'Environment Variable',
    definition: 'Parametre de configuration injecte au runtime via -e ou .env.',
  ),
  GlossaryTerm(
    id: 'g13',
    term: 'Healthcheck',
    definition: 'Verification automatique periodique de l etat d un service.',
  ),
  GlossaryTerm(
    id: 'g14',
    term: 'Multi-stage Build',
    definition: 'Technique Dockerfile pour separer build et runtime final.',
  ),
  GlossaryTerm(
    id: 'g15',
    term: 'Non-root User',
    definition: 'Execution en utilisateur non admin pour securite accrue.',
  ),
  GlossaryTerm(
    id: 'g16',
    term: 'Resource Limits',
    definition:
        'Limites CPU/RAM appliquees au container (ex: --cpus, --memory).',
  ),
  GlossaryTerm(
    id: 'g17',
    term: 'Compose Profile',
    definition: 'Activation conditionnelle de services Compose via --profile.',
  ),
  GlossaryTerm(
    id: 'g18',
    term: 'Inspect',
    definition: 'Commande docker inspect pour details techniques JSON.',
  ),
  GlossaryTerm(
    id: 'g19',
    term: 'Stats',
    definition: 'Commande docker stats pour metriques CPU/RAM/IO live.',
  ),
  GlossaryTerm(
    id: 'g20',
    term: 'Entrypoint',
    definition: 'Commande principale executee au demarrage du container.',
  ),
];
