import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/navigation/nav.dart';
import 'package:starter_application/core/ui/error_ui/error_viewer/error_viewer.dart';
import 'package:starter_application/core/ui/show_toast.dart';
import 'package:starter_application/core/ui/widgets/custom_appbar.dart';
import 'package:starter_application/features/persons/presentation/state_m/cubit/persons_cubit.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../state_m/provider/add_person_screen_notifier.dart';
import 'add_person_screen_content.dart';

class AddPersonScreenParam {
  final void Function() refreshPersonList;

  const AddPersonScreenParam(this.refreshPersonList);
}

class AddPersonScreen extends BaseScreen<AddPersonScreenParam> {
  static const String routeName = "/AddPersonScreen";

  const AddPersonScreen({
    Key? key,
    required AddPersonScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _AddPersonScreenState createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  late final AddPersonScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = AddPersonScreenNotifier(widget.param);
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddPersonScreenNotifier>.value(
      value: sn,
      builder: (context, _) {
        context.select<AddPersonScreenNotifier, bool>((p) => p.isLoading);
        return ModalProgressHUD(
          inAsyncCall: sn.isLoading,
          child: Scaffold(
            appBar: CustomAppBar(
              title: 'Add Person',
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: BlocListener<PersonsCubit, PersonsState>(
              bloc: sn.addPersonCubit,
              listener: (context, state) {
                state.whenOrNull(
                  personsLoading: () => sn.isLoading = true,
                  personsError: (error, callback) {
                    sn.isLoading = false;
                    ErrorViewer.showError(
                      context: context,
                      error: error,
                      callback: callback,
                    );
                  },
                  successAddPerson: () {
                    sn.isLoading = false;
                    Nav.pop();
                    showToast('Person Added Successfully');
                    widget.param.refreshPersonList.call();
                  },
                );
              },
              child: const AddPersonScreenContent(),
            ),
          ),
        );
      },
    );
  }
}
