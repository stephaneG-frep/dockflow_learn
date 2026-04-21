import 'package:flutter/material.dart';

class QuizOptionTile extends StatelessWidget {
  const QuizOptionTile({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color borderColor = isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.outlineVariant;

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor, width: isSelected ? 1.6 : 1),
        ),
        child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
