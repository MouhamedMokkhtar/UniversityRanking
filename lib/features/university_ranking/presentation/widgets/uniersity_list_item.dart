import 'package:flutter/material.dart';
import 'package:university_ranking/features/university_ranking/domain/entities/university_entity.dart';

class UniversityListItem extends StatelessWidget {
  const UniversityListItem({Key? key, this.university ,  this.onUniversityPressed,}) : super(key: key);

  final UniversityEntity ? university;
  final void Function(UniversityEntity university) ? onUniversityPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: ListTile(
        isThreeLine: true,
        dense: true,
        title: Text(university!.universityName ?? '' ),
        subtitle: Text(university!.country ?? ''),
        leading: Text(university!.worldRankInt.toString()),
      ),
    );
  }

  void _onTap() {
    if (onUniversityPressed != null) {
      onUniversityPressed!(university!);
    }
  }

}
