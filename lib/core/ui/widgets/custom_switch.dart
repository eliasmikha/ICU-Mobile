import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final ValueChanged<bool>? onChanged;
  final bool value;

  const CustomSwitch({
    Key? key,
    this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Material(
        child: InkWell(
          onTap: onChanged == null
              ? null
              : () {
                  onChanged!.call(!value);
                },
          splashFactory: NoSplash.splashFactory,
          child: Stack(
            children: [
              Container(
                height: 80,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.white,
                  border: Border.all(
                    color: value
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).disabledColor,
                    width: 13,
                  ),
                ),
              ),
              AnimatedPositionedDirectional(
                end: value ? 0 : 70,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: value
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).disabledColor,
                  ),
                ),
                duration: const Duration(milliseconds: 500),
                curve: Curves.bounceOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
