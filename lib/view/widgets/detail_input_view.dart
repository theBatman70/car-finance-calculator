import 'package:car_finance_calc/constants/colors.dart';
import 'package:flutter/material.dart';

class DetailInputSection extends StatefulWidget {
  const DetailInputSection({Key? key}) : super(key: key);

  @override
  _DetailInputSectionState createState() => _DetailInputSectionState();
}

class _DetailInputSectionState extends State<DetailInputSection> {
  final TextEditingController downPaymentController = TextEditingController();
  final TextEditingController arpController = TextEditingController();
  final TextEditingController timePeriodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      height: MediaQuery.sizeOf(context).height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: ListView(
        children: [
          InputRow(
            name: 'Down Payment :',
            textEditingController: downPaymentController,
          ),
          const SizedBox(height: 8),
          InputRow(
            name: 'Annual Interest Rate :',
            textEditingController: arpController,
          ),
          const SizedBox(height: 8),
          InputRow(
            name: 'Time Period :',
            textEditingController: timePeriodController,
          ),
          const SizedBox(height: 25),
          Center(
            child: Container(
              width: 150,
              height: 50,
              decoration: ShapeDecoration(
                  color: yellowGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.done,
                  color: black,
                ),
                label: const Text(
                  'Calculate',
                  style: TextStyle(fontSize: 16, color: blackish),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputRow extends StatelessWidget {
  final String name;
  final TextEditingController textEditingController;

  const InputRow({
    Key? key,
    required this.name,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(color: pink),
        ),
        const SizedBox(width: 16),
        Container(
          width: 180,
          height: 40,
          padding: const EdgeInsets.fromLTRB(10, 8, 8, 3),
          decoration: ShapeDecoration(
              color: pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: textEditingController,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
