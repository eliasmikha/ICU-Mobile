import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:starter_application/core/common/responsive/responsive_utils.dart';
import 'package:starter_application/core/common/responsive/responsive_widget.dart';
import 'package:starter_application/core/ui/show_toast.dart';
import 'package:starter_application/features/home/domain/entity/people_entity.dart';
import 'package:starter_application/features/home/presentation/widget/person_card_mobile.dart';
import 'package:starter_application/features/home/presentation/widget/person_card_tablet.dart';

class PeopleScreenContent extends StatefulWidget {
  final List<PersonEntity> people;

  PeopleScreenContent({Key? key, required this.people}) : super(key: key);

  @override
  _PeopleScreenContentState createState() => _PeopleScreenContentState();
}

class _PeopleScreenContentState extends State<PeopleScreenContent> {
  var peopleListHeight;
  var peopleListPortraitPadding;
  var peopleListLandScapePadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return ResponsiveWidget(builder: (context, sizingInfo, orientation) {
      _initValues(orientation);
      return _buildPeopleList(orientation, sizingInfo);
    });
  }

  Container _buildPeopleList(
    Orientation orientation,
    SizingInformation sizingInfo,
  ) {
    return Container(
      margin: EdgeInsets.only(
        top: orientation == Orientation.landscape ? 200.h : 0,
      ),
      height: peopleListHeight,
      width: 1.sw,
      child: ListView.separated(
        scrollDirection: getValueForOrientation(
          context,
          portrait: Axis.vertical,
          landscape: Axis.horizontal,
        )!,
        padding: getValueForOrientation(
          context,
          portrait: peopleListPortraitPadding,
          landscape: peopleListLandScapePadding,
        ),
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 30.h,
            width: 30.w,
          );
        },
        itemBuilder: (context, index) {
          return _buildPersonCard(index, orientation, sizingInfo);
        },
        itemCount: widget.people.length,
      ),
    );
  }

  Widget _buildPersonCard(
      int index, Orientation orientation, SizingInformation sizingInfo) {
    return ScreenTypeLayout(
      mobile: PersonCardMobile(
        name: widget.people[index].name,
        age: widget.people[index].age,
        height: orientation == Orientation.portrait ? 200.h : peopleListHeight!,
        width: orientation == Orientation.landscape ? peopleListHeight : null,
        onTap: () => _onPersonCardTap(sizingInfo, orientation),
      ),
      tablet: PersonCardTablet(
        name: widget.people[index].name,
        age: widget.people[index].age,
        height: orientation == Orientation.portrait ? 200.h : peopleListHeight!,
        width: orientation == Orientation.landscape ? peopleListHeight : null,
        onTap: () => _onPersonCardTap(sizingInfo, orientation),
      ),
    );
  }

  /// Logic

  void _initValues(Orientation orientation) {
    peopleListHeight = orientation == Orientation.portrait ? null : 200.w;
    peopleListPortraitPadding = EdgeInsets.symmetric(
      vertical: 100.h,
      horizontal: 50.w,
    );
    peopleListLandScapePadding = EdgeInsets.symmetric(
      vertical: 0,
      horizontal: 20.w,
    );
  }

  void _onPersonCardTap(SizingInformation sizingInfo, Orientation orientation) {
    CustomToast.show(
      "Device Type: ${sizingInfo.isMobile ? "Mobile" : "Tablet"}\n\n Orientation: ${orientation == Orientation.portrait ? "Portrait" : "Landcape"}",
    );
  }
}
