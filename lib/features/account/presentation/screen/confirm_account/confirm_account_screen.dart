import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_colors.dart';
import 'package:starter_application/core/common/app_config.dart';
import 'package:starter_application/core/theme/custom_theme_colors.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';
import '../../state_m/provider/confirm_account_screen_notifier.dart';
import 'confirm_account_screen_content.dart';

class ConfirmAccountScreenParam {
  final String email;

  const ConfirmAccountScreenParam({required this.email});
}

class ConfirmAccountScreen extends BaseScreen<ConfirmAccountScreenParam> {
  static const String routeName = "/ConfirmAccountScreen";

  const ConfirmAccountScreen({
    Key? key,
    required ConfirmAccountScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _ConfirmAccountScreenState createState() => _ConfirmAccountScreenState();
}

class _ConfirmAccountScreenState extends State<ConfirmAccountScreen> {
  late final ConfirmAccountScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = ConfirmAccountScreenNotifier(widget.param);
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConfirmAccountScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: CustomAppBar(
          withLeading: true,
          backgroundColor: AppConfig().themeData.colorScheme.primary,
          title: 'Verification',
        ),
        backgroundColor: AppConfig().themeData.scaffoldBackgroundColor,
        body: const ConfirmAccountScreenContent(),
      ),
    );
  }
}
