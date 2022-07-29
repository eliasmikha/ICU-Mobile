import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:starter_application/generated/l10n.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassicFooter(
      loadingText: "",
      noDataText: S.current.noDataRefresher,
      failedText: S.current.failedRefresher,
      idleText: "",
      canLoadingText: "",
    );
  }
}
