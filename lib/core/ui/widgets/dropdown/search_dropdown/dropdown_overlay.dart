part of 'custom_search_dropdown.dart';

class _DropdownOverlay<T> extends StatefulWidget {
  final ValueNotifier<T?> selectValueNotifier;
  final String Function(T) getStringFromItem;
  final List<DropdownMenuItem<T>> items;
  final Size size;
  final LayerLink layerLink;
  final VoidCallback hideOverlay;
  final String headerHintText;
  final EdgeInsetsGeometry headerPadding;
  final EdgeInsetsGeometry overlayOuterPadding;
  final EdgeInsetsGeometry listItemPadding;
  final Offset overlayShadowOffset;
  final bool? canCloseOutsideBounds;
  final double? borderRadius;
  final VoidCallback? onSearchTap;
  final Color? backgroundColor;
  final Color? iconColor;

  const _DropdownOverlay({
    Key? key,
    required this.selectValueNotifier,
    required this.items,
    required this.getStringFromItem,
    required this.size,
    required this.layerLink,
    required this.hideOverlay,
    required this.headerHintText,
    this.borderRadius,
    required this.headerPadding,
    required this.overlayOuterPadding,
    required this.listItemPadding,
    this.overlayShadowOffset = const Offset(0, 6),
    this.canCloseOutsideBounds,
    this.onSearchTap,
    this.backgroundColor,
    this.iconColor,
  }) : super(key: key);

  @override
  State<_DropdownOverlay<T>> createState() => DropdownOverlayState<T>();
}

class DropdownOverlayState<T> extends State<_DropdownOverlay<T>> {
  bool displayOverly = true;
  bool displayOverlayBottom = true;
  late List<DropdownMenuItem<T>> items;
  late List<DropdownMenuItem<T>> filteredItems;
  final key1 = GlobalKey(), key2 = GlobalKey();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    items = widget.items;
    filteredItems = items;
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // border radius
    final borderRadius = BorderRadius.circular(widget.borderRadius ?? 0);

    // overlay icon
    final overlayIcon = Icon(
      displayOverlayBottom
          ? Icons.keyboard_arrow_up_rounded
          : Icons.keyboard_arrow_down_rounded,
      color: widget.iconColor ?? Colors.black,
      size: 20,
    );

    // overlay offset
    final overlayOffset = Offset(-12, displayOverlayBottom ? 0 : 60);

    // list padding
    final listPadding = const EdgeInsets.only(top: 8);

    // items list
    final list = items.isNotEmpty
        ? _ItemsList<T>(
            scrollController: scrollController,
            excludeSelected: true,
            itemsWidget: items,
            padding: listPadding,
            listItemPadding: widget.listItemPadding,
            onItemSelect: (value) {
              widget.selectValueNotifier.value = value;
              setState(() => displayOverly = false);
            },
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                S.current.noResultFound,
                style:
                    const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          );

    final content = Container(
      key: key1,
      padding: widget.overlayOuterPadding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              blurRadius: 24.0,
              color: Colors.black.withOpacity(.08),
              offset: widget.overlayShadowOffset,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: AnimatedSection(
            animationDismissed: widget.hideOverlay,
            expand: displayOverly,
            axisAlignment: displayOverlayBottom ? 1.0 : -1.0,
            child: SizedBox(
              key: key2,
              height: items.length >= 4 ? 0.35.sh : null,
              child: ClipRRect(
                borderRadius: borderRadius,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowIndicator();
                    return true;
                  },
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      scrollbarTheme: ScrollbarThemeData(
                        thumbVisibility: MaterialStateProperty.all(true),
                        thickness: MaterialStateProperty.all(5),
                        radius: const Radius.circular(4),
                        thumbColor: MaterialStateProperty.all(
                          Colors.grey[300],
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: widget.headerPadding,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.headerHintText,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 38.sp,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              overlayIcon,
                            ],
                          ),
                        ),
                        _SearchField<T>(
                          onSearchTap: widget.onSearchTap,
                          itemsWidget: filteredItems,
                          getStringFromItem: widget.getStringFromItem,
                          onSearchedItems: (val) {
                            setState(() {
                              items = val;
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        items.length >= 4 ? Expanded(child: list) : list
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final child = Stack(
      children: [
        MediaQuery.of(context).viewInsets.bottom > 0
            ? Positioned(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  // width: 1.0.sw,
                  height: 1.0.sh - MediaQuery.of(context).viewInsets.bottom,
                  alignment: Alignment.bottomCenter,
                  child: content,
                ),
              )
            : Positioned(
                width: widget.size.width + 24,
                child: CompositedTransformFollower(
                  link: widget.layerLink,
                  followerAnchor: displayOverlayBottom
                      ? Alignment.topLeft
                      : Alignment.bottomLeft,
                  showWhenUnlinked: false,
                  offset: overlayOffset,
                  child: content,
                ),
              ),
      ],
    );

    return GestureDetector(
      onTap: () => setState(() => displayOverly = false),
      child: widget.canCloseOutsideBounds!
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: child,
            )
          : child,
    );
  }

  void closeOverlay() {
    setState(() => displayOverly = false);
  }
}

class _ItemsList<T> extends StatelessWidget {
  final ScrollController scrollController;
  final List<DropdownMenuItem<T>> itemsWidget;
  final bool excludeSelected;
  final ValueSetter<T> onItemSelect;
  final EdgeInsets padding;
  final EdgeInsetsGeometry listItemPadding;

  const _ItemsList({
    Key? key,
    required this.scrollController,
    required this.itemsWidget,
    required this.excludeSelected,
    required this.onItemSelect,
    required this.padding,
    required this.listItemPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        shrinkWrap: true,
        padding: padding,
        itemCount: itemsWidget.length,
        itemBuilder: (_, index) {
          final selected = !excludeSelected;
          return Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.grey[200],
              onTap: () => onItemSelect(itemsWidget[index].value!),
              child: Container(
                color: selected ? Colors.grey[100] : Colors.transparent,
                padding: listItemPadding,
                child: itemsWidget[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SearchField<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>> itemsWidget;
  final Function(List<DropdownMenuItem<T>>) onSearchedItems;
  final String Function(T) getStringFromItem;
  final VoidCallback? onSearchTap;
  const _SearchField({
    Key? key,
    required this.itemsWidget,
    required this.getStringFromItem,
    required this.onSearchedItems,
    this.onSearchTap,
  }) : super(key: key);

  @override
  State<_SearchField<T>> createState() => _SearchFieldState<T>();
}

class _SearchFieldState<T> extends State<_SearchField<T>> {
  final searchCtrl = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchCtrl.dispose();
  }

  void onSearch(String str) {
    final result = widget.itemsWidget
        .where((itemWidget) => widget
            .getStringFromItem(itemWidget.value!)
            .toLowerCase()
            .contains(str.toLowerCase()))
        .toList();

    widget.onSearchedItems(result);
  }

  void onClear() {
    if (searchCtrl.text.isNotEmpty) {
      searchCtrl.clear();
      widget.onSearchedItems(widget.itemsWidget);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: searchCtrl,
        onChanged: onSearch,
        onTap: widget.onSearchTap,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[50],
          constraints: const BoxConstraints.tightFor(height: 40),
          contentPadding: EdgeInsets.zero,
          // hintText: 'Search',
          hintText: S.current.search,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 40.sp),
          prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 22),
          suffixIcon: GestureDetector(
            onTap: onClear,
            child: const Icon(Icons.close, color: Colors.grey, size: 20),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(.25),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(.25),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(.25),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
