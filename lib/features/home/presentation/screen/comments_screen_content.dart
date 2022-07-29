import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:starter_application/core/common/responsive/responsive_utils.dart';
import 'package:starter_application/core/common/responsive/responsive_widget.dart';
import 'package:starter_application/core/ui/show_toast.dart';
import 'package:starter_application/features/home/domain/entity/comments_entity.dart';
import 'package:starter_application/features/home/presentation/widget/comment_card.dart';

class CommentsScreenContent extends StatefulWidget {
  final List<CommentsEntity> comments;

  CommentsScreenContent({Key? key, required this.comments}) : super(key: key);

  @override
  _CommentsScreenContentState createState() => _CommentsScreenContentState();
}

class _CommentsScreenContentState extends State<CommentsScreenContent> {
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
          return _buildComment(index, orientation, sizingInfo);
        },
        itemCount: widget.comments.length,
      ),
    );
  }

  Widget _buildComment(
      int index, Orientation orientation, SizingInformation sizingInfo) {
    return CommentCardMobile(
      name: widget.comments[index].name,
      body: widget.comments[index].body,
      email: widget.comments[index].email,
      onTap: () => _onPersonCardTap(sizingInfo, orientation),
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
