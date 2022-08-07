import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_colors.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/navigation/nav.dart';
import 'package:starter_application/core/ui/error_ui/errors_screens/error_widget.dart';
import 'package:starter_application/core/ui/widgets/custom_button.dart';
import 'package:starter_application/core/ui/widgets/custom_image.dart';
import 'package:starter_application/core/ui/widgets/custom_list_tile.dart';
import 'package:starter_application/core/ui/widgets/waiting_widget.dart';
import 'package:starter_application/features/persons/presentation/screen/add_person/add_person_screen.dart';
import 'package:starter_application/features/persons/presentation/screen/person_details/person_details_screen_content.dart';
import 'package:starter_application/features/persons/presentation/state_m/cubit/persons_cubit.dart';
import '../../state_m/provider/persons_list_screen_notifier.dart';
import '../person_details/person_details_screen.dart';

class PersonsListScreenContent extends StatefulWidget {
  const PersonsListScreenContent({Key? key}) : super(key: key);
  @override
  State<PersonsListScreenContent> createState() =>
      _PersonsListScreenContentState();
}

class _PersonsListScreenContentState extends State<PersonsListScreenContent> {
  late PersonsListScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    sn = context.read<PersonsListScreenNotifier>();
    sn.context = context;
    return Container(
      height: 1.sh,
      width: 1.sw,
      child: BlocBuilder<PersonsCubit, PersonsState>(
        bloc: sn.personsCubit,
        builder: (context, state) {
          return state.maybeMap(
            personsInit: (_) => const WaitingWidget(),
            personsLoading: (_) => const WaitingWidget(),
            personsError: (s) => ErrorScreenWidget(
              error: s.error,
              callback: s.callback,
            ),
            personsListLoaded: (s) {
              final persons = s.personsEntity.persons;
              return ListView.separated(
                padding: EdgeInsets.only(
                  left: AppConstants.screenPadding.left,
                  right: AppConstants.screenPadding.right,
                  top: 20,
                  bottom: 50,
                ),
                itemBuilder: (context, index) {
                  if (index == persons.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Column(
                        children: [
                          CustomButton(
                            fixedSize: Size(150.w, 150.w),
                            title: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 80.sp,
                            ),
                            backgroundColor: AppColors.primaryColor,
                            borderRadius: const Radius.circular(100),
                            onPressed: () {
                              Nav.to(
                                AddPersonScreen.routeName,
                                arguments: AddPersonScreenParam(
                                  sn.loadPersons,
                                ),
                              );
                            },
                          ),
                          20.verticalSpace,
                          const Text('Add a Person'),
                        ],
                      ),
                    );
                  }
                  return CustomListTile(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    height: 100,
                    trailingFlex: 1,
                    leadingFlex: 3,
                    leading: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.grey500,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CustomImage.network(
                          persons[index].imageLink,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      persons[index].name,
                      style: TextStyle(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                    onTap: () {
                      Nav.to(
                        PersonDetailsScreen.routeName,
                        arguments: PersonDetailsScreenParam(
                          persons[index],
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (_, __) => const Divider(
                  color: AppColors.grey500,
                  thickness: 2,
                  height: 0,
                ),
                itemCount: persons.length + 1,
              );
            },
            orElse: () => const ScreenNotImplementedErrorWidget(),
          );
        },
      ),
    );
  }

  // final _names = [
  //   "Elias Mikhael",
  //   "Yassar Hammami",
  //   "Carol Hakimeh",
  //   "Naser Muzayen",
  // ];

  // final _images = [
  //   AppConstants.IMAGE_PERSON_1,
  //   AppConstants.IMAGE_PERSON_2,
  //   AppConstants.IMAGE_PERSON_4,
  //   AppConstants.IMAGE_PERSON_3,
  // ];
}
