import 'package:flutter/material.dart';
import '../models/mood_type.dart';

class MoodPicker extends StatelessWidget {
  final MoodType? selected;
  final ValueChanged<MoodType> onChanged;
  static const List<MoodType> moods = MoodType.values;

  const MoodPicker({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: moods.map((m) {
        final isActive = selected == m;
        return ChoiceChip(
          label: Text(m.name),
          selected: isActive,
          onSelected: (_) => onChanged(m),
        );
      }).toList(),
    );
  }
}
