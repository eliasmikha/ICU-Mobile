import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/ui/widgets/custom_appbar.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../../domain/entity/persons_entity.dart';
import '../../state_m/provider/person_details_screen_notifier.dart';
import 'person_details_screen_content.dart';

class PersonDetailsScreenParam {
  final PersonsEntity person;

  const PersonDetailsScreenParam(this.person);
}

class PersonDetailsScreen extends BaseScreen<PersonDetailsScreenParam> {
  static const String routeName = "/PersonDetailsScreen";

  const PersonDetailsScreen({
    Key? key,
    required PersonDetailsScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _PersonDetailsScreenState createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {
  late final PersonDetailsScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = PersonDetailsScreenNotifier(widget.param);
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PersonDetailsScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.param.person.name,
          actions: [
            Padding(
              padding: AppConstants.screenPadding,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.black,
                  size: 80.sp,
                ),
                splashRadius: 21,
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: PersonDetailsScreenContent(),
      ),
    );
  }
}
