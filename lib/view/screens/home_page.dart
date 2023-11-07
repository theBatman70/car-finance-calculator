import 'package:car_finance_calc/constants/colors.dart';
import 'package:car_finance_calc/view/widgets/detail_input_view.dart';
import 'package:car_finance_calc/view/widgets/price_input_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController downPaymentController = TextEditingController();
  final TextEditingController arpController = TextEditingController();
  final TextEditingController timePeriodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: black,
        title: const Text('Car Finance Calculator'),
        titleTextStyle: const TextStyle(color: white, fontSize: 20),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsetsDirectional.only(start: 50, end: 50),
        color: yellowGreen,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.drive_eta,
                  color: black,
                  size: 100,
                ),
                Icon(
                  Icons.attach_money,
                  color: white,
                  size: 80,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Tap + to add Loan Details.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: blackish,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 70,
        width: 75,
        margin: const EdgeInsetsDirectional.only(bottom: 5, end: 5),
        decoration: BoxDecoration(
            color: black,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30.0)),
        child: IconButton(
            color: white,
            padding: const EdgeInsets.all(8.0),
            onPressed: () {
              showPriceModalBottomSheet(context);
            },
            icon: const Icon(
              Icons.add,
              size: 30,
            )),
      ),
    );
  }

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
            height: MediaQuery.sizeOf(context).height * .18,
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
}
