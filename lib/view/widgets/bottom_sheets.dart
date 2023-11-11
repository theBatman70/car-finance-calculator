import 'package:car_finance_calc/constants/colors.dart';
import 'package:car_finance_calc/view/widgets/detail_input_view.dart';
import 'package:car_finance_calc/view/widgets/price_input_view.dart';
import 'package:flutter/material.dart';

void showPriceModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    isScrollControlled: true,
    backgroundColor: pink,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
          height: MediaQuery.sizeOf(context).height * .20,
          child: const PriceInputSection()),
    ),
  );
}

void showDetailModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    isScrollControlled: true,
    backgroundColor: pink,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableScrollableSheet(
        initialChildSize: 0.35,
        maxChildSize: 0.9,
        minChildSize: 0.2,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: const DetailInputSection(),
        ),
      ),
    ),
  );
}
