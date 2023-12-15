import 'package:car_finance_calc/model/loan_option.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InputDetails extends StatelessWidget {
  const InputDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoanOption>(
      builder: (context, option, child) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ListTile(
              title: const Text("Down Payment"),
              trailing: Text(
                NumberFormat('#,###').format(option.monthlyPayment),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text("Annual Rate Percentage"),
              trailing: Text('${option.apr} %'),
            ),
            const Divider(),
            ListTile(
              title: const Text("Time Period"),
              trailing: Text('${option.timePeriod} months'),
            ),
            // Add more user input details as needed
          ],
        ),
      ),
    );
  }
}
