import 'package:car_finance_calc/constants/colors.dart';
import 'package:car_finance_calc/model/loan_option.dart';
import 'package:car_finance_calc/view/widgets/bottom_sheets.dart';
import 'package:car_finance_calc/view/widgets/first_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../model/car.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Car>(
      builder: (context, car, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: black,
            title: const Text('Car Finance Calculator'),
            titleTextStyle: const TextStyle(color: white, fontSize: 20),
            centerTitle: true,
          ),
          body: car.isInitialized
              ? Container(
                  width: double.infinity,
                  color: yellowGreen,
                  padding: const EdgeInsets.all(26),
                  child: Column(
                    children: [
                      const Text(
                        'Price of the Car : ',
                        style: TextStyle(color: blackish, fontSize: 25),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            NumberFormat('#,###').format(car.carPrice),
                            style: const TextStyle(color: black, fontSize: 50),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Consumer<LoanOption>(builder: (context, result, child) {
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
                                  trailing: Text(
                                      "\$${result.monthlyPayment.toStringAsFixed(2)}"),
                                ),
                                const Divider(),
                                ListTile(
                                  title: const Text("Total Interest Paid"),
                                  trailing: Text(
                                      "\$${result.totalInterestPaid.toStringAsFixed(2)}"),
                                ),
                                const Divider(),
                                ListTile(
                                  title: const Text("Cost of Loan"),
                                  trailing: Text(
                                      "\$${result.costOfLoan.toStringAsFixed(2)}"),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      })
                    ],
                  ),
                )
              : const AddScreen(),
          floatingActionButton: Consumer<LoanOption>(
              builder: (context, detail, child) => detail.isEntered
                  ? Container()
                  : Container(
                      height: 70,
                      width: 75,
                      margin:
                          const EdgeInsetsDirectional.only(bottom: 5, end: 5),
                      decoration: BoxDecoration(
                          color: black,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: IconButton(
                        color: white,
                        padding: const EdgeInsets.all(8.0),
                        onPressed: () {
                          car.toBeEntered
                              ? showPriceModalBottomSheet(context)
                              : showDetailModalBottomSheet(context);
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                    )),
        );
      },
    );
  }
}
