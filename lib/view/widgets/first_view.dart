import 'package:car_finance_calc/constants/colors.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
