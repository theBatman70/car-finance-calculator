import 'package:car_finance_calc/model/car.dart';

class LoanOption extends Car {
  late int downPayment;
  late double arp;
  late int timePeriod;

  LoanOption({
    required super.carPrice,
    required int downPayment,
    required double arp,
    required int timePeriod,
  });
}
