part of 'custom_search_dropdown.dart';

class _DropDownField<T> extends StatefulWidget {
  final ValueNotifier<T?> selectValueNotifier;
  final List<DropdownMenuItem<T>> items;
  final VoidCallback onTap;
  final ValueChanged<T?> onChanged;
  final bool enabled;
  final Widget? hint;
  final String? hintText;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final InputBorder? enableBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Widget? icon;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(T?)? validator;

  const _DropDownField({
    Key? key,
    required this.selectValueNotifier,
    required this.items,
    required this.onTap,
    required this.onChanged,
    required this.enabled,
    this.validator,
    this.hint,
    this.icon,
    this.hintText,
    this.hintStyle,
    this.border,
    this.enableBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.fillColor,
    this.contentPadding,
  }) : super(key: key);

  @override
  State<_DropDownField<T>> createState() => _DropDownFieldState<T>();
}

class _DropDownFieldState<T> extends State<_DropDownField<T>> {
  T? selectValue = null;

  @override
  void initState() {
    super.initState();
    widget.selectValueNotifier.addListener(() {
      if (mounted)
        setState(() {
          selectValue = widget.selectValueNotifier.value;
          widget.onChanged.call(selectValue);
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enabled == true ? widget.onTap : null,
      child: AbsorbPointer(
        absorbing: true,
        child: DropdownButtonFormField<T>(
          value: selectValue,
          items: widget.items,
          onChanged: (_) {},
          validator: widget.validator,
          icon: widget.icon,
          hint: widget.hint,
          style: TextStyle(
            fontSize: 35.sp,
            fontFamily: AppConfig().themeData.textTheme.bodyText1?.fontFamily,
          ),
          decoration: InputDecoration(
            filled: true,
            isDense: true,
            enabled: widget.enabled,
            contentPadding: widget.contentPadding ??
                const EdgeInsetsDirectional.only(start: 16),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            fillColor: widget.fillColor,
            border: widget.border,
            errorBorder: widget.errorBorder,
            enabledBorder: widget.enableBorder,
            disabledBorder: widget.disabledBorder ?? widget.border,
            focusedErrorBorder: widget.focusedErrorBorder,
            focusedBorder: widget.focusedBorder,
          ),
          isExpanded: true,
        ),
      ),
    );
  }
}
