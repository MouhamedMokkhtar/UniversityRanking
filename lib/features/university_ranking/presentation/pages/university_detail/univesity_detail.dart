import 'package:flutter/material.dart';
import 'package:university_ranking/features/university_ranking/domain/entities/university_entity.dart';

class UniversityDetail extends StatelessWidget {
  const UniversityDetail({Key? key , this.university}) : super(key: key);

  final UniversityEntity ? university;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('University Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('University Name :'),
                SizedBox(width: 16,),
                Text('${university!.universityName}'),
              ],
            ),
            Divider(thickness: 1,),
            Row(
              children: [
                Text('University Coutry :'),
                SizedBox(width: 16,),
                Text('${university!.country}'),
              ],
            ),
            Divider(thickness: 1,),
            Row(
              children: [
                Text('University rank :'),
                SizedBox(width: 16,),
                Text('${university!.worldRankInt}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
