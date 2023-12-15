import 'package:car_finance_calc/constants/colors.dart';
import 'package:car_finance_calc/model/car.dart';
import 'package:car_finance_calc/model/loan_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../utils/parse_amount_into_int.dart';
import '../../utils/thousands_separator_input_formatter.dart';

class DetailInputSection extends StatefulWidget {
  const DetailInputSection({Key? key}) : super(key: key);

  @override
  State<DetailInputSection> createState() => _DetailInputSectionState();
}

class _DetailInputSectionState extends State<DetailInputSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late LoanOption option;

  // Values
  late int _carPrice;
  late int _downPayment;
  late double _apr;
  late int _timePeriod;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Detail Form is valid');
      _formKey.currentState!.save();
      option.carPrice = _carPrice;
      option.downPayment = _downPayment;
      option.apr = _apr;
      option.timePeriod = _timePeriod;
      option.isEntered = true;
      print(option.carPrice + option.apr);
      option.calculateLoanDetails();
      Navigator.of(context).pop();
      print(option.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    _carPrice = Provider.of<Car>(context).carPrice;
    option = Provider.of<LoanOption>(context);
    return Container(
      color: black,
      height: MediaQuery.sizeOf(context).height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Down Payment :',
                  style: TextStyle(color: pink),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .50,
                  height: 50,
                  child: TextFormField(
                    initialValue: option.isEntered
                        ? NumberFormat('#,###').format(option.downPayment)
                        : null,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    onSaved: (value) {
                      _downPayment = parseAmountIntoInt(value!);
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        fillColor: white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                    validator: (value) => parseAmountIntoInt(value!).isNegative
                        ? 'Invalid Input'
                        : null,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.singleLineFormatter,
                      ThousandsSeparatorInputFormatter(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Annual Rate Percentage :',
                  style: TextStyle(color: pink),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .35,
                  height: 50,
                  child: TextFormField(
                    initialValue:
                        option.isEntered ? option.apr.toString() : null,
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    onSaved: (value) {
                      _apr = parseAmountIntoDouble(value!);
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        suffixText: '%',
                        fillColor: white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                    validator: (value) =>
                        parseAmountIntoDouble(value!).isNegative
                            ? 'Invalid Input'
                            : null,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Time Period :',
                  style: TextStyle(color: pink),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .35,
                  height: 50,
                  child: TextFormField(
                    initialValue:
                        option.isEntered ? option.timePeriod.toString() : null,
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    onSaved: (value) {
                      _timePeriod = parseAmountIntoInt(value!);
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        suffixText: 'months',
                        fillColor: white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                    validator: (value) => parseAmountIntoInt(value!).isNegative
                        ? 'Invalid Input'
                        : null,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 150,
                height: 50,
                decoration: ShapeDecoration(
                    color: yellowGreen,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: TextButton.icon(
                  onPressed: _submitForm,
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
      ),
    );
  }
}
