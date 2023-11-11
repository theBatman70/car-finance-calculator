import 'package:flutter/material.dart';

class PercentageEditingController extends TextEditingController {
  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    final formattedText = '$text%'; // Add the percentage symbol
    return TextSpan(
      text: formattedText,
      style: style,
    );
  }
}

class MonthsEditingController extends TextEditingController {
  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    final formattedText = '$text months'; // Add the Months symbol
    return TextSpan(
      text: formattedText,
      style: style,
    );
  }
}
