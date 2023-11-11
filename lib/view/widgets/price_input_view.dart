import 'package:car_finance_calc/constants/colors.dart';
import 'package:car_finance_calc/model/car.dart';
import 'package:car_finance_calc/view/widgets/bottom_sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../utils/parse_amount_into_int.dart';
import '../../utils/thousands_separator_input_formatter.dart';

class PriceInputSection extends StatefulWidget {
  const PriceInputSection({super.key});

  @override
  State<PriceInputSection> createState() => _PriceInputSectionState();
}

class _PriceInputSectionState extends State<PriceInputSection> {
  final TextEditingController priceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Car car;

  int _priceInput = 0;

  @override
  void dispose() {
    super.dispose();
    priceController.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Price Form is valid');
      _formKey.currentState!.save();
      car.carPrice = _priceInput;
      print(car.carPrice);
      Navigator.pop(context);
      showDetailModalBottomSheet(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    car = Provider.of<Car>(context);
    return Container(
      color: blackish,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: ListView(
        children: [
          const Text(
            'Enter the Total Price : ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * .70,
                  child: TextFormField(
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    onSaved: (value) {
                      _priceInput = parseAmountIntoInt(value!);
                    },
                    keyboardType: TextInputType.number,
                    controller: priceController,
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
              ),
              const SizedBox(width: 10),
              Container(
                width: 70,
                height: 60,
                decoration: ShapeDecoration(
                    color: yellowGreen,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: TextButton(
                  onPressed: _submitForm,
                  child: const Icon(Icons.done),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
