import 'package:car_finance_calc/constants/colors.dart';
import 'package:car_finance_calc/model/car.dart';
import 'package:car_finance_calc/view/screens/home_page.dart';
import 'package:flutter/material.dart';

class PriceInputSection extends StatefulWidget {
  const PriceInputSection({super.key});

  @override
  State<PriceInputSection> createState() => _PriceInputSectionState();
}

class _PriceInputSectionState extends State<PriceInputSection> {
  final TextEditingController priceController = TextEditingController();
  late Car car;
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: blackish,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 8, 8, 3),
                  decoration: ShapeDecoration(
                      color: white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: priceController,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 60,
                height: 50,
                decoration: ShapeDecoration(
                    color: yellowGreen,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: TextButton(
                  child: const Icon(Icons.done),
                  onPressed: () {
                    int? carPrice = parseCarPrice(priceController);
                    if (carPrice == null) {
                      showError = true;
                    } else {
                      // Input is valid, create the Car object and proceed
                      showError = false;
                      car = Car(carPrice: carPrice);
                      Navigator.pop(context);
                      HomePage().showDetailModalBottomSheet(context);
                    }
                  },
                ),
              ),
            ],
          ),
          if (showError == true)
            const Text(
              'Enter a valid price',
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),
        ],
      ),
    );
  }
}

int? parseCarPrice(TextEditingController priceController) {
  String priceText = priceController.text;

  try {
    int carPrice = int.parse(priceText);
    print(carPrice);

    if (carPrice <= 0) {
      // Handle the case where the parsed value is 0 or negative
      // You can show an error message or take another appropriate action
      return null; // Return null to indicate an error
    }

    return carPrice;
  } on FormatException {
    // Handle the parsing error gracefully, e.g., show an error message to the user
    return null; // Return null to indicate an error
  }
}
