import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_ranking/features/university_ranking/presentation/bloc/university/remote_university_bloc.dart';
import 'package:university_ranking/features/university_ranking/presentation/widgets/uniersity_list_item.dart';

import '../../../domain/entities/university_entity.dart';
import '../../widgets/bottom_loader.dart';

class UniversityList extends StatefulWidget {
  const UniversityList({Key? key}) : super(key: key);

  @override
  State<UniversityList> createState() => _UniversityListState();
}

class _UniversityListState extends State<UniversityList> {

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<RemoteUniversityBloc>().add(GetUniversitiesFetch());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<RemoteUniversityBloc>().add(const GetUniversitiesFetchRefresh());
      } ,
      child: BlocBuilder<RemoteUniversityBloc, RemoteUniversityState>(
        builder: (_,state) {
          if (state is RemoteUniversityLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is RemoteUniversityError) {
            return const Center(child: Icon(Icons.refresh));
          }
          if (state is RemoteUniversityDone) {

            final universities = state.universitiesSearchedList ?? state.universities;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CupertinoSearchTextField(
                      backgroundColor: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      placeholder: "Search by country",
                      onChanged: (query) {
                        if (query.isNotEmpty) {
                          context
                              .read<RemoteUniversityBloc>()
                              .add(UniversitySearchEvent(query));
                        } else {
                          context.read<RemoteUniversityBloc>().add(GetUniversitiesFetchRefresh());
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height:10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context,index){
                        print("universities.length : ${universities.length}" );
                        return index >= universities.length &&  state.universitiesSearchedList == null
                            ? const BottomLoader()
                            : UniversityListItem(university: universities[index] ,onUniversityPressed: (university) => _onUniversityPressed(context,university),);
                      },
                      itemCount: state.hasReachedMax
                          ? universities.length
                          : universities.length + 1,
                      controller: _scrollController,
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  void _onUniversityPressed(BuildContext context, UniversityEntity university) {
    Navigator.pushNamed(context, '/UniversityDetails', arguments: university);
  }

}
