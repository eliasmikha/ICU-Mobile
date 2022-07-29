import 'dart:math';

import 'package:flutter/services.dart';

/// Format Iraqi phone numbers
/// Formatted phone  number will be like this 0xxx-xxx-xxxx
class IqNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;
    final oldText = oldValue.text;
    int selectionIndex = newValue.selection.end;
    String formattedText = newText.replaceAll(r'-', "");
    final dashCounts = '-'.allMatches(newText).length;
    final oldDashCounts = '-'.allMatches(oldText).length;
    if (newText.length >= oldText.length ||
        (oldDashCounts == 2 &&
            oldText.length == 13 &&
            formattedText.length >= 7)) {
      if (formattedText.length >= 7) {
        formattedText =
            "${formattedText.substring(0, 4)}-${formattedText.substring(4, 7)}-${formattedText.length > 7 ? formattedText.substring(7) : ""}";
        if (selectionIndex >= 4) selectionIndex += dashCounts == 0 ? 1 : 0;
        if (selectionIndex >= 8) selectionIndex += dashCounts < 2 ? 1 : 0;
      } else if (formattedText.length >= 4 && dashCounts == 0) {
        formattedText =
            "${formattedText.substring(0, 4)}-${formattedText.length > 4 ? formattedText.substring(4) : ""}";
        if (selectionIndex >= 4) selectionIndex += 1;
      } else {
        formattedText = newText;
      }
    } else {
      formattedText = newText;
      if (formattedText[formattedText.length - 1] == '-') {
        formattedText = formattedText.substring(0, formattedText.length - 1);
      }
    }

    return TextEditingValue(
      text: formattedText.toString(),
      selection: new TextSelection.collapsed(
        offset: min(selectionIndex, formattedText.length),
      ),
    );
  }
}
