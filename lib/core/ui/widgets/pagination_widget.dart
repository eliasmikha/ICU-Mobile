import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../constants/app/app_constants.dart';
import '../../errors/app_errors.dart';
import '../../results/result.dart';
import 'footer_widget.dart';

/// Use this widget to do pagination on a list of items
/// [firstUnit] could be page,offset,..ect, this is the value that indicate pagination first page
/// [nextUnit] could be page,offset,..ect, this is the value that indicate the pagination next page
/// [unitLength] define how many items are in a single unit
class PaginationWidget<T> extends StatefulWidget {
  final RefreshController refreshController;
  final Future<Result<AppErrors, List<T>>> Function(int unit) getItems;
  final void Function(List<T> items, int nextUnit) onDataFetched;
  final int nextUnit;
  final int firstUnit;
  final bool enablePullDown;
  final bool enablePullUp;
  final List<T> initialItems;
  final int? unitLength;
  final Widget? footer;
  final Widget? child;
  final Axis? scrollDirection;

  const PaginationWidget({
    Key? key,
    required this.refreshController,
    required this.initialItems,
    required this.onDataFetched,
    required this.getItems,
    this.child,
    this.firstUnit = AppConstants.paginationFirstPage,
    this.nextUnit = AppConstants.paginationFirstPage + 1,
    this.scrollDirection,
    this.footer,
    this.enablePullDown = true,
    this.enablePullUp = true,
    this.unitLength,
  }) : super(key: key);

  @override
  State<PaginationWidget<T>> createState() => _PaginationWidgetState<T>();
}

class _PaginationWidgetState<T> extends State<PaginationWidget<T>> {
  late int _nextUnit;
  bool _endLoadingProducts = false;
  CancelToken cancelToken = CancelToken();
  late List<T> _items;
  @override
  void initState() {
    super.initState();
    _nextUnit = widget.nextUnit;
    _items = List.from(widget.initialItems);
    _endLoadingProducts = itemsLessThanUnitLength(_items.length);
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: widget.enablePullDown,
      scrollDirection: widget.scrollDirection,
      controller: widget.refreshController,
      onLoading: _endLoadingProducts
          ? null
          : () async {
              loadList();
            },
      onRefresh: () async => _refreshList(),
      enablePullUp: enablePullUp(),
      footer: widget.footer ?? FooterWidget(),
      child: widget.child,
    );
  }

  /// Refresh the items list
  void _refreshList() async {
    _endLoadingProducts = false;
    _nextUnit = widget.firstUnit;
    await _fetchNewItems(true);

    setState(() {
      widget.onDataFetched(_items, _nextUnit);
      widget.refreshController.refreshCompleted();
    });
  }

  /// Fetch new  items
  void loadList() async {
    if (_endLoadingProducts) {
      widget.refreshController.loadComplete();
      return;
    }
    await _fetchNewItems(false);

    setState(() {
      widget.onDataFetched(_items, _nextUnit);
      widget.refreshController.loadComplete();
    });
  }

  /// Refresh items or fetch new items
  Future<void> _fetchNewItems(bool isRefresh) async {
    if (!cancelToken.isCancelled) cancelToken.cancel();
    cancelToken = CancelToken();

    final result = await widget.getItems(_nextUnit++);

    if (result.hasDataOnly) {
      final newListItems = result.data ?? [];

      /// Check if Pagination has ended
      if (newListItems.length == 0 ||
          itemsLessThanUnitLength(newListItems.length)) {
        _endLoadingProducts = true;
      }
      if (isRefresh) {
        _items = List.from(newListItems);
      } else
        _items.addAll(newListItems);
    } else {
      if (!isRefresh) _nextUnit--;
    }
  }

  bool enablePullUp() {
    return widget.enablePullUp &&
        (!_endLoadingProducts && !widget.refreshController.isRefresh);
  }

  bool itemsLessThanUnitLength(int newItemsLength) =>
      widget.unitLength != null && newItemsLength < widget.unitLength!;
}
