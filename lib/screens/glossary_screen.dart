import 'package:flutter/material.dart';

import '../data/mock_glossary.dart';
import '../models/glossary_term.dart';
import '../widgets/app_card.dart';

class GlossaryScreen extends StatefulWidget {
  const GlossaryScreen({super.key});

  @override
  State<GlossaryScreen> createState() => _GlossaryScreenState();
}

class _GlossaryScreenState extends State<GlossaryScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final List<GlossaryTerm> filtered = mockGlossaryTerms.where((term) {
      final q = _query.toLowerCase().trim();
      if (q.isEmpty) {
        return true;
      }
      return term.term.toLowerCase().contains(q) ||
          term.definition.toLowerCase().contains(q);
    }).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: <Widget>[
        const AppCard(
          child: Text(
            'Le glossaire est ton filet de securite: si un mot te bloque, cherche le ici puis retourne a ton ecran precedent.',
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          onChanged: (value) {
            setState(() {
              _query = value;
            });
          },
          decoration: const InputDecoration(
            hintText: 'Rechercher un terme Docker...',
            prefixIcon: Icon(Icons.search_rounded),
          ),
        ),
        const SizedBox(height: 12),
        ...filtered.map(
          (term) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: AppCard(
              padding: EdgeInsets.zero,
              child: ExpansionTile(
                title: Text(
                  term.term,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                children: <Widget>[Text(term.definition)],
              ),
            ),
          ),
        ),
        if (filtered.isEmpty)
          const AppCard(
            child: Text('Aucun terme trouve pour cette recherche.'),
          ),
      ],
    );
  }
}
