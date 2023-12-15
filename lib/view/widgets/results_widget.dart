import 'package:car_finance_calc/model/loan_option.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({super.key, result});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoanOption>(
      builder: (context, result, child) {
        if (result.isEntered) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text("Monthly Payment"),
                  trailing:
                      Text(NumberFormat('#,###').format(result.monthlyPayment)),
                ),
                const Divider(),
                ListTile(
                  title: const Text("Total Interest Paid"),
                  trailing: Text(
                      NumberFormat('#,###').format(result.totalInterestPaid)),
                ),
                const Divider(),
                ListTile(
                  title: const Text("Total Cost of Loan"),
                  trailing:
                      Text(NumberFormat('#,###').format(result.costOfLoan)),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
