import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_application/core/ui/error_ui/errors_screens/error_widget.dart';
import 'package:starter_application/core/ui/screens/base_screen.dart';
import 'package:starter_application/core/ui/widgets/waiting_widget.dart';
import 'package:starter_application/features/home/presentation/screen/people_screen_content.dart';
import 'package:starter_application/features/home/presentation/state_m/cubit/home_cubit.dart';

class PeopleScreenParam {}

class PeopleScreen extends BaseScreen<PeopleScreenParam> {
  static const String routeName = "PeopleScreen/";

  const PeopleScreen({Key? key, required PeopleScreenParam param})
      : super(key: key, param: param);

  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  final _homeCubit = HomeCubit();

  @override
  void initState() {
    _homeCubit.getPeople();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("People"),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _homeCubit,
        builder: (context, state) {
          return state.map(
            homeInitState: buildHomeInitState,
            homeLoadingState: buildHomeLoadingState,
            homeLoadedState: buildHomeLoadedState,
            homeErrorState: buildHomeErrorState,
            peopleListLoadedState: buildPeopleListLoadedState,
            commentsLoadedState: (_) => const ScreenNotImplementedErrorWidget(),
          );
        },
      ),
    );
  }

  Widget buildHomeInitState(HomeInitState state) {
    return const WaitingWidget();
  }

  Widget buildHomeLoadedState(HomeLoadedState state) {
    return const ScreenNotImplementedErrorWidget();
  }

  Widget buildHomeLoadingState(HomeLoadingState state) {
    return const WaitingWidget();
  }

  Widget buildHomeErrorState(HomeErrorInitState state) {
    return ErrorScreenWidget(error: state.error, callback: state.callback);
  }

  Widget buildPeopleListLoadedState(PeopleListLoadedState state) {
    return PeopleScreenContent(
      people: state.data.people,
    );
  }
}
