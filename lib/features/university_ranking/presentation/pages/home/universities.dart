import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_ranking/features/university_ranking/presentation/pages/home/university_list.dart';

import '../../../../../injection_container.dart';
import '../../bloc/university/remote_university_bloc.dart';

class Universities extends StatelessWidget {
  const Universities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Universities")),
      body: BlocProvider<RemoteUniversityBloc>(
        create:(context) => sl()..add(const GetUniversitiesFetch()),
        child: const UniversityList(),
      ),
    );
  }
}
